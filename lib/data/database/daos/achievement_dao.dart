import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/achievement_table.dart';
import '../../../domain/models/achievement_model.dart';

part 'achievement_dao.g.dart';

/// 成就DAO
@DriftAccessor(tables: [AchievementTable])
class AchievementDao extends DatabaseAccessor<AppDatabase>
    with _$AchievementDaoMixin {
  AchievementDao(AppDatabase db) : super(db);

  /// 获取所有成就
  Future<List<AchievementTableData>> getAllAchievements() {
    return (select(achievementTable)
          ..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .get();
  }

  /// 监听所有成就
  Stream<List<AchievementTableData>> watchAllAchievements() {
    return (select(achievementTable)
          ..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .watch();
  }

  /// 根据code获取成就
  Future<AchievementTableData?> getAchievementByCode(String code) {
    return (select(achievementTable)..where((t) => t.code.equals(code)))
        .getSingleOrNull();
  }

  /// 初始化MVP成就（首次启动时调用）
  Future<void> initAchievements() async {
    final existing = await getAllAchievements();
    if (existing.isNotEmpty) return;

    for (final achievement in DefaultAchievements.achievements) {
      await into(achievementTable).insert(
        AchievementTableCompanion.insert(
          code: achievement['code'] as String,
          name: achievement['name'] as String,
          description: achievement['description'] as String,
          icon: achievement['icon'] as String,
          conditionType: achievement['conditionType'] as String,
          targetValue: achievement['targetValue'] as int,
        ),
      );
    }
  }

  /// 解锁成就
  Future<void> unlockAchievement(String code) async {
    await (update(achievementTable)..where((t) => t.code.equals(code))).write(
      AchievementTableCompanion(
        isUnlocked: const Value(true),
        unlockedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 获取已解锁成就数量
  Future<int> getUnlockedCount() async {
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM achievements WHERE is_unlocked = 1',
      readsFrom: {achievementTable},
    ).getSingle();
    return result.data['count'] as int;
  }
}
