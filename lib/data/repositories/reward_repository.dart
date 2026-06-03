import '../database/app_database.dart';

/// 奖励仓库
class RewardRepository {
  final AppDatabase _db;

  RewardRepository(this._db);

  /// 获取活跃奖励
  Future<List<RewardItemTableData>> getActiveRewards() {
    return _db.rewardDao.getActiveRewards();
  }

  /// 监听活跃奖励
  Stream<List<RewardItemTableData>> watchActiveRewards() {
    return _db.rewardDao.watchActiveRewards();
  }

  /// 获取许愿列表
  Future<List<RewardItemTableData>> getWishList() {
    return _db.rewardDao.getWishList();
  }

  /// 监听许愿列表
  Stream<List<RewardItemTableData>> watchWishList() {
    return _db.rewardDao.watchWishList();
  }
}
