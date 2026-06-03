import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 自定义滑块组件（用于痛苦值选择）
class AppSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;
  final String? label;
  final Color? activeColor;

  const AppSlider({
    super.key,
    required this.value,
    this.min = 1,
    this.max = 10,
    this.divisions = 9,
    required this.onChanged,
    this.label,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    // 痛苦值 >= 8 时变为暖红色
    final effectiveActiveColor = activeColor ??
        (value >= 8 ? AppColors.danger : AppColors.primary);

    return Column(
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.xs),
            child: Text(
              label!,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: effectiveActiveColor,
            inactiveTrackColor: AppColors.border,
            thumbColor: effectiveActiveColor,
            overlayColor: effectiveActiveColor.withValues(alpha: 0.2),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: effectiveActiveColor,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: label ?? value.round().toString(),
            onChanged: onChanged,
          ),
        ),
        // 显示痛苦值刻度
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('轻松', style: AppTypography.labelSmall.copyWith(
                color: AppColors.success,
              )),
              Text('适中', style: AppTypography.labelSmall.copyWith(
                color: AppColors.textSecondary,
              )),
              Text('挑战自我', style: AppTypography.labelSmall.copyWith(
                color: value >= 8 ? AppColors.danger : AppColors.textSecondary,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
