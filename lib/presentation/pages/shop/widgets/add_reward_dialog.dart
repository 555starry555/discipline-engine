import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/utils/number_utils.dart';
import '../../../../domain/providers/reward_providers.dart';

/// 添加奖励对话框
class AddRewardDialog extends ConsumerStatefulWidget {
  const AddRewardDialog({super.key});

  @override
  ConsumerState<AddRewardDialog> createState() => _AddRewardDialogState();
}

class _AddRewardDialogState extends ConsumerState<AddRewardDialog> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  double _pricePoints = 100;
  bool _isWish = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addRewardProvider);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.lg),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('添加奖励', style: AppTypography.h3),
              const SizedBox(height: AppDimensions.lg),

              // 名称输入
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '奖励名称',
                  hintText: '例如：看一集动漫',
                  prefixIcon: Icon(Icons.card_giftcard),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDimensions.md),

              // 描述输入
              TextField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: '描述（可选）',
                  hintText: '简单描述一下这个奖励',
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: AppDimensions.md),

              // 积分价格滑块
              Text(
                '积分价格: ${_pricePoints.round()}',
                style: AppTypography.labelLarge,
              ),
              Text(
                '心理换算: ${AppNumberUtils.pointsToMoneyPrice(_pricePoints.round())}',
                style: AppTypography.bodySmall,
              ),
              Slider(
                value: _pricePoints,
                min: 10,
                max: 1000,
                divisions: 99,
                activeColor: AppColors.accent,
                onChanged: (value) {
                  setState(() {
                    _pricePoints = value;
                  });
                },
              ),
              const SizedBox(height: AppDimensions.sm),

              // 加入许愿清单开关
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('⭐', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 8),
                      Text('加入许愿清单', style: AppTypography.bodyLarge),
                    ],
                  ),
                  Switch(
                    value: _isWish,
                    onChanged: (value) {
                      setState(() {
                        _isWish = value;
                      });
                    },
                    activeColor: AppColors.gold,
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.lg),

              // 错误提示
              if (addState.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppDimensions.md),
                  child: Text(
                    addState.error!,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.danger,
                    ),
                  ),
                ),

              // 按钮
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: const Text('取消'),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.md),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addState.isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: addState.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('添加'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final notifier = ref.read(addRewardProvider.notifier);
    notifier.updateName(_nameController.text);
    notifier.updateDescription(_descController.text);
    notifier.updatePricePoints(_pricePoints.round());
    notifier.updateIsWish(_isWish);

    final rewardId = await notifier.submit();
    if (rewardId != null && mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 奖励添加成功！'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }
}
