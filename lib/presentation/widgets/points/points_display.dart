import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 积分显示组件
class PointsDisplay extends StatelessWidget {
  final int points;
  final double size;
  final bool showIcon;

  const PointsDisplay({
    super.key,
    required this.points,
    this.size = 1.0,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Text(
            '⭐',
            style: TextStyle(fontSize: 18 * size),
          ),
          SizedBox(width: 4 * size),
        ],
        Text(
          _formatPoints(points),
          style: AppTypography.numberMedium.copyWith(
            fontSize: 24 * size,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  String _formatPoints(int points) {
    if (points >= 10000) {
      return '${(points / 1000).toStringAsFixed(1)}k';
    }
    return points.toString();
  }
}

/// 积分详情卡片
class PointsSummaryCard extends StatelessWidget {
  final int currentPoints;
  final int totalPoints;
  final int totalExp;

  const PointsSummaryCard({
    super.key,
    required this.currentPoints,
    required this.totalPoints,
    required this.totalExp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
      padding: const EdgeInsets.all(AppDimensions.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '当前积分',
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$currentPoints',
            style: AppTypography.numberLarge.copyWith(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('累计获得', totalPoints),
              Container(
                width: 1,
                height: 30,
                color: Colors.white.withValues(alpha: 0.3),
              ),
              _buildStatItem('总经验', totalExp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int value) {
    return Column(
      children: [
        Text(
          '$value',
          style: AppTypography.numberSmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
