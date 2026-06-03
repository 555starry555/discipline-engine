import 'package:drift/drift.dart';
import '../../core/constants/app_constants.dart';
import '../../data/database/app_database.dart';
import '../models/point_type.dart';
import 'point_service.dart';
import 'achievement_service.dart';

/// 奖励服务 — 处理商店兑换逻辑
class RewardService {
  final AppDatabase _db;
  final PointService _pointService;
  final AchievementService _achievementService;

  RewardService(this._db, this._pointService, this._achievementService);

  /// 兑换奖励
  /// 返回错误信息，成功返回 null
  Future<String?> redeemReward(int rewardId) async {
    // 1. 获取奖励信息
    final reward = await _db.rewardDao.getRewardById(rewardId);
    if (reward == null) {
      return '奖励不存在';
    }

    // 2. 检查积分是否足够
    final stats = await _db.userStatsDao.getUserStats();
    if (stats == null) {
      return '用户数据异常';
    }

    if (stats.currentPoints < reward.pricePoints) {
      // 计算差额
      final deficit = reward.pricePoints - stats.currentPoints;
      return '积分还差$deficit分，再完成一个小任务吧。';
    }

    // 3. 扣除积分
    await _pointService.updatePoints(-reward.pricePoints);

    // 4. 创建兑换记录
    await _db.redemptionDao.createRedemption(
      RedemptionTableCompanion.insert(
        rewardId: rewardId,
        rewardNameSnapshot: reward.name,
        costPoints: reward.pricePoints,
      ),
    );

    // 5. 写入积分流水
    await _pointService.writePointLog(
      amount: -reward.pricePoints,
      type: PointType.rewardRedeem,
      reason: '兑换奖励「${reward.name}」',
      relatedId: rewardId.toString(),
    );

    // 6. 检查成就
    await _achievementService.checkAndUnlockAchievements();

    return null; // 成功
  }

  /// 创建奖励
  Future<int> createReward({
    required String name,
    String? description,
    required int pricePoints,
    double? moneyPrice,
    String? imagePath,
    bool isWish = false,
  }) async {
    final now = DateTime.now();
    return _db.rewardDao.createReward(
      RewardItemTableCompanion.insert(
        name: name,
        description: Value(description),
        pricePoints: pricePoints,
        moneyPrice: Value(moneyPrice),
        imagePath: Value(imagePath),
        isWish: Value(isWish),
      ),
    );
  }

  /// 获取活跃奖励列表
  Future<List<RewardItemTableData>> getActiveRewards() {
    return _db.rewardDao.getActiveRewards();
  }

  /// 监听活跃奖励列表
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

  /// 获取兑换记录
  Future<List<RedemptionTableData>> getRedemptions({int limit = 50}) {
    return _db.redemptionDao.getRedemptions(limit: limit);
  }

  /// 监听兑换记录
  Stream<List<RedemptionTableData>> watchRedemptions({int limit = 50}) {
    return _db.redemptionDao.watchRedemptions(limit: limit);
  }

  /// 删除奖励
  Future<void> deactivateReward(int rewardId) {
    return _db.rewardDao.deactivateReward(rewardId);
  }

  /// 标记兑换已使用
  Future<void> markRedemptionAsUsed(int redemptionId) {
    return _db.redemptionDao.markAsUsed(redemptionId);
  }
}
