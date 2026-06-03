import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../data/database/app_database.dart';
import '../../../../domain/providers/point_providers.dart';

/// 许愿清单组件
class WishList extends ConsumerWidget {
  final List<RewardItemTableData> wishes;

  const WishList({super.key, required this.wishes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(userStatsProvider);
    final currentPoints = statsAsync.whenData((s) => s?.currentPoints ?? 0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.sm),
            child: Row(
              children: [
                const Text('⭐', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 6),
                Text('许愿清单', style: AppTypography.h4),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: wishes.length,
              itemBuilder: (context, index) {
                final wish = wishes[index];
                return currentPoints.when(
                  data: (points) => _buildWishItem(wish, points),
                  loading: () => _buildWishItem(wish, 0),
                  error: (_, __) => _buildWishItem(wish, 0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishItem(RewardItemTableData wish, int currentPoints) {
    final progress = currentPoints / wish.pricePoints;
    final clampedProgress = progress.clamp(0.0, 1.0);

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: AppDimensions.sm),
      padding: const EdgeInsets.all(AppDimensions.sm),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('⭐', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  wish.name,
                  style: AppTypography.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          // 进度条
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: clampedProgress,
              backgroundColor: AppColors.border,
              valueColor: AlwaysStoppedAnimation<Color>(
                clampedProgress >= 1.0 ? AppColors.success : AppColors.gold,
              ),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$currentPoints / ${wish.pricePoints}',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
