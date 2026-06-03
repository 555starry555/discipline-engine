import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';

/// 任务完成动画（积分到账 + 成就解锁弹窗）
class CompletionAnimationDialog extends StatefulWidget {
  final int earnedPoints;
  final int earnedExp;
  final int bonusPoints;
  final List<String> unlockedAchievements;

  const CompletionAnimationDialog({
    super.key,
    required this.earnedPoints,
    required this.earnedExp,
    this.bonusPoints = 0,
    this.unlockedAchievements = const [],
  });

  /// 显示完成动画弹窗
  static Future<void> show({
    required BuildContext context,
    required int earnedPoints,
    required int earnedExp,
    int bonusPoints = 0,
    List<String> unlockedAchievements = const [],
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CompletionAnimationDialog(
        earnedPoints: earnedPoints,
        earnedExp: earnedExp,
        bonusPoints: bonusPoints,
        unlockedAchievements: unlockedAchievements,
      ),
    );
  }

  @override
  State<CompletionAnimationDialog> createState() =>
      _CompletionAnimationDialogState();
}

class _CompletionAnimationDialogState extends State<CompletionAnimationDialog>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _scaleController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 完成图标
                const Text('🎉', style: TextStyle(fontSize: 48)),
                const SizedBox(height: 12),
                Text(
                  '太棒了！',
                  style: AppTypography.h3.copyWith(color: AppColors.primary),
                ),
                const SizedBox(height: 20),

                // 积分详情
                _buildPointRow('⭐ 积分', '+${widget.earnedPoints}'),
                _buildPointRow('✨ 经验', '+${widget.earnedExp}'),
                if (widget.bonusPoints > 0)
                  _buildPointRow('🔥 连续加成', '+${widget.bonusPoints}'),

                // 成就解锁
                if (widget.unlockedAchievements.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        const Text('🏆', style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 4),
                        Text(
                          '成就解锁！',
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.gold,
                          ),
                        ),
                        ...widget.unlockedAchievements.map(
                          (name) => Text(
                            name,
                            style: AppTypography.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: const Text('继续加油！'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPointRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium),
          Text(
            value,
            style: AppTypography.numberSmall.copyWith(color: AppColors.success),
          ),
        ],
      ),
    );
  }
}
