import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../data/database/app_database.dart';

/// 成就网格组件
class AchievementGrid extends StatelessWidget {
  final List<AchievementTableData> achievements;

  const AchievementGrid({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    if (achievements.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
        padding: const EdgeInsets.all(AppDimensions.xl),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Center(
          child: Text(
            '暂无成就',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: AppDimensions.sm,
          crossAxisSpacing: AppDimensions.sm,
          childAspectRatio: 1,
        ),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          return _buildAchievementItem(achievement);
        },
      ),
    );
  }

  Widget _buildAchievementItem(AchievementTableData achievement) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.sm),
      decoration: BoxDecoration(
        color: achievement.isUnlocked
            ? AppColors.gold.withValues(alpha: 0.1)
            : AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: achievement.isUnlocked
            ? Border.all(color: AppColors.gold.withValues(alpha: 0.3))
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondary.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            achievement.isUnlocked ? achievement.icon : '🔒',
            style: TextStyle(
              fontSize: 28,
              color: achievement.isUnlocked ? null : AppColors.disabled,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            achievement.name,
            style: AppTypography.labelSmall.copyWith(
              color: achievement.isUnlocked
                  ? AppColors.textPrimary
                  : AppColors.disabled,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
