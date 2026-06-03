import 'package:drift/drift.dart';

/// 用户统计表
class UserStatsTable extends Table {
  @override
  String get tableName => 'user_stats';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get currentPoints => integer().withDefault(const Constant(0))();
  IntColumn get totalPoints => integer().withDefault(const Constant(0))();
  IntColumn get totalExp => integer().withDefault(const Constant(0))();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastCheckInDate => dateTime().nullable()();
  IntColumn get dailyUndoCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastUndoDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
