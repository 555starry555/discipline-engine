/// 应用常量
class AppConstants {
  AppConstants._();

  // ── 应用信息 ──
  static const String appName = '自律引擎';
  static const String appVersion = '1.0.0';

  // ── 每日积分上限 ──
  /// S/A/B级任务共享每日100分上限
  static const int dailyPointCap = 100;
  /// 每日最多撤销打卡次数
  static const int dailyUndoLimit = 3;

  // ── 等级系统 ──
  static const int maxLevel = 5;

  // ── 痛苦值 → (等级, 基础积分) 映射表 ──
  static const Map<int, Map<String, dynamic>> painValueMap = {
    1: {'level': 'C', 'basePoints': 3},
    2: {'level': 'B', 'basePoints': 5},
    3: {'level': 'B', 'basePoints': 8},
    4: {'level': 'B', 'basePoints': 12},
    5: {'level': 'A', 'basePoints': 20},
    6: {'level': 'A', 'basePoints': 28},
    7: {'level': 'A', 'basePoints': 36},
    8: {'level': 'S', 'basePoints': 45},
    9: {'level': 'S', 'basePoints': 60},
    10: {'level': 'S', 'basePoints': 80},
  };

  /// 获取痛苦值对应的等级
  static String getLevelForPainValue(int painValue) {
    return painValueMap[painValue]?['level'] ?? 'C';
  }

  /// 获取痛苦值对应的基础积分
  static int getBasePointsForPainValue(int painValue) {
    return painValueMap[painValue]?['basePoints'] ?? 3;
  }

  /// 验证痛苦值是否合法
  static bool isValidPainValue(int painValue) {
    return painValueMap.containsKey(painValue);
  }

  // ── 连续打卡加成 ──
  /// 连续打卡7天时，当天积分额外+10%
  static const int streakBonusThreshold = 7;
  static const double streakBonusRate = 0.1;

  // ── 心理换算系数 ──
  static const double moneyConversionRate = 30.0;

  // ── 数据库名称 ──
  static const String dbName = 'discipline_engine.db';
}
