import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/number_utils.dart';
import '../../../domain/providers/user_stats_providers.dart';
import '../../../domain/providers/point_providers.dart';

/// 等级详情页面
class LevelPage extends ConsumerWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelAsync = ref.watch(userLevelProvider);
    final statsAsync = ref.watch(userStatsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('等级'),
      ),
      body: levelAsync.when(
        data: (levelData) {
          final level = levelData['level'] as int;
          final levelName = levelData['levelName'] as String;
          final progress = levelData['progress'] as double;
          final totalExp = levelData['totalExp'] as int;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.md),
            child: Column(
              children: [
                // 大等级徽章
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.accent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Lv$level',
                          style: AppTypography.h2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          levelName,
                          style: AppTypography.labelMedium.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.lg),

                Text(
                  levelName,
                  style: AppTypography.h2,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  '总经验 $totalExp EXP',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppDimensions.xl),

                // 等级进度
                if (level < 5) ...[
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.lg),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: progress.clamp(0.0, 1.0),
                            backgroundColor: AppColors.border,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                            minHeight: 12,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.md),
                        Text(
                          '距离下一级还需 ${AppNumberUtils.getExpForLevel(level + 1) - totalExp} EXP',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: AppDimensions.lg),

                // 等级列表
                _buildLevelList(level),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }

  Widget _buildLevelList(int currentLevel) {
    final levels = [
      {'level': 1, 'name': '学徒', 'exp': 0, 'emoji': '🌱'},
      {'level': 2, 'name': '践行者', 'exp': 500, 'emoji': '🚶'},
      {'level': 3, 'name': '掌控者', 'exp': 1500, 'emoji': '💪'},
      {'level': 4, 'name': '驱动者', 'exp': 3000, 'emoji': '🚀'},
      {'level': 5, 'name': '自律引擎', 'exp': 6000, 'emoji': '🏆'},
    ];

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('等级路线图', style: AppTypography.h4),
          const SizedBox(height: AppDimensions.md),
          ...levels.map((levelData) {
            final isCurrentOrBelow =
                (levelData['level'] as int) <= currentLevel;
            final isCurrent = (levelData['level'] as int) == currentLevel;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isCurrent
                          ? AppColors.primary
                          : isCurrentOrBelow
                              ? AppColors.success.withValues(alpha: 0.2)
                              : AppColors.border.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        levelData['emoji'] as String,
                        style: TextStyle(
                          fontSize: 18,
                          color: isCurrentOrBelow ? null : AppColors.disabled,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lv${levelData['level']} ${levelData['name']}',
                          style: AppTypography.labelLarge.copyWith(
                            color: isCurrent
                                ? AppColors.primary
                                : isCurrentOrBelow
                                    ? AppColors.textPrimary
                                    : AppColors.disabled,
                          ),
                        ),
                        Text(
                          '${levelData['exp']} EXP',
                          style: AppTypography.labelSmall.copyWith(
                            color: isCurrentOrBelow
                                ? AppColors.textSecondary
                                : AppColors.disabled,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isCurrent)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '当前',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  if (isCurrentOrBelow && !isCurrent)
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20,
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
