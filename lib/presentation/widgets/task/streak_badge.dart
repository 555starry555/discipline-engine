import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 连续打卡徽章
class StreakBadge extends StatelessWidget {
  final int streakDays;

  const StreakBadge({
    super.key,
    required this.streakDays,
  });

  @override
  Widget build(BuildContext context) {
    if (streakDays <= 0) return const SizedBox.shrink();

    final isBonusDay = streakDays % 7 == 0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        gradient: isBonusDay
            ? const LinearGradient(
                colors: [AppColors.gold, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isBonusDay ? null : AppColors.accent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🔥',
            style: TextStyle(fontSize: isBonusDay ? 14 : 12),
          ),
          const SizedBox(width: 4),
          Text(
            '$streakDays天',
            style: AppTypography.labelSmall.copyWith(
              color: isBonusDay ? Colors.white : AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
