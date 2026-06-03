import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_providers.dart';
import '../../data/database/app_database.dart';

/// 积分流水 Stream Provider
final pointLogsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.pointLogDao.watchPointLogs(limit: 100);
});

/// 用户当前积分 Provider
final currentPointsProvider = Provider.autoDispose<AsyncValue<int>>((ref) {
  final statsAsync = ref.watch(userStatsProvider);
  return statsAsync.whenData((stats) => stats?.currentPoints ?? 0);
});

/// 用户统计数据 Stream Provider（定义在此以避免循环引用）
final userStatsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.userStatsDao.watchUserStats();
});

/// 完成任务后的结果状态
class TaskCompletionResult {
  final int earnedPoints;
  final int earnedExp;
  final int bonusPoints;
  final int overflowPoints;
  final int betReturnedPoints;
  final List<String> unlockedAchievements;

  const TaskCompletionResult({
    required this.earnedPoints,
    required this.earnedExp,
    required this.bonusPoints,
    this.overflowPoints = 0,
    this.betReturnedPoints = 0,
    this.unlockedAchievements = const [],
  });

  bool get hasBonus => bonusPoints > 0;
  bool get hasOverflow => overflowPoints > 0;
  bool get hasBetReturn => betReturnedPoints > 0;
  bool get hasAchievementUnlock => unlockedAchievements.isNotEmpty;

  int get totalPoints => earnedPoints + bonusPoints + betReturnedPoints;
}
