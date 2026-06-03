import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/typography.dart';
import '../../../../data/database/app_database.dart';

/// 积分走势图表
class PointsChart extends StatelessWidget {
  final List<PointLogTableData> logs;

  const PointsChart({super.key, required this.logs});

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
        padding: const EdgeInsets.all(AppDimensions.xl),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Center(
          child: Column(
            children: [
              const Text('📊', style: TextStyle(fontSize: 40)),
              const SizedBox(height: AppDimensions.sm),
              Text(
                '暂无积分数据',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 按天聚合积分数据
    final dailyPoints = _aggregateByDay(logs);
    final spots = <FlSpot>[];
    final labels = <String>[];

    var index = 0.0;
    for (final entry in dailyPoints.entries) {
      spots.add(FlSpot(index, entry.value.toDouble()));
      labels.add('${entry.key.month}/${entry.key.day}');
      index += 1;
    }

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
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: _getInterval(spots),
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: AppColors.border,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final idx = value.toInt();
                    if (idx >= 0 && idx < labels.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          labels[idx],
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: _getInterval(spots),
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: AppColors.primary,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: AppColors.primary,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      '${spot.y.toInt()} 积分',
                      AppTypography.labelMedium.copyWith(color: Colors.white),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 按天聚合积分数据
  Map<DateTime, int> _aggregateByDay(List<PointLogTableData> logs) {
    final map = <DateTime, int>{};
    // 只取最近14天
    final recentLogs = logs.where((l) {
      final diff = DateTime.now().difference(l.createdAt).inDays;
      return diff <= 14;
    }).toList();

    for (final log in recentLogs.reversed) {
      final day = DateTime(log.createdAt.year, log.createdAt.month, log.createdAt.day);
      if (log.amount > 0) {
        map[day] = (map[day] ?? 0) + log.amount;
      }
    }

    // 排序
    final sorted = Map.fromEntries(
      map.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );

    return sorted;
  }

  double _getInterval(List<FlSpot> spots) {
    if (spots.isEmpty) return 10;
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    if (maxY <= 0) return 10;
    return (maxY / 4).ceilToDouble().clamp(10, double.infinity);
  }
}
