import '../../data/database/app_database.dart';
import '../../domain/models/achievement_model.dart';

/// 成就服务 — 检查并解锁成就
class AchievementService {
  final AppDatabase _db;

  AchievementService(this._db);

  /// 检查所有成就条件并解锁
  Future<List<String>> checkAndUnlockAchievements() async {
    final unlockedAchievements = <String>[];

    // 获取所有未解锁成就
    final achievements = await _db.achievementDao.getAllAchievements();
    final lockedAchievements = achievements.where((a) => !a.isUnlocked);

    for (final achievement in lockedAchievements) {
      final conditionType =
          AchievementConditionType.fromValue(achievement.conditionType);
      bool shouldUnlock = false;

      switch (conditionType) {
        case AchievementConditionType.taskCreated:
          // 创建第一个任务
          final taskCount = await _db.taskDao.getActiveTaskCount();
          shouldUnlock = taskCount >= achievement.targetValue;
          break;

        case AchievementConditionType.taskCompleted:
          // 完成任务数量
          final completedCount = await _db.taskDao.getCompletedTaskCount();
          shouldUnlock = completedCount >= achievement.targetValue;
          break;

        case AchievementConditionType.sTaskCompleted:
          // 完成S级任务数量
          final sCount = await _db.taskDao.getSTaskCompletedCount();
          shouldUnlock = sCount >= achievement.targetValue;
          break;

        case AchievementConditionType.streakDays:
          // 连续打卡天数
          final stats = await _db.userStatsDao.getUserStats();
          final streak = stats?.currentStreak ?? 0;
          shouldUnlock = streak >= achievement.targetValue;
          break;

        case AchievementConditionType.totalPoints:
          // 累计获得积分
          final stats = await _db.userStatsDao.getUserStats();
          final totalPoints = stats?.totalPoints ?? 0;
          shouldUnlock = totalPoints >= achievement.targetValue;
          break;

        case AchievementConditionType.rewardRedeemed:
          // 兑换奖励数量
          final redeemCount = await _db.redemptionDao.getRedemptionCount();
          shouldUnlock = redeemCount >= achievement.targetValue;
          break;

        case AchievementConditionType.cTaskCompleted:
          // 完成C级任务数量
          final cCount = await _db.taskDao.getCTaskCompletedCount();
          shouldUnlock = cCount >= achievement.targetValue;
          break;
      }

      if (shouldUnlock) {
        await _db.achievementDao.unlockAchievement(achievement.code);
        unlockedAchievements.add(achievement.name);
      }
    }

    return unlockedAchievements;
  }

  /// 获取所有成就
  Future<List<AchievementTableData>> getAllAchievements() {
    return _db.achievementDao.getAllAchievements();
  }

  /// 监听所有成就
  Stream<List<AchievementTableData>> watchAllAchievements() {
    return _db.achievementDao.watchAllAchievements();
  }

  /// 获取已解锁成就数量
  Future<int> getUnlockedCount() {
    return _db.achievementDao.getUnlockedCount();
  }
}
