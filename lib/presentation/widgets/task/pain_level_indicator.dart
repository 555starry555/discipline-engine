import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 痛苦等级标签指示器
class PainLevelIndicator extends StatelessWidget {
  final String level; // C/B/A/S
  final bool isCompact;

  const PainLevelIndicator({
    super.key,
    required this.level,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getLevelColor(level);
    final lightColor = AppColors.getLevelLightColor(level);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 8 : 12,
        vertical: isCompact ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isCompact) ...[
            Text(
              _getLevelEmoji(level),
              style: TextStyle(fontSize: isCompact ? 10 : 14),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            level,
            style: (isCompact ? AppTypography.labelSmall : AppTypography.labelMedium)
                .copyWith(color: color),
          ),
        ],
      ),
    );
  }

  String _getLevelEmoji(String level) {
    switch (level.toUpperCase()) {
      case 'S':
        return '🌟';
      case 'A':
        return '🔥';
      case 'B':
        return '💪';
      case 'C':
        return '🌱';
      default:
        return '💪';
    }
  }
}
