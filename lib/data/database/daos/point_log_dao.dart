import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/point_log_table.dart';

part 'point_log_dao.g.dart';

/// 积分流水DAO
@DriftAccessor(tables: [PointLogTable])
class PointLogDao extends DatabaseAccessor<AppDatabase>
    with _$PointLogDaoMixin {
  PointLogDao(AppDatabase db) : super(db);

  /// 创建积分流水记录
  Future<int> createPointLog(PointLogTableCompanion log) {
    return into(pointLogTable).insert(log);
  }

  /// 获取积分流水列表（按时间倒序）
  Future<List<PointLogTableData>> getPointLogs({
    int limit = 50,
    int offset = 0,
  }) {
    return (select(pointLogTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  /// 监听积分流水
  Stream<List<PointLogTableData>> watchPointLogs({int limit = 50}) {
    return (select(pointLogTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit))
        .watch();
  }

  /// 获取累计获得积分（正向流水的总和）
  Future<int> getTotalEarnedPoints() async {
    final result = await customSelect(
      'SELECT COALESCE(SUM(amount), 0) as total FROM point_logs WHERE amount > 0',
      readsFrom: {pointLogTable},
    ).getSingle();
    return result.data['total'] as int;
  }

  /// 获取最近的积分流水
  Future<PointLogTableData?> getLatestPointLog() {
    return (select(pointLogTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }
}
