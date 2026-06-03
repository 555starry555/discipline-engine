import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/utils/date_utils.dart';

/// 连续打卡日历组件
class StreakCalendar extends StatelessWidget {
  final int currentStreak;
  final int longestStreak;

  const StreakCalendar({
    super.key,
    required this.currentStreak,
    required this.longestStreak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
      padding: const EdgeInsets.all(AppDimensions.md),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text('连续打卡', style: AppTypography.h4),
            ],
          ),
          const SizedBox(height: AppDimensions.md),

          // 统计数据
          Row(
            children: [
              _buildStatBox('当前连续', '$currentStreak天', AppColors.accent),
              const SizedBox(width: AppDimensions.md),
              _buildStatBox('最长记录', '$longestStreak天', AppColors.gold),
            ],
          ),
          const SizedBox(height: AppDimensions.md),

          // 最近7天日历
          Text('最近7天', style: AppTypography.labelMedium),
          const SizedBox(height: AppDimensions.sm),
          _buildWeekRow(),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppTypography.numberSmall.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekRow() {
    final days = AppDateUtils.getLastNDays(7);
    final weekDays = ['一', '二', '三', '四', '五', '六', '日'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final day = days[index];
        final isToday = AppDateUtils.isToday(day);
        // 这里简化处理：currentStreak > 0 且在连续天数内显示已打卡
        final daysFromToday = AppDateUtils.today().difference(day).inDays;
        final isChecked = currentStreak > 0 && daysFromToday < currentStreak && daysFromToday >= 0;

        return Column(
          children: [
            Text(
              weekDays[day.weekday - 1],
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isChecked
                    ? AppColors.accent
                    : isToday
                        ? AppColors.accent.withValues(alpha: 0.2)
                        : AppColors.border.withValues(alpha: 0.3),
                shape: BoxShape.circle,
                border: isToday && !isChecked
                    ? Border.all(color: AppColors.accent, width: 2)
                    : null,
              ),
              child: Center(
                child: isChecked
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : Text(
                        '${day.day}',
                        style: AppTypography.labelMedium.copyWith(
                          color: isToday ? AppColors.accent : AppColors.textSecondary,
                        ),
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
