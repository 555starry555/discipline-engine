import '../repositories/backup_repository.dart';

/// 备份服务
class BackupService {
  final BackupRepository _backupRepository;

  BackupService(this._backupRepository);

  /// 创建备份
  Future<String> createBackup() async {
    return _backupRepository.saveBackupFile();
  }
}
