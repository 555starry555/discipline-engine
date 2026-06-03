import 'package:drift/drift.dart';

/// 任务完成日志表
class TaskLogTable extends Table {
  @override
  String get tableName => 'task_logs';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get completedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isMakeUp => boolean().withDefault(const Constant(false))();
  IntColumn get earnedPoints => integer()();
  IntColumn get earnedExp => integer()();
  IntColumn get basePoints => integer()();
  IntColumn get bonusPoints => integer().withDefault(const Constant(0))();
  IntColumn get overflowPoints => integer().withDefault(const Constant(0))();
  IntColumn get betReturnedPoints => integer().withDefault(const Constant(0))();
  BoolColumn get isRevoked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get revokedAt => dateTime().nullable()();
}
