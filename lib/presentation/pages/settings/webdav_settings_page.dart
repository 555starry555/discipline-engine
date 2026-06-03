import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// WebDAV 设置页面（占位）
class WebdavSettingsPage extends StatelessWidget {
  const WebdavSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('WebDAV 同步'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('☁️', style: TextStyle(fontSize: 64)),
              const SizedBox(height: AppDimensions.lg),
              Text(
                'WebDAV 同步',
                style: AppTypography.h3,
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                '通过WebDAV服务同步数据到云端\n支持坚果云、NextCloud等服务\n即将开放，敬请期待！',
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
