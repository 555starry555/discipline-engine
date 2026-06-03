import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../database/app_database.dart';

/// 备份仓库 — 处理数据导出/导入
class BackupRepository {
  final AppDatabase _db;

  BackupRepository(this._db);

  /// 导出数据为JSON
  Future<Map<String, dynamic>> exportToJson() async {
    final userStats = await _db.userStatsDao.getUserStats();
    final tasks = await _db.taskDao.getActiveTasks();
    final taskLogs = await _db.taskLogDao.getAllLogs(limit: 10000);
    final pointLogs = await _db.pointLogDao.getPointLogs(limit: 10000);
    final rewards = await _db.rewardDao.getActiveRewards();
    final redemptions = await _db.redemptionDao.getRedemptions(limit: 10000);
    final achievements = await _db.achievementDao.getAllAchievements();
    final settings = await _db.settingsDao.getSettings();

    return {
      'version': '1.0.0',
      'exportedAt': DateTime.now().toIso8601String(),
      'userStats': userStats != null ? _userStatsToMap(userStats) : null,
      'tasks': tasks.map(_taskToMap).toList(),
      'taskLogs': taskLogs.map(_taskLogToMap).toList(),
      'pointLogs': pointLogs.map(_pointLogToMap).toList(),
      'rewards': rewards.map(_rewardToMap).toList(),
      'redemptions': redemptions.map(_redemptionToMap).toList(),
      'achievements': achievements.map(_achievementToMap).toList(),
      'settings': settings != null ? _settingsToMap(settings) : null,
    };
  }

  /// 保存备份文件
  Future<String> saveBackupFile() async {
    final data = await exportToJson();
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);

    final directory = await getApplicationDocumentsDirectory();
    final backupDir = Directory(p.join(directory.path, 'backups'));
    if (!await backupDir.exists()) {
      await backupDir.create(recursive: true);
    }

    final now = DateTime.now();
    final fileName =
        'backup_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}.json';
    final file = File(p.join(backupDir.path, fileName));
    await file.writeAsString(jsonString);

    return file.path;
  }

  Map<String, dynamic> _userStatsToMap(UserStatsTableData data) => {
        'id': data.id,
        'currentPoints': data.currentPoints,
        'totalPoints': data.totalPoints,
        'totalExp': data.totalExp,
        'currentStreak': data.currentStreak,
        'longestStreak': data.longestStreak,
        'lastCheckInDate': data.lastCheckInDate?.toIso8601String(),
        'dailyUndoCount': data.dailyUndoCount,
        'lastUndoDate': data.lastUndoDate?.toIso8601String(),
      };

  Map<String, dynamic> _taskToMap(TaskTableData data) => {
        'id': data.id,
        'title': data.title,
        'description': data.description,
        'painValue': data.painValue,
        'level': data.level,
        'basePoints': data.basePoints,
        'isDailyHabit': data.isDailyHabit,
        'isActive': data.isActive,
        'status': data.status,
        'hasBet': data.hasBet,
        'betPoints': data.betPoints,
        'dueDate': data.dueDate?.toIso8601String(),
        'createdAt': data.createdAt.toIso8601String(),
      };

  Map<String, dynamic> _taskLogToMap(TaskLogTableData data) => {
        'id': data.id,
        'taskId': data.taskId,
        'date': data.date.toIso8601String(),
        'completedAt': data.completedAt.toIso8601String(),
        'isMakeUp': data.isMakeUp,
        'earnedPoints': data.earnedPoints,
        'earnedExp': data.earnedExp,
        'basePoints': data.basePoints,
        'bonusPoints': data.bonusPoints,
        'overflowPoints': data.overflowPoints,
        'betReturnedPoints': data.betReturnedPoints,
        'isRevoked': data.isRevoked,
      };

  Map<String, dynamic> _pointLogToMap(PointLogTableData data) => {
        'id': data.id,
        'createdAt': data.createdAt.toIso8601String(),
        'amount': data.amount,
        'type': data.type,
        'reason': data.reason,
        'relatedId': data.relatedId,
        'balanceAfter': data.balanceAfter,
      };

  Map<String, dynamic> _rewardToMap(RewardItemTableData data) => {
        'id': data.id,
        'name': data.name,
        'description': data.description,
        'pricePoints': data.pricePoints,
        'moneyPrice': data.moneyPrice,
        'imagePath': data.imagePath,
        'isWish': data.isWish,
        'isActive': data.isActive,
      };

  Map<String, dynamic> _redemptionToMap(RedemptionTableData data) => {
        'id': data.id,
        'rewardId': data.rewardId,
        'rewardNameSnapshot': data.rewardNameSnapshot,
        'costPoints': data.costPoints,
        'redeemedAt': data.redeemedAt.toIso8601String(),
        'isUsed': data.isUsed,
        'usedAt': data.usedAt?.toIso8601String(),
      };

  Map<String, dynamic> _achievementToMap(AchievementTableData data) => {
        'id': data.id,
        'code': data.code,
        'name': data.name,
        'description': data.description,
        'icon': data.icon,
        'conditionType': data.conditionType,
        'targetValue': data.targetValue,
        'isUnlocked': data.isUnlocked,
        'unlockedAt': data.unlockedAt?.toIso8601String(),
      };

  Map<String, dynamic> _settingsToMap(AppSettingsTableData data) => {
        'id': data.id,
        'habitPenaltyEnabled': data.habitPenaltyEnabled,
        'lazyTaxEnabled': data.lazyTaxEnabled,
        'lazyTaxTarget': data.lazyTaxTarget,
        'streakProtectionEnabled': data.streakProtectionEnabled,
        'aiBaseUrl': data.aiBaseUrl,
        'aiApiKey': data.aiApiKey,
        'aiModel': data.aiModel,
        'aiPricingEnabled': data.aiPricingEnabled,
        'weeklySummaryEnabled': data.weeklySummaryEnabled,
        'webdavUrl': data.webdavUrl,
        'webdavUsername': data.webdavUsername,
        'webdavPassword': data.webdavPassword,
        'webdavPath': data.webdavPath,
      };
}
