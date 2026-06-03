import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../data/database/app_database.dart';
import '../../../../domain/providers/task_providers.dart';
import '../../../widgets/task/pain_level_indicator.dart';
import '../../../widgets/task/streak_badge.dart';
import '../../../widgets/task/completion_animation.dart';

/// 任务卡片组件
class TaskCard extends ConsumerWidget {
  final TaskTableData task;
  final bool isCompleted;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.task,
    this.isCompleted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelColor = AppColors.getLevelColor(task.level);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.sm),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(AppDimensions.md),
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.success.withValues(alpha: 0.1)
                : AppColors.card,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: isCompleted
                ? Border.all(color: AppColors.success.withValues(alpha: 0.3))
                : null,
            boxShadow: [
              BoxShadow(
                color: AppColors.textSecondary.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // 左侧等级色条
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  color: levelColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: AppDimensions.md),

              // 任务信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            task.title,
                            style: AppTypography.bodyLarge.copyWith(
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: isCompleted
                                  ? AppColors.textSecondary
                                  : AppColors.textPrimary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: AppDimensions.sm),
                        PainLevelIndicator(level: task.level, isCompact: true),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          '⭐ +${task.basePoints}',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                        if (task.isDailyHabit) ...[
                          const SizedBox(width: AppDimensions.sm),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '每日',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.primary,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                        if (task.hasBet) ...[
                          const SizedBox(width: AppDimensions.sm),
                          Text(
                            '押注 ${task.betPoints}分',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.danger,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // 右侧完成按钮
              const SizedBox(width: AppDimensions.sm),
              _buildCompleteButton(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteButton(BuildContext context, WidgetRef ref) {
    if (isCompleted) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 22,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _handleComplete(context, ref),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.getLevelLightColor(task.level),
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.getLevelColor(task.level),
            width: 2,
          ),
        ),
        child: Icon(
          Icons.check,
          color: AppColors.getLevelColor(task.level),
          size: 22,
        ),
      ),
    );
  }

  Future<void> _handleComplete(BuildContext context, WidgetRef ref) async {
    final taskService = ref.read(taskServiceProvider);

    try {
      final (earnedPoints, earnedExp, bonusPoints, overflowPoints, betReturned) =
          await taskService.completeTask(task.id);

      if (context.mounted) {
        await CompletionAnimationDialog.show(
          context: context,
          earnedPoints: earnedPoints,
          earnedExp: earnedExp,
          bonusPoints: bonusPoints,
        );
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
}
