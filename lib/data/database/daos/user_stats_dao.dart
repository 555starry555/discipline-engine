import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_stats_table.dart';

part 'user_stats_dao.g.dart';

/// 用户统计DAO
@DriftAccessor(tables: [UserStatsTable])
class UserStatsDao extends DatabaseAccessor<AppDatabase>
    with _$UserStatsDaoMixin {
  UserStatsDao(AppDatabase db) : super(db);

  /// 获取用户统计数据
  Future<UserStatsTableData?> getUserStats() {
    return (select(userStatsTable)..limit(1)).getSingleOrNull();
  }

  /// 监听用户统计数据变化
  Stream<UserStatsTableData?> watchUserStats() {
    return (select(userStatsTable)..limit(1)).watchSingleOrNull();
  }

  /// 初始化用户统计数据（首次启动时调用）
  Future<void> initUserStats() async {
    final existing = await getUserStats();
    if (existing == null) {
      await into(userStatsTable).insert(
        UserStatsTableCompanion.insert(
          currentPoints: const Value(0),
          totalPoints: const Value(0),
          totalExp: const Value(0),
          currentStreak: const Value(0),
          longestStreak: const Value(0),
          dailyUndoCount: const Value(0),
        ),
      );
    }
  }

  /// 更新积分
  Future<void> updatePoints({
    required int currentPoints,
    required int totalPoints,
  }) async {
    final stats = await getUserStats();
    if (stats != null) {
      await (update(userStatsTable)..where((t) => t.id.equals(stats.id))).write(
        UserStatsTableCompanion(
          currentPoints: Value(currentPoints),
          totalPoints: Value(totalPoints),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// 更新经验值
  Future<void> updateExp(int totalExp) async {
    final stats = await getUserStats();
    if (stats != null) {
      await (update(userStatsTable)..where((t) => t.id.equals(stats.id))).write(
        UserStatsTableCompanion(
          totalExp: Value(totalExp),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// 更新连续打卡信息
  Future<void> updateStreak({
    required int currentStreak,
    required int longestStreak,
    required DateTime lastCheckInDate,
  }) async {
    final stats = await getUserStats();
    if (stats != null) {
      await (update(userStatsTable)..where((t) => t.id.equals(stats.id))).write(
        UserStatsTableCompanion(
          currentStreak: Value(currentStreak),
          longestStreak: Value(longestStreak),
          lastCheckInDate: Value(lastCheckInDate),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// 更新每日撤销计数
  Future<void> updateDailyUndoCount({
    required int dailyUndoCount,
    required DateTime lastUndoDate,
  }) async {
    final stats = await getUserStats();
    if (stats != null) {
      await (update(userStatsTable)..where((t) => t.id.equals(stats.id))).write(
        UserStatsTableCompanion(
          dailyUndoCount: Value(dailyUndoCount),
          lastUndoDate: Value(lastUndoDate),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }
}
