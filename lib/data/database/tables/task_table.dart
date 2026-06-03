import 'package:drift/drift.dart';

/// 任务表
class TaskTable extends Table {
  @override
  String get tableName => 'tasks';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  IntColumn get painValue => integer()();
  TextColumn get level => text()(); // C/B/A/S
  IntColumn get basePoints => integer()();
  BoolColumn get isDailyHabit => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  BoolColumn get hasBet => boolean().withDefault(const Constant(false))();
  IntColumn get betPoints => integer().withDefault(const Constant(0))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
