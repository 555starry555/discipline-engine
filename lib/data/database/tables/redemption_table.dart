import 'package:drift/drift.dart';

/// 兑换记录表
class RedemptionTable extends Table {
  @override
  String get tableName => 'redemptions';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get rewardId => integer()();
  TextColumn get rewardNameSnapshot => text()();
  IntColumn get costPoints => integer()();
  DateTimeColumn get redeemedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isUsed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get usedAt => dateTime().nullable()();
}
