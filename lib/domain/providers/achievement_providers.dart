import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_providers.dart';
import '../../data/database/app_database.dart';

/// 成就列表 Stream Provider
final achievementsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.achievementDao.watchAllAchievements();
});

/// 已解锁成就数量 Provider
final unlockedAchievementCountProvider = FutureProvider.autoDispose((ref) async {
  final db = ref.watch(appDatabaseProvider);
  return db.achievementDao.getUnlockedCount();
});
