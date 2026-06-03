import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../repositories/backup_repository.dart';

/// 导出服务
class ExportService {
  final BackupRepository _backupRepository;

  ExportService(this._backupRepository);

  /// 导出数据为JSON字符串
  Future<String> exportToJsonString() async {
    final data = await _backupRepository.exportToJson();
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  /// 导出数据到文件
  Future<String> exportToFile() async {
    return _backupRepository.saveBackupFile();
  }
}
