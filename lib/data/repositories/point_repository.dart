import '../database/app_database.dart';

/// 积分仓库
class PointRepository {
  final AppDatabase _db;

  PointRepository(this._db);

  /// 获取积分流水列表
  Future<List<PointLogTableData>> getPointLogs({int limit = 50, int offset = 0}) {
    return _db.pointLogDao.getPointLogs(limit: limit, offset: offset);
  }

  /// 监听积分流水
  Stream<List<PointLogTableData>> watchPointLogs({int limit = 50}) {
    return _db.pointLogDao.watchPointLogs(limit: limit);
  }

  /// 获取累计获得积分
  Future<int> getTotalEarnedPoints() {
    return _db.pointLogDao.getTotalEarnedPoints();
  }
}
