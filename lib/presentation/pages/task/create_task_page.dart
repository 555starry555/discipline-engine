import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../domain/providers/task_providers.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_slider.dart';

/// 创建任务页面
class CreateTaskPage extends ConsumerStatefulWidget {
  const CreateTaskPage({super.key});

  @override
  ConsumerState<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends ConsumerState<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  int _painValue = 3;
  bool _isDailyHabit = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createTaskProvider);
    final level = AppConstants.getLevelForPainValue(_painValue);
    final basePoints = AppConstants.getBasePointsForPainValue(_painValue);
    final levelColor = AppColors.getLevelColor(level);
    final isSLevel = level == 'S';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('创建任务'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 任务标题
            Text('任务标题', style: AppTypography.labelLarge),
            const SizedBox(height: AppDimensions.sm),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: '例如：跑步30分钟',
                prefixIcon: Icon(Icons.task_alt),
              ),
              maxLength: 200,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppDimensions.md),

            // 任务描述
            Text('任务描述（可选）', style: AppTypography.labelLarge),
            const SizedBox(height: AppDimensions.sm),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                hintText: '添加更多细节...',
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
              maxLength: 500,
            ),
            const SizedBox(height: AppDimensions.lg),

            // 痛苦值选择
            Text('选择难度', style: AppTypography.h4),
            const SizedBox(height: AppDimensions.sm),

            // 等级和积分预览
            Container(
              padding: const EdgeInsets.all(AppDimensions.md),
              decoration: BoxDecoration(
                color: AppColors.getLevelLightColor(level),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                border: Border.all(
                  color: levelColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('等级', style: AppTypography.labelSmall),
                      const SizedBox(height: 4),
                      Text(
                        level,
                        style: AppTypography.numberMedium.copyWith(
                          color: levelColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: levelColor.withValues(alpha: 0.2),
                  ),
                  Column(
                    children: [
                      Text('积分', style: AppTypography.labelSmall),
                      const SizedBox(height: 4),
                      Text(
                        '+$basePoints',
                        style: AppTypography.numberMedium.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: levelColor.withValues(alpha: 0.2),
                  ),
                  Column(
                    children: [
                      Text('难度', style: AppTypography.labelSmall),
                      const SizedBox(height: 4),
                      Text(
                        '$_painValue',
                        style: AppTypography.numberMedium.copyWith(
                          color: isSLevel ? AppColors.danger : levelColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.md),

            // 痛苦值滑块
            AppSlider(
              value: _painValue.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: _painValue.toString(),
              onChanged: (value) {
                setState(() {
                  _painValue = value.round();
                });
              },
            ),

            // S级挑战提示
            if (isSLevel) ...[
              const SizedBox(height: AppDimensions.sm),
              Container(
                padding: const EdgeInsets.all(AppDimensions.md),
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                ),
                child: Row(
                  children: [
                    const Text('⚔️', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: AppDimensions.sm),
                    Expanded(
                      child: Text(
                        '挑战自我！S级任务难度较高，完成后获得更多积分和成就感',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.danger,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: AppDimensions.lg),

            // 每日习惯开关
            Container(
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
              child: Row(
                children: [
                  const Text('🔄', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: AppDimensions.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('每日习惯', style: AppTypography.labelLarge),
                        Text(
                          '标记为每日重复执行的习惯',
                          style: AppTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isDailyHabit,
                    onChanged: (value) {
                      setState(() {
                        _isDailyHabit = value;
                      });
                    },
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.xl),

            // 错误提示
            if (createState.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.md),
                child: Text(
                  createState.error!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              ),

            // 创建按钮
            AppButton(
              text: '创建任务',
              icon: Icons.add_task,
              isExpanded: true,
              isLoading: createState.isLoading,
              onPressed: _handleSubmit,
            ),
            const SizedBox(height: AppDimensions.xxl),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final notifier = ref.read(createTaskProvider.notifier);
    notifier.updateTitle(_titleController.text);
    notifier.updateDescription(_descController.text);
    notifier.updatePainValue(_painValue);
    notifier.updateIsDailyHabit(_isDailyHabit);

    final taskId = await notifier.submit();
    if (taskId != null && mounted) {
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 任务创建成功！'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }
}
