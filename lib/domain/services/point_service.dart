import 'package:drift/drift.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/date_utils.dart';
import '../../data/database/app_database.dart';
import '../models/point_type.dart';

/// 积分服务 — 处理积分计算、每日上限、加成等核心业务逻辑
class PointService {
  final AppDatabase _db;

  PointService(this._db);

  /// 计算任务完成后的实际积分（考虑每日上限）
  /// 返回 (earnedPoints, overflowPoints)
  Future<(int, int)> calculateEarnedPoints({
    required int taskId,
    required int basePoints,
    required String level,
  }) async {
    // C级任务不计入每日上限
    if (level == 'C') {
      return (basePoints, 0);
    }

    // 查询今天S/A/B级任务已获得的积分
    final today = AppDateUtils.today();
    final todayEarned = await _db.taskLogDao.getTodayEarnedPoints(today);
    final remaining = AppConstants.dailyPointCap - todayEarned;

    if (remaining <= 0) {
      // 已达上限，积分全部溢出
      return (0, basePoints);
    }

    final earned = remaining >= basePoints ? basePoints : remaining;
    final overflow = basePoints - earned;
    return (earned, overflow);
  }

  /// 计算连续打卡加成积分
  /// 当 currentStreak 是7的倍数时，earnedPoints * 10%
  int calculateStreakBonus(int earnedPoints, int currentStreak) {
    if (currentStreak > 0 && currentStreak % AppConstants.streakBonusThreshold == 0) {
      return (earnedPoints * AppConstants.streakBonusRate).floor();
    }
    return 0;
  }

  /// 写入积分流水记录
  Future<void> writePointLog({
    required int amount,
    required PointType type,
    required String reason,
    String? relatedId,
  }) async {
    // 获取当前积分余额
    final stats = await _db.userStatsDao.getUserStats();
    final balanceAfter = stats?.currentPoints ?? 0;

    await _db.pointLogDao.createPointLog(
      PointLogTableCompanion.insert(
        amount: amount,
        type: type.value,
        reason: reason,
        relatedId: Value(relatedId),
        balanceAfter: balanceAfter,
      ),
    );
  }

  /// 更新用户积分
  Future<void> updatePoints(int deltaPoints) async {
    final stats = await _db.userStatsDao.getUserStats();
    if (stats == null) return;

    final newCurrent = stats.currentPoints + deltaPoints;
    final newTotal = deltaPoints > 0
        ? stats.totalPoints + deltaPoints
        : stats.totalPoints;

    await _db.userStatsDao.updatePoints(
      currentPoints: newCurrent.clamp(0, 999999),
      totalPoints: newTotal,
    );
  }

  /// 更新用户经验值（不受每日上限影响）
  Future<void> updateExp(int earnedExp) async {
    final stats = await _db.userStatsDao.getUserStats();
    if (stats == null) return;

    await _db.userStatsDao.updateExp(stats.totalExp + earnedExp);
  }
}
