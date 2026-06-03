import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/app_settings_table.dart';

part 'settings_dao.g.dart';

/// 应用设置DAO
@DriftAccessor(tables: [AppSettingsTable])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(AppDatabase db) : super(db);

  /// 获取应用设置
  Future<AppSettingsTableData?> getSettings() {
    return (select(appSettingsTable)..limit(1)).getSingleOrNull();
  }

  /// 监听应用设置
  Stream<AppSettingsTableData?> watchSettings() {
    return (select(appSettingsTable)..limit(1)).watchSingleOrNull();
  }

  /// 初始化设置（首次启动时调用）
  Future<void> initSettings() async {
    final existing = await getSettings();
    if (existing == null) {
      await into(appSettingsTable).insert(
        AppSettingsTableCompanion.insert(),
      );
    }
  }

  /// 更新设置
  Future<void> updateSettings(AppSettingsTableCompanion settings) async {
    final existing = await getSettings();
    if (existing != null) {
      await (update(appSettingsTable)..where((t) => t.id.equals(existing.id)))
          .write(settings);
    }
  }
}
