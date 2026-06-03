import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_providers.dart';
import '../services/reward_service.dart';
import '../../data/database/app_database.dart';

/// 奖励服务 Provider
final rewardServiceProvider = Provider<RewardService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final pointService = ref.watch(pointServiceProvider);
  final achievementService = ref.watch(achievementServiceProvider);
  return RewardService(db, pointService, achievementService);
});

/// 活跃奖励列表 Stream Provider
final activeRewardsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.rewardDao.watchActiveRewards();
});

/// 许愿列表 Stream Provider
final wishListProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.rewardDao.watchWishList();
});

/// 兑换记录 Stream Provider
final redemptionsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.redemptionDao.watchRedemptions(limit: 50);
});

/// 添加奖励表单状态
class AddRewardState {
  final String name;
  final String description;
  final int pricePoints;
  final bool isWish;
  final bool isLoading;
  final String? error;

  const AddRewardState({
    this.name = '',
    this.description = '',
    this.pricePoints = 100,
    this.isWish = false,
    this.isLoading = false,
    this.error,
  });

  AddRewardState copyWith({
    String? name,
    String? description,
    int? pricePoints,
    bool? isWish,
    bool? isLoading,
    String? error,
  }) {
    return AddRewardState(
      name: name ?? this.name,
      description: description ?? this.description,
      pricePoints: pricePoints ?? this.pricePoints,
      isWish: isWish ?? this.isWish,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AddRewardNotifier extends StateNotifier<AddRewardState> {
  final RewardService _rewardService;

  AddRewardNotifier(this._rewardService) : super(const AddRewardState());

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updatePricePoints(int pricePoints) {
    state = state.copyWith(pricePoints: pricePoints);
  }

  void updateIsWish(bool isWish) {
    state = state.copyWith(isWish: isWish);
  }

  Future<int?> submit() async {
    if (state.name.trim().isEmpty) {
      state = state.copyWith(error: '请输入奖励名称');
      return null;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final rewardId = await _rewardService.createReward(
        name: state.name.trim(),
        description:
            state.description.trim().isEmpty ? null : state.description.trim(),
        pricePoints: state.pricePoints,
        isWish: state.isWish,
      );
      state = const AddRewardState();
      return rewardId;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  void reset() {
    state = const AddRewardState();
  }
}

final addRewardProvider =
    StateNotifierProvider.autoDispose<AddRewardNotifier, AddRewardState>((ref) {
  final rewardService = ref.watch(rewardServiceProvider);
  return AddRewardNotifier(rewardService);
});
