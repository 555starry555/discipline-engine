import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/number_utils.dart';
import '../../../domain/providers/point_providers.dart';
import '../../../domain/providers/user_stats_providers.dart';
import '../../widgets/points/points_display.dart';
import 'widgets/points_chart.dart';
import 'widgets/streak_calendar.dart';
import 'widgets/level_progress.dart';

/// 统计页面
class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(userStatsProvider);
    final levelAsync = ref.watch(userLevelProvider);
    final pointsLogsAsync = ref.watch(pointLogsProvider);

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
                child: Text('数据统计', style: AppTypography.h2),
              ),
            ),

            // 积分概览卡片
            SliverToBoxAdapter(
              child: statsAsync.when(
                data: (stats) => PointsSummaryCard(
                  currentPoints: stats?.currentPoints ?? 0,
                  totalPoints: stats?.totalPoints ?? 0,
                  totalExp: stats?.totalExp ?? 0,
                ),
                loading: () => const SizedBox(height: 180),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.md),
            ),

            // 等级进度
            SliverToBoxAdapter(
              child: levelAsync.when(
                data: (levelData) => LevelProgress(
                  level: levelData['level'] as int,
                  levelName: levelData['levelName'] as String,
                  progress: levelData['progress'] as double,
                  totalExp: levelData['totalExp'] as int,
                  currentLevelExp: levelData['currentLevelExp'] as int,
                  nextLevelExp: levelData['nextLevelExp'] as int,
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.md),
            ),

            // 连续打卡日历
            SliverToBoxAdapter(
              child: statsAsync.when(
                data: (stats) => StreakCalendar(
                  currentStreak: stats?.currentStreak ?? 0,
                  longestStreak: stats?.longestStreak ?? 0,
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.md),
            ),

            // 积分走势标题
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.md,
                ),
                child: Text('积分走势', style: AppTypography.h4),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.sm),
            ),

            // 积分走势图表
            SliverToBoxAdapter(
              child: pointsLogsAsync.when(
                data: (logs) => PointsChart(logs: logs),
                loading: () => const SizedBox(height: 200),
                error: (_, __) => const SizedBox.shrink(),
              ),
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
}
