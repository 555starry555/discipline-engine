import '../database/app_database.dart';

/// 成就仓库
class AchievementRepository {
  final AppDatabase _db;

  AchievementRepository(this._db);

  /// 获取所有成就
  Future<List<AchievementTableData>> getAllAchievements() {
    return _db.achievementDao.getAllAchievements();
  }

  /// 监听所有成就
  Stream<List<AchievementTableData>> watchAllAchievements() {
    return _db.achievementDao.watchAllAchievements();
  }

  /// 获取已解锁成就数
  Future<int> getUnlockedCount() {
    return _db.achievementDao.getUnlockedCount();
  }
}
