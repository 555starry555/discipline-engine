import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/utils/number_utils.dart';
import '../../../../data/database/app_database.dart';
import '../../../../domain/providers/reward_providers.dart';
import '../../../widgets/common/app_dialog.dart';

/// 奖励卡片组件
class RewardCard extends ConsumerWidget {
  final RewardItemTableData reward;

  const RewardCard({super.key, required this.reward});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.sm),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => _handleDelete(context, ref),
              backgroundColor: AppColors.danger,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: '删除',
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(AppDimensions.radiusMedium),
              ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => _handleRedeem(context, ref),
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.md),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textSecondary.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // 图标
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: reward.isWish
                        ? AppColors.gold.withValues(alpha: 0.2)
                        : AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      reward.isWish ? '⭐' : '🎁',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.md),

                // 信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.name,
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reward.description ?? '',
                        style: AppTypography.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // 价格
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '⭐ ${reward.pricePoints}',
                      style: AppTypography.numberSmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppNumberUtils.pointsToMoneyPrice(reward.pricePoints),
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRedeem(BuildContext context, WidgetRef ref) async {
    final confirmed = await AppDialog.showConfirm(
      context: context,
      title: '兑换奖励',
      content: '确认花费 ${reward.pricePoints} 积分兑换「${reward.name}」？',
      confirmText: '兑换',
    );

    if (confirmed == true && context.mounted) {
      final rewardService = ref.read(rewardServiceProvider);
      final error = await rewardService.redeemReward(reward.id);

      if (context.mounted) {
        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: AppColors.danger,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🎉 兑换成功！'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      }
    }
  }

  Future<void> _handleDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await AppDialog.showConfirm(
      context: context,
      title: '删除奖励',
      content: '确定要删除「${reward.name}」吗？',
      confirmText: '删除',
    );

    if (confirmed == true && context.mounted) {
      final rewardService = ref.read(rewardServiceProvider);
      await rewardService.deactivateReward(reward.id);
    }
  }
}
