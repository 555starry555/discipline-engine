import 'package:drift/drift.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/date_utils.dart';
import '../../data/database/app_database.dart';
import '../models/point_type.dart';
import 'point_service.dart';
import 'streak_service.dart';
import 'achievement_service.dart';

/// 任务服务 — 处理任务打卡完成的核心流程
class TaskService {
  final AppDatabase _db;
  final PointService _pointService;
  final StreakService _streakService;
  final AchievementService _achievementService;

  TaskService(
    this._db,
    this._pointService,
    this._streakService,
    this._achievementService,
  );

  /// 完成任务打卡（核心流程）
  /// 返回结果：(earnedPoints, earnedExp, bonusPoints, overflowPoints, betReturnedPoints)
  Future<(int, int, int, int, int)> completeTask(int taskId) async {
    // 1. 获取任务信息
    final task = await _db.taskDao.getTaskById(taskId);
    if (task == null) {
      throw Exception('任务不存在');
    }

    // 2. 检查今天是否已完成（禁止重复打卡）
    final isCompleted = await _db.taskLogDao.isTaskCompletedToday(taskId);
    if (isCompleted) {
      throw Exception('该任务今天已完成，不能重复打卡');
    }

    // 3. 计算 earnedPoints（考虑每日上限）
    final (earnedPoints, overflowPoints) = await _pointService.calculateEarnedPoints(
      taskId: taskId,
      basePoints: task.basePoints,
      level: task.level,
    );

    // 4. 计算 earnedExp = basePoints（经验不受上限影响）
    final earnedExp = task.basePoints;

    // 5. 获取当前连续打卡信息，计算bonus
    final stats = await _db.userStatsDao.getUserStats();
    final currentStreak = stats?.currentStreak ?? 0;
    final bonusPoints = _pointService.calculateStreakBonus(earnedPoints, currentStreak);

    // 6. 押注退还积分
    int betReturnedPoints = 0;
    if (task.hasBet && task.betPoints > 0) {
      betReturnedPoints = task.betPoints;
    }

    // 7. 创建 TaskLog
    final now = DateTime.now();
    await _db.taskLogDao.createTaskLog(
      TaskLogTableCompanion.insert(
        taskId: taskId,
        date: AppDateUtils.today(),
        completedAt: Value(now),
        earnedPoints: earnedPoints,
        earnedExp: earnedExp,
        basePoints: task.basePoints,
        bonusPoints: Value(bonusPoints),
        overflowPoints: Value(overflowPoints),
        betReturnedPoints: Value(betReturnedPoints),
      ),
    );

    // 8. 更新用户积分和经验值
    final totalPointDelta = earnedPoints + bonusPoints + betReturnedPoints;
    if (totalPointDelta > 0) {
      await _pointService.updatePoints(totalPointDelta);
      // 写入积分流水
      await _pointService.writePointLog(
        amount: earnedPoints,
        type: PointType.taskEarned,
        reason: '完成任务「${task.title}」',
        relatedId: taskId.toString(),
      );
      if (bonusPoints > 0) {
        await _pointService.writePointLog(
          amount: bonusPoints,
          type: PointType.bonusStreak,
          reason: '连续打卡${currentStreak}天加成',
          relatedId: taskId.toString(),
        );
      }
    }

    // 更新经验值
    await _pointService.updateExp(earnedExp);

    // 9. 更新连续打卡
    await _streakService.updateStreakAfterCompletion();

    // 10. 检查并解锁成就
    await _achievementService.checkAndUnlockAchievements();

    // 返回结果
    return (earnedPoints, earnedExp, bonusPoints, overflowPoints, betReturnedPoints);
  }

  /// 创建新任务
  Future<int> createTask({
    required String title,
    String? description,
    required int painValue,
    bool isDailyHabit = false,
    bool hasBet = false,
    int betPoints = 0,
    DateTime? dueDate,
  }) async {
    final level = AppConstants.getLevelForPainValue(painValue);
    final basePoints = AppConstants.getBasePointsForPainValue(painValue);
    final now = DateTime.now();

    final taskId = await _db.taskDao.createTask(
      TaskTableCompanion.insert(
        title: title,
        description: Value(description),
        painValue: painValue,
        level: level,
        basePoints: basePoints,
        isDailyHabit: Value(isDailyHabit),
        hasBet: Value(hasBet),
        betPoints: Value(betPoints),
        dueDate: Value(dueDate),
      ),
    );

    // 检查"初次启动"成就
    await _achievementService.checkAndUnlockAchievements();

    return taskId;
  }

  /// 获取活跃任务列表
  Future<List<TaskTableData>> getActiveTasks() {
    return _db.taskDao.getActiveTasks();
  }

  /// 监听活跃任务列表
  Stream<List<TaskTableData>> watchActiveTasks() {
    return _db.taskDao.watchActiveTasks();
  }

  /// 根据ID获取任务
  Future<TaskTableData?> getTaskById(int id) {
    return _db.taskDao.getTaskById(id);
  }

  /// 撤销打卡
  Future<void> undoTaskCompletion(int taskLogId) async {
    // 检查撤销次数限制
    final stats = await _db.userStatsDao.getUserStats();
    if (stats == null) return;

    final today = AppDateUtils.today();
    final lastUndoDate = stats.lastUndoDate;
    int currentUndoCount = stats.dailyUndoCount;

    // 如果上次撤销不是今天，重置计数
    if (lastUndoDate == null || !AppDateUtils.isToday(lastUndoDate)) {
      currentUndoCount = 0;
    }

    if (currentUndoCount >= AppConstants.dailyUndoLimit) {
      throw Exception('今天已撤销${AppConstants.dailyUndoLimit}次，达到上限');
    }

    // 获取要撤销的日志
    final logs = await _db.taskLogDao.getLogsByDate(today);
    final targetLog = logs.where((l) => l.id == taskLogId).firstOrNull;
    if (targetLog == null) {
      throw Exception('只能撤销当天的打卡记录');
    }
    if (targetLog.isRevoked) {
      throw Exception('该记录已撤销');
    }

    // 撤销打卡
    await _db.taskLogDao.revokeTaskLog(taskLogId);

    // 扣回积分和经验
    final totalDeduct = targetLog.earnedPoints + targetLog.bonusPoints + targetLog.betReturnedPoints;
    if (totalDeduct > 0) {
      await _pointService.updatePoints(-totalDeduct);
      await _pointService.writePointLog(
        amount: -totalDeduct,
        type: PointType.undoCheckin,
        reason: '撤销打卡',
        relatedId: taskLogId.toString(),
      );
    }

    // 扣回经验值
    final statsUpdated = await _db.userStatsDao.getUserStats();
    if (statsUpdated != null && targetLog.earnedExp > 0) {
      final newExp = (statsUpdated.totalExp - targetLog.earnedExp).clamp(0, 999999);
      await _db.userStatsDao.updateExp(newExp);
    }

    // 更新撤销次数
    await _db.userStatsDao.updateDailyUndoCount(
      dailyUndoCount: currentUndoCount + 1,
      lastUndoDate: DateTime.now(),
    );
  }
}
