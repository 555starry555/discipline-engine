import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_providers.dart';
import 'point_providers.dart';
import '../../data/database/app_database.dart';
import '../../core/utils/number_utils.dart';

/// 用户等级信息 Provider
final userLevelProvider = Provider.autoDispose<AsyncValue<Map<String, dynamic>>>((ref) {
  final statsAsync = ref.watch(userStatsProvider);
  return statsAsync.whenData((stats) {
    final totalExp = stats?.totalExp ?? 0;
    return {
      'level': AppNumberUtils.getCurrentLevel(totalExp),
      'levelName': AppNumberUtils.getLevelName(AppNumberUtils.getCurrentLevel(totalExp)),
      'progress': AppNumberUtils.getLevelProgress(totalExp),
      'totalExp': totalExp,
      'currentLevelExp': AppNumberUtils.getExpForLevel(AppNumberUtils.getCurrentLevel(totalExp)),
      'nextLevelExp': AppNumberUtils.getExpForLevel(AppNumberUtils.getCurrentLevel(totalExp) + 1),
    };
  });
});

/// 用户连续打卡天数 Provider
final streakProvider = Provider.autoDispose<AsyncValue<int>>((ref) {
  final statsAsync = ref.watch(userStatsProvider);
  return statsAsync.whenData((stats) => stats?.currentStreak ?? 0);
});
