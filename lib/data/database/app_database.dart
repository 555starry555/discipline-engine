import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/user_stats_table.dart';
import 'tables/task_table.dart';
import 'tables/task_log_table.dart';
import 'tables/point_log_table.dart';
import 'tables/reward_item_table.dart';
import 'tables/redemption_table.dart';
import 'tables/achievement_table.dart';
import 'tables/app_settings_table.dart';
import 'daos/user_stats_dao.dart';
import 'daos/task_dao.dart';
import 'daos/task_log_dao.dart';
import 'daos/point_log_dao.dart';
import 'daos/reward_dao.dart';
import 'daos/redemption_dao.dart';
import 'daos/achievement_dao.dart';
import 'daos/settings_dao.dart';

part 'app_database.g.dart';

/// 应用数据库
@DriftDatabase(
  tables: [
    UserStatsTable,
    TaskTable,
    TaskLogTable,
    PointLogTable,
    RewardItemTable,
    RedemptionTable,
    AchievementTable,
    AppSettingsTable,
  ],
  daos: [
    UserStatsDao,
    TaskDao,
    TaskLogDao,
    PointLogDao,
    RewardDao,
    RedemptionDao,
    AchievementDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// 用于测试的构造函数
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 未来版本升级逻辑
      },
    );
  }

  /// 初始化数据库（首次启动数据）
  Future<void> initializeDatabase() async {
    await userStatsDao.initUserStats();
    await achievementDao.initAchievements();
    await settingsDao.initSettings();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'discipline_engine.db'));
    return NativeDatabase.createInBackground(file);
  });
}
