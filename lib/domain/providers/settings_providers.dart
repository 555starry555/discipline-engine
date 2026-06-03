import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_providers.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/backup_repository.dart';

/// 应用设置 Stream Provider
final settingsProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.settingsDao.watchSettings();
});

/// 备份仓库 Provider
final backupRepositoryProvider = Provider((ref) {
  final db = ref.watch(appDatabaseProvider);
  return BackupRepository(db);
});
