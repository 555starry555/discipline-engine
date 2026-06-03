import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/number_utils.dart';
import '../../../domain/providers/task_providers.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_dialog.dart';
import '../../widgets/task/pain_level_indicator.dart';
import '../../widgets/task/completion_animation.dart';

/// 任务详情页面
class TaskDetailPage extends ConsumerWidget {
  final int taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);

    return FutureBuilder(
      future: db.taskDao.getTaskById(taskId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('任务详情')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final task = snapshot.data;
        if (task == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('任务详情')),
            body: const Center(child: Text('任务不存在')),
          );
        }

        final levelColor = AppColors.getLevelColor(task.level);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('任务详情'),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _handleDelete(context, ref, task.id),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 等级标签
                Row(
                  children: [
                    PainLevelIndicator(level: task.level),
                    const SizedBox(width: AppDimensions.sm),
                    if (task.isDailyHabit)
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
                          '每日习惯',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: AppDimensions.md),

                // 任务标题
                Text(task.title, style: AppTypography.h2),
                const SizedBox(height: AppDimensions.sm),

                // 任务描述
                if (task.description != null && task.description!.isNotEmpty)
                  Text(
                    task.description!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                const SizedBox(height: AppDimensions.lg),

                // 任务信息卡片
                Container(
                  padding: const EdgeInsets.all(AppDimensions.md),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusMedium,
                    ),
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
                      _buildInfoRow(
                        '难度等级',
                        task.level,
                        levelColor,
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        '基础积分',
                        '+${task.basePoints} ⭐',
                        AppColors.accent,
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        '经验奖励',
                        '+${task.basePoints} EXP',
                        AppColors.success,
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        '痛苦值',
                        '${task.painValue}/10',
                        task.painValue >= 8 ? AppColors.danger : AppColors.textPrimary,
                      ),
                      if (task.hasBet) ...[
                        _buildDivider(),
                        _buildInfoRow(
                          '押注积分',
                          '${task.betPoints} 分',
                          AppColors.danger,
                        ),
                      ],
                      _buildDivider(),
                      _buildInfoRow(
                        '创建时间',
                        AppDateUtils.formatDateTimeChinese(task.createdAt),
                        AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimensions.xl),

                // 完成按钮
                AppButton(
                  text: '完成任务',
                  icon: Icons.check_circle_outline,
                  isExpanded: true,
                  size: AppButtonSize.large,
                  onPressed: () => _handleComplete(context, ref, task),
                ),
                const SizedBox(height: AppDimensions.md),

                // 每日积分上限提示
                if (task.level != 'C')
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.md),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusSmall,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text('💡', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: AppDimensions.sm),
                        Expanded(
                          child: Text(
                            'S/A/B级任务共享每日100分上限，超出部分不计入积分（经验不受限）',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: AppDimensions.xxl),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium),
          Text(
            value,
            style: AppTypography.labelLarge.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: AppColors.divider);
  }

  Future<void> _handleComplete(
    BuildContext context,
    WidgetRef ref,
    dynamic task,
  ) async {
    final taskService = ref.read(taskServiceProvider);

    try {
      final (earnedPoints, earnedExp, bonusPoints, overflowPoints, betReturned) =
          await taskService.completeTask(taskId);

      if (context.mounted) {
        await CompletionAnimationDialog.show(
          context: context,
          earnedPoints: earnedPoints,
          earnedExp: earnedExp,
          bonusPoints: bonusPoints,
        );
        if (context.mounted) {
          context.pop();
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    }
  }

  Future<void> _handleDelete(
      BuildContext context, WidgetRef ref, int taskId) async {
    final confirmed = await AppDialog.showConfirm(
      context: context,
      title: '删除任务',
      content: '确定要删除这个任务吗？此操作不可恢复。',
      confirmText: '删除',
    );

    if (confirmed == true && context.mounted) {
      final db = ref.read(appDatabaseProvider);
      await db.taskDao.deactivateTask(taskId);
      if (context.mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('任务已删除'),
            backgroundColor: AppColors.textSecondary,
          ),
        );
      }
    }
  }
}
