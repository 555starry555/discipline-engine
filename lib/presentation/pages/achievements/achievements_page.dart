import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/providers/achievement_providers.dart';

/// 成就页面
class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('成就'),
      ),
      body: achievementsAsync.when(
        data: (achievements) {
          final unlocked =
              achievements.where((a) => a.isUnlocked).toList();
          final locked =
              achievements.where((a) => !a.isUnlocked).toList();

          return CustomScrollView(
            slivers: [
              // 成就统计
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(AppDimensions.md),
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.gold, AppColors.accent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🏆', style: TextStyle(fontSize: 32)),
                      const SizedBox(width: AppDimensions.md),
                      Column(
                        children: [
                          Text(
                            '${unlocked.length} / ${achievements.length}',
                            style: AppTypography.numberMedium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '已解锁成就',
                            style: AppTypography.bodyMedium.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 已解锁成就
              if (unlocked.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.md,
                    ),
                    child: Text('已解锁', style: AppTypography.h4),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _buildAchievementCard(unlocked[index], true),
                    childCount: unlocked.length,
                  ),
                ),
              ],

              // 未解锁成就
              if (locked.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.md,
                      AppDimensions.md,
                      AppDimensions.md,
                      AppDimensions.sm,
                    ),
                    child: Text('待解锁', style: AppTypography.h4),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _buildAchievementCard(locked[index], false),
                    childCount: locked.length,
                  ),
                ),
              ],

              const SliverToBoxAdapter(
                child: SizedBox(height: AppDimensions.xxl),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }

  Widget _buildAchievementCard(dynamic achievement, bool isUnlocked) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.md,
        vertical: AppDimensions.sm / 2,
      ),
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: isUnlocked
            ? AppColors.gold.withValues(alpha: 0.1)
            : AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: isUnlocked
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
      child: Row(
        children: [
          // 图标
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.gold.withValues(alpha: 0.2)
                  : AppColors.border.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isUnlocked ? achievement.icon : '🔒',
                style: TextStyle(
                  fontSize: 24,
                  color: isUnlocked ? null : AppColors.disabled,
                ),
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
                  achievement.name,
                  style: AppTypography.labelLarge.copyWith(
                    color: isUnlocked
                        ? AppColors.textPrimary
                        : AppColors.disabled,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  achievement.description,
                  style: AppTypography.bodySmall.copyWith(
                    color: isUnlocked
                        ? AppColors.textSecondary
                        : AppColors.disabled,
                  ),
                ),
                if (isUnlocked && achievement.unlockedAt != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '解锁于 ${AppDateUtils.formatDateChinese(achievement.unlockedAt)}',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.gold,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
