import 'package:drift/drift.dart';

/// 应用设置表
class AppSettingsTable extends Table {
  @override
  String get tableName => 'app_settings';

  IntColumn get id => integer().autoIncrement()();
  BoolColumn get habitPenaltyEnabled => boolean().withDefault(const Constant(false))();
  BoolColumn get lazyTaxEnabled => boolean().withDefault(const Constant(false))();
  IntColumn get lazyTaxTarget => integer().withDefault(const Constant(0))();
  BoolColumn get streakProtectionEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get aiBaseUrl => text().nullable()();
  TextColumn get aiApiKey => text().nullable()();
  TextColumn get aiModel => text().nullable()();
  BoolColumn get aiPricingEnabled => boolean().withDefault(const Constant(false))();
  BoolColumn get weeklySummaryEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get webdavUrl => text().nullable()();
  TextColumn get webdavUsername => text().nullable()();
  TextColumn get webdavPassword => text().nullable()();
  TextColumn get webdavPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
