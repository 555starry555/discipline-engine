import 'package:drift/drift.dart';

/// 积分流水记录表
class PointLogTable extends Table {
  @override
  String get tableName => 'point_logs';

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get amount => integer()(); // 正数=获得，负数=消耗
  TextColumn get type => text()(); // task_earned, bonus_streak, reward_redeem, undo_checkin
  TextColumn get reason => text()();
  TextColumn get relatedId => text().nullable()();
  IntColumn get balanceAfter => integer()();
}
