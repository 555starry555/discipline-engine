import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/reward_item_table.dart';

part 'reward_dao.g.dart';

/// 奖励商品DAO
@DriftAccessor(tables: [RewardItemTable])
class RewardDao extends DatabaseAccessor<AppDatabase> with _$RewardDaoMixin {
  RewardDao(AppDatabase db) : super(db);

  /// 获取所有活跃奖励
  Future<List<RewardItemTableData>> getActiveRewards() {
    return (select(rewardItemTable)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// 监听活跃奖励列表
  Stream<List<RewardItemTableData>> watchActiveRewards() {
    return (select(rewardItemTable)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  /// 获取许愿列表（isWish = true）
  Future<List<RewardItemTableData>> getWishList() {
    return (select(rewardItemTable)
          ..where((t) => t.isWish.equals(true) & t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// 监听许愿列表
  Stream<List<RewardItemTableData>> watchWishList() {
    return (select(rewardItemTable)
          ..where((t) => t.isWish.equals(true) & t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  /// 根据ID获取奖励
  Future<RewardItemTableData?> getRewardById(int id) {
    return (select(rewardItemTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 创建奖励
  Future<int> createReward(RewardItemTableCompanion reward) {
    return into(rewardItemTable).insert(reward);
  }

  /// 更新奖励
  Future<bool> updateReward(RewardItemTableCompanion reward) async {
    return update(rewardItemTable).replace(reward);
  }

  /// 删除奖励（软删除）
  Future<void> deactivateReward(int id) async {
    await (update(rewardItemTable)..where((t) => t.id.equals(id))).write(
      RewardItemTableCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
