/// 数字工具类
class AppNumberUtils {
  AppNumberUtils._();

  /// 格式化积分数值，大于1000显示为 x.xk
  static String formatPoints(int points) {
    if (points >= 10000) {
      return '${(points / 1000).toStringAsFixed(1)}k';
    } else if (points >= 1000) {
      return '${(points / 1000).toStringAsFixed(1)}k';
    }
    return points.toString();
  }

  /// 格式化积分为心理换算价格
  /// X = pricePoints / 30.0，保留1位小数
  static String pointsToMoneyPrice(int pricePoints) {
    final x = pricePoints / 30.0;
    return '≈¥${x.toStringAsFixed(1)}';
  }

  /// 计算等级所需经验
  static int getExpForLevel(int level) {
    switch (level) {
      case 1:
        return 0;
      case 2:
        return 500;
      case 3:
        return 1500;
      case 4:
        return 3000;
      case 5:
        return 6000;
      default:
        return 6000;
    }
  }

  /// 获取等级名称
  static String getLevelName(int level) {
    switch (level) {
      case 1:
        return '学徒';
      case 2:
        return '践行者';
      case 3:
        return '掌控者';
      case 4:
        return '驱动者';
      case 5:
        return '自律引擎';
      default:
        return '自律引擎';
    }
  }

  /// 根据经验值计算当前等级
  static int getCurrentLevel(int totalExp) {
    if (totalExp >= 6000) return 5;
    if (totalExp >= 3000) return 4;
    if (totalExp >= 1500) return 3;
    if (totalExp >= 500) return 2;
    return 1;
  }

  /// 计算当前等级进度百分比 (0.0 - 1.0)
  static double getLevelProgress(int totalExp) {
    final currentLevel = getCurrentLevel(totalExp);
    if (currentLevel >= 5) return 1.0;

    final currentExp = getExpForLevel(currentLevel);
    final nextExp = getExpForLevel(currentLevel + 1);
    final range = nextExp - currentExp;
    if (range == 0) return 1.0;

    return (totalExp - currentExp) / range;
  }
}
