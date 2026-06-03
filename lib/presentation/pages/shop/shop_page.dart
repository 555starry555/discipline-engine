import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../domain/providers/reward_providers.dart';
import '../../../domain/providers/point_providers.dart';
import '../../widgets/common/loading_indicator.dart';
import 'widgets/reward_card.dart';
import 'widgets/wish_list.dart';
import 'widgets/add_reward_dialog.dart';

/// 商店页面
class ShopPage extends ConsumerWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsAsync = ref.watch(activeRewardsProvider);
    final wishListAsync = ref.watch(wishListProvider);
    final statsAsync = ref.watch(userStatsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 顶部标题
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.md,
                  AppDimensions.lg,
                  AppDimensions.md,
                  AppDimensions.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('奖励商店', style: AppTypography.h2),
                    // 当前积分显示
                    statsAsync.when(
                      data: (stats) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.accent],
                          ),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          children: [
                            const Text('⭐', style: TextStyle(fontSize: 14)),
                            const SizedBox(width: 4),
                            Text(
                              '${stats?.currentPoints ?? 0}',
                              style: AppTypography.labelLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),

            // 许愿清单
            SliverToBoxAdapter(
              child: wishListAsync.when(
                data: (wishes) {
                  if (wishes.isEmpty) return const SizedBox.shrink();
                  return WishList(wishes: wishes);
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // 所有奖励标题
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.md,
                  AppDimensions.md,
                  AppDimensions.md,
                  AppDimensions.sm,
                ),
                child: Text('全部奖励', style: AppTypography.h4),
              ),
            ),

            // 奖励列表
            rewardsAsync.when(
              data: (rewards) {
                if (rewards.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🎁', style: TextStyle(fontSize: 64)),
                          const SizedBox(height: AppDimensions.md),
                          Text(
                            '还没有奖励',
                            style: AppTypography.h4.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.sm),
                          Text(
                            '添加一些想要的奖励来激励自己吧！',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.xl),
                          _buildAddButton(context),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == rewards.length) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: AppDimensions.md,
                              bottom: AppDimensions.xxl,
                            ),
                            child: _buildAddButton(context),
                          );
                        }
                        return RewardCard(reward: rewards[index]);
                      },
                      childCount: rewards.length + 1,
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: LoadingIndicator(message: '加载奖励中...'),
              ),
              error: (e, _) => SliverFillRemaining(
                child: Center(child: Text('加载失败: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAddRewardDialog(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.md),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, color: AppColors.accent, size: 20),
            const SizedBox(width: AppDimensions.sm),
            Text(
              '添加奖励',
              style: AppTypography.buttonMedium.copyWith(
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddRewardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddRewardDialog(),
    );
  }
}
