import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/redemption_table.dart';

part 'redemption_dao.g.dart';

/// 兑换记录DAO
@DriftAccessor(tables: [RedemptionTable])
class RedemptionDao extends DatabaseAccessor<AppDatabase>
    with _$RedemptionDaoMixin {
  RedemptionDao(AppDatabase db) : super(db);

  /// 创建兑换记录
  Future<int> createRedemption(RedemptionTableCompanion redemption) {
    return into(redemptionTable).insert(redemption);
  }

  /// 获取兑换记录列表（按时间倒序）
  Future<List<RedemptionTableData>> getRedemptions({
    int limit = 50,
    int offset = 0,
  }) {
    return (select(redemptionTable)
          ..orderBy([(t) => OrderingTerm.desc(t.redeemedAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  /// 监听兑换记录
  Stream<List<RedemptionTableData>> watchRedemptions({int limit = 50}) {
    return (select(redemptionTable)
          ..orderBy([(t) => OrderingTerm.desc(t.redeemedAt)])
          ..limit(limit))
        .watch();
  }

  /// 标记兑换已使用
  Future<void> markAsUsed(int redemptionId) async {
    await (update(redemptionTable)..where((t) => t.id.equals(redemptionId)))
        .write(
      RedemptionTableCompanion(
        isUsed: const Value(true),
        usedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 获取兑换数量
  Future<int> getRedemptionCount() async {
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM redemptions',
      readsFrom: {redemptionTable},
    ).getSingle();
    return result.data['count'] as int;
  }
}
