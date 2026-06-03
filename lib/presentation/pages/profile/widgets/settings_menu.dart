import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';

/// 设置菜单组件
class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
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
      child: Column(
        children: [
          _buildMenuItem(
            context: context,
            icon: Icons.settings_outlined,
            label: '设置',
            onTap: () => context.push('/settings'),
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            icon: Icons.backup_outlined,
            label: '数据备份',
            onTap: () => context.push('/settings/backup'),
          ),
          _buildDivider(),
          _buildMenuItem(
            context: context,
            icon: Icons.info_outline,
            label: '关于',
            onTap: () => _showAboutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    String? trailing,
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
            Icon(
              Icons.chevron_right,
              color: AppColors.disabled,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      indent: AppDimensions.md + 22 + AppDimensions.md,
      color: AppColors.divider,
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        title: const Text('关于自律引擎'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🔥', style: TextStyle(fontSize: 48)),
            const SizedBox(height: AppDimensions.md),
            Text(
              '自律引擎',
              style: AppTypography.h3,
            ),
            const SizedBox(height: AppDimensions.sm),
            Text(
              'v1.0.0',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: AppDimensions.md),
            Text(
              '一款帮助你培养自律习惯的App\n通过完成任务获得积分，兑换奖励',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}
