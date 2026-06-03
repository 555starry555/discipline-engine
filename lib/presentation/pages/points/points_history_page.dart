import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/providers/point_providers.dart';
import '../../../domain/models/point_type.dart';

/// 积分历史页面
class PointsHistoryPage extends ConsumerWidget {
  const PointsHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointLogsAsync = ref.watch(pointLogsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('积分明细'),
      ),
      body: pointLogsAsync.when(
        data: (logs) {
          if (logs.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('📊', style: TextStyle(fontSize: 64)),
                  const SizedBox(height: AppDimensions.md),
                  Text(
                    '暂无积分记录',
                    style: AppTypography.h4.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.sm),
                  Text(
                    '完成任务后积分记录会出现在这里',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppDimensions.md),
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              final pointType = PointType.fromValue(log.type);
              final isPositive = log.amount > 0;

              return Container(
                margin: const EdgeInsets.only(bottom: AppDimensions.sm),
                padding: const EdgeInsets.all(AppDimensions.md),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textSecondary.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 图标
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isPositive
                            ? AppColors.success.withValues(alpha: 0.1)
                            : AppColors.danger.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          _getTypeEmoji(pointType),
                          style: const TextStyle(fontSize: 18),
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
                            log.reason,
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${pointType.label} · ${AppDateUtils.formatRelativeTime(log.createdAt)}',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 积分变化
                    Text(
                      isPositive ? '+${log.amount}' : '${log.amount}',
                      style: AppTypography.numberSmall.copyWith(
                        color: isPositive ? AppColors.success : AppColors.danger,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }

  String _getTypeEmoji(PointType type) {
    switch (type) {
      case PointType.taskEarned:
        return '⭐';
      case PointType.bonusStreak:
        return '🔥';
      case PointType.rewardRedeem:
        return '🎁';
      case PointType.undoCheckin:
        return '↩️';
    }
  }
}
