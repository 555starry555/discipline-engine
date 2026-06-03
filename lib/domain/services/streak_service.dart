import '../../core/utils/date_utils.dart';
import '../../data/database/app_database.dart';

/// 连续打卡服务
class StreakService {
  final AppDatabase _db;

  StreakService(this._db);

  /// 完成任务后更新连续打卡天数
  Future<void> updateStreakAfterCompletion() async {
    final stats = await _db.userStatsDao.getUserStats();
    if (stats == null) return;

    final now = DateTime.now();
    final today = AppDateUtils.today();
    final lastCheckIn = stats.lastCheckInDate;

    int newStreak;
    int newLongestStreak = stats.longestStreak;

    if (lastCheckIn == null) {
      // 首次打卡
      newStreak = 1;
    } else {
      final lastCheckInDate = DateTime(
        lastCheckIn.year,
        lastCheckIn.month,
        lastCheckIn.day,
      );

      if (lastCheckInDate == today) {
        // 今天已经打卡过（同一天完成多个任务），不更新
        return;
      } else if (AppDateUtils.isYesterday(lastCheckIn)) {
        // 昨天打卡了，连续+1
        newStreak = stats.currentStreak + 1;
      } else {
        // 断签了，重新开始
        newStreak = 1;
      }
    }

    if (newStreak > newLongestStreak) {
      newLongestStreak = newStreak;
    }

    await _db.userStatsDao.updateStreak(
      currentStreak: newStreak,
      longestStreak: newLongestStreak,
      lastCheckInDate: now,
    );
  }

  /// 获取当前连续天数
  Future<int> getCurrentStreak() async {
    final stats = await _db.userStatsDao.getUserStats();
    return stats?.currentStreak ?? 0;
  }

  /// 获取最长连续天数
  Future<int> getLongestStreak() async {
    final stats = await _db.userStatsDao.getUserStats();
    return stats?.longestStreak ?? 0;
  }
}
