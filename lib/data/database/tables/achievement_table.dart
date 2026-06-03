import 'package:drift/drift.dart';

/// 成就表
class AchievementTable extends Table {
  @override
  String get tableName => 'achievements';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get icon => text()();
  TextColumn get conditionType => text()();
  IntColumn get targetValue => integer()();
  BoolColumn get isUnlocked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get unlockedAt => dateTime().nullable()();
}
