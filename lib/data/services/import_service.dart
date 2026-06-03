import 'dart:convert';
import 'dart:io';

/// 导入服务（占位，MVP阶段仅支持导出）
class ImportService {
  /// 从JSON文件导入数据（MVP占位）
  Future<bool> importFromFile(String filePath) async {
    // MVP阶段暂不实现导入功能
    throw UnimplementedError('导入功能即将开放');
  }

  /// 从JSON字符串导入（MVP占位）
  Future<bool> importFromJson(String jsonString) async {
    throw UnimplementedError('导入功能即将开放');
  }
}
