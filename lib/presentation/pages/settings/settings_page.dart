import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dimensions.dart';
import '../../../core/theme/typography.dart';

/// 设置页面
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.md),
        children: [
          _buildSection(
            title: '数据管理',
            children: [
              _buildMenuItem(
                context: context,
                icon: Icons.backup_outlined,
                label: '数据备份',
                onTap: () => context.push('/settings/backup'),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.md),
          _buildSection(
            title: '实验功能（即将开放）',
            children: [
              _buildMenuItem(
                context: context,
                icon: Icons.smart_toy_outlined,
                label: 'AI 智能定价',
                trailing: '即将开放',
                onTap: () => context.push('/settings/ai'),
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.cloud_sync_outlined,
                label: 'WebDAV 同步',
                trailing: '即将开放',
                onTap: () => context.push('/settings/webdav'),
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.notifications_outlined,
                label: '提醒设置',
                trailing: '即将开放',
                onTap: () => context.push('/settings/notification'),
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.widgets_outlined,
                label: '桌面小组件',
                trailing: '即将开放',
                onTap: () => context.push('/settings/widget'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: AppDimensions.sm),
          child: Text(
            title,
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Container(
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
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    String? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.md,
          vertical: AppDimensions.md,
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 22),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: Text(label, style: AppTypography.bodyLarge),
            ),
            if (trailing != null)
              Text(
                trailing,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            const SizedBox(width: AppDimensions.sm),
            const Icon(
              Icons.chevron_right,
              color: AppColors.disabled,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
