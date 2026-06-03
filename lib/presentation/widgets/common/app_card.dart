import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';

/// 通用卡片组件（暖色治愈系风格）
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.boxShadow,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin ?? const EdgeInsets.symmetric(
        horizontal: AppDimensions.md,
        vertical: AppDimensions.sm,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.card,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDimensions.cardRadius,
        ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: AppColors.textSecondary.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
        border: border,
      ),
      padding: padding ?? const EdgeInsets.all(AppDimensions.cardPadding),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}
