import 'package:drift/drift.dart';

/// 奖励商品表
class RewardItemTable extends Table {
  @override
  String get tableName => 'reward_items';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  IntColumn get pricePoints => integer()();
  RealColumn get moneyPrice => real().nullable()();
  TextColumn get imagePath => text().nullable()();
  BoolColumn get isWish => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
