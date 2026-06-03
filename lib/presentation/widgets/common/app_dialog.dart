import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';
import 'app_button.dart';

/// 通用对话框组件
class AppDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? child;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool showCancel;

  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.child,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.showCancel = true,
  });

  /// 显示确认对话框
  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = '确认',
    String cancelText = '取消',
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AppDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: () => Navigator.of(context).pop(true),
        onCancel: () => Navigator.of(context).pop(false),
      ),
    );
  }

  /// 显示提示对话框
  static Future<void> showAlert({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = '知道了',
  }) {
    return showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        showCancel: false,
        onConfirm: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: AppTypography.h4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.md),
            ],
            if (content != null) ...[
              Text(
                content!,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.lg),
            ],
            if (child != null) ...[
              child!,
              const SizedBox(height: AppDimensions.lg),
            ],
            Row(
              children: [
                if (showCancel) ...[
                  Expanded(
                    child: AppButton(
                      text: cancelText ?? '取消',
                      type: AppButtonType.outline,
                      onPressed: onCancel ?? () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.md),
                ],
                Expanded(
                  child: AppButton(
                    text: confirmText ?? '确认',
                    onPressed: onConfirm ?? () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
