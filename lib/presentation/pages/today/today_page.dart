import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/providers/task_providers.dart';
import '../../../domain/providers/point_providers.dart';
import '../../widgets/common/loading_indicator.dart';
import 'widgets/task_card.dart';
import 'widgets/add_task_button.dart';
import 'widgets/daily_progress.dart';

/// 今日页面
class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(activeTasksProvider);
    final todayLogsAsync = ref.watch(taskLogsByDateProvider(AppDateUtils.today()));
    final statsAsync = ref.watch(userStatsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 顶部标题栏
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.md,
                  AppDimensions.lg,
                  AppDimensions.md,
                  AppDimensions.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 日期和问候
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getGreeting(),
                              style: AppTypography.h2,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppDateUtils.formatDateChinese(DateTime.now()),
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        // 积分和连续天数
                        statsAsync.when(
                          data: (stats) => Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Row(
                                  children: [
                                    const Text('⭐', style: TextStyle(fontSize: 14)),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${stats?.currentPoints ?? 0}',
                                      style: AppTypography.labelLarge.copyWith(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if ((stats?.currentStreak ?? 0) > 0) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.accent.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Row(
                                    children: [
                                      const Text('🔥', style: TextStyle(fontSize: 14)),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${stats!.currentStreak}天',
                                        style: AppTypography.labelLarge.copyWith(
                                          color: AppColors.accent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.lg),
                  ],
                ),
              ),
            ),

            // 每日进度
            SliverToBoxAdapter(
              child: todayLogsAsync.when(
                data: (logs) => DailyProgress(
                  completedCount: logs.length,
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // 任务列表标题
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.md,
                  AppDimensions.md,
                  AppDimensions.md,
                  AppDimensions.sm,
                ),
                child: Text(
                  '今日任务',
                  style: AppTypography.h4,
                ),
              ),
            ),

            // 任务列表
            tasksAsync.when(
              data: (tasks) {
                if (tasks.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('📋', style: TextStyle(fontSize: 64)),
                          const SizedBox(height: AppDimensions.md),
                          Text(
                            '还没有任务',
                            style: AppTypography.h4.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.sm),
                          Text(
                            '点击下方按钮创建第一个任务吧！',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.xl),
                          AddTaskButton(
                            onPressed: () => context.push('/create-task'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                  ),
                  sliver: todayLogsAsync.when(
                    data: (logs) {
                      final completedTaskIds =
                          logs.map((l) => l.taskId).toSet();
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index == tasks.length) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: AppDimensions.md,
                                  bottom: AppDimensions.xxl,
                                ),
                                child: AddTaskButton(
                                  onPressed: () => context.push('/create-task'),
                                ),
                              );
                            }
                            final task = tasks[index];
                            final isCompleted =
                                completedTaskIds.contains(task.id);
                            return TaskCard(
                              task: task,
                              isCompleted: isCompleted,
                              onTap: () => context.push('/task/${task.id}'),
                            );
                          },
                          childCount: tasks.length + 1,
                        ),
                      );
                    },
                    loading: () => const SliverFillRemaining(
                      child: LoadingIndicator(message: '加载中...'),
                    ),
                    error: (_, __) => SliverFillRemaining(
                      child: Center(
                        child: Text('加载失败', style: AppTypography.bodyMedium),
                      ),
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: LoadingIndicator(message: '加载任务中...'),
              ),
              error: (e, _) => SliverFillRemaining(
                child: Center(
                  child: Text('加载失败: $e', style: AppTypography.bodyMedium),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 6) return '夜深了 🌙';
    if (hour < 12) return '早上好 ☀️';
    if (hour < 14) return '中午好 🌤️';
    if (hour < 18) return '下午好 🌅';
    return '晚上好 🌙';
  }
}
