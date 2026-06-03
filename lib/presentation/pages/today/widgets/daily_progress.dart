import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';

/// 每日进度组件
class DailyProgress extends StatelessWidget {
  final int completedCount;

  const DailyProgress({
    super.key,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
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
          // 进度环
          SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 52,
                  height: 52,
                  child: CircularProgressIndicator(
                    value: _getProgressValue(),
                    strokeWidth: 5,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      completedCount > 0 ? AppColors.success : AppColors.border,
                    ),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '$completedCount',
                  style: AppTypography.numberSmall.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.md),
          // 文字信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getMotivationText(),
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getSubText(),
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getProgressValue() {
    if (completedCount == 0) return 0.0;
    // 每3个任务一个进度段
    return (completedCount / 3).clamp(0.0, 1.0);
  }

  String _getMotivationText() {
    if (completedCount == 0) return '新的一天开始了！';
    if (completedCount < 3) return '继续加油！';
    if (completedCount < 5) return '状态不错！';
    if (completedCount < 10) return '太棒了！';
    return '今天超神！🏆';
  }

  String _getSubText() {
    if (completedCount == 0) return '完成第一个任务开始今天的旅程';
    return '已完成 $completedCount 个任务';
  }
}
