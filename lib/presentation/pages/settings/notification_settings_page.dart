import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 通知设置页面（占位）
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('提醒设置'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🔔', style: TextStyle(fontSize: 64)),
              const SizedBox(height: AppDimensions.lg),
              Text(
                '提醒设置',
                style: AppTypography.h3,
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                '设置每日任务提醒时间\n帮助你保持自律习惯\n即将开放，敬请期待！',
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
