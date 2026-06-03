import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../domain/providers/point_providers.dart';
import '../../../domain/providers/user_stats_providers.dart';
import '../../../domain/providers/achievement_providers.dart';
import 'widgets/level_badge.dart';
import 'widgets/achievement_grid.dart';
import 'widgets/settings_menu.dart';

/// 我的页面
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(userStatsProvider);
    final levelAsync = ref.watch(userLevelProvider);
    final achievementsAsync = ref.watch(achievementsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 标题
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.md,
                  AppDimensions.lg,
                  AppDimensions.md,
                  AppDimensions.sm,
                ),
                child: Text('我的', style: AppTypography.h2),
              ),
            ),

            // 等级徽章
            SliverToBoxAdapter(
              child: statsAsync.when(
                data: (stats) => levelAsync.when(
                  data: (levelData) => GestureDetector(
                    onTap: () => context.push('/level'),
                    child: LevelBadge(
                      level: levelData['level'] as int,
                      levelName: levelData['levelName'] as String,
                      totalExp: stats?.totalExp ?? 0,
                      currentPoints: stats?.currentPoints ?? 0,
                      currentStreak: stats?.currentStreak ?? 0,
                    ),
                  ),
                  loading: () => const SizedBox(height: 140),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                loading: () => const SizedBox(height: 140),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.md),
            ),

            // 快捷入口
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
                child: Row(
                  children: [
                    _buildQuickEntry(
                      context: context,
                      icon: Icons.star_outline,
                      label: '积分明细',
                      color: AppColors.accent,
                      onTap: () => context.push('/points-history'),
                    ),
                    const SizedBox(width: AppDimensions.sm),
                    _buildQuickEntry(
                      context: context,
                      icon: Icons.emoji_events_outlined,
                      label: '成就',
                      color: AppColors.gold,
                      onTap: () => context.push('/achievements'),
                    ),
                    const SizedBox(width: AppDimensions.sm),
                    _buildQuickEntry(
                      context: context,
                      icon: Icons.settings_outlined,
                      label: '设置',
                      color: AppColors.textSecondary,
                      onTap: () => context.push('/settings'),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.lg),
            ),

            // 成就概览
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.md,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('成就', style: AppTypography.h4),
                    GestureDetector(
                      onTap: () => context.push('/achievements'),
                      child: Text(
                        '查看全部',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.sm),
            ),
            SliverToBoxAdapter(
              child: achievementsAsync.when(
                data: (achievements) => AchievementGrid(
                  achievements: achievements.take(6).toList(),
                ),
                loading: () => const SizedBox(height: 120),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.lg),
            ),

            // 设置菜单
            const SliverToBoxAdapter(
              child: SettingsMenu(),
            ),

            // 底部空间
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.xxl),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickEntry({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.md),
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
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
