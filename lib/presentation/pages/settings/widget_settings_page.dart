import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 桌面小组件设置页面（占位）
class WidgetSettingsPage extends StatelessWidget {
  const WidgetSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('桌面小组件'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('📱', style: TextStyle(fontSize: 64)),
              const SizedBox(height: AppDimensions.lg),
              Text(
                '桌面小组件',
                style: AppTypography.h3,
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                '在手机桌面上查看今日任务和积分\n无需打开App即可快速打卡\n即将开放，敬请期待！',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
