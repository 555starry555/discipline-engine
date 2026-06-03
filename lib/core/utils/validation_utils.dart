/// 数据校验工具类
class AppValidationUtils {
  AppValidationUtils._();

  /// 校验任务标题
  static String? validateTaskTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '请输入任务标题';
    }
    if (value.trim().length > 200) {
      return '任务标题不能超过200个字符';
    }
    return null;
  }

  /// 校验奖励名称
  static String? validateRewardName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '请输入奖励名称';
    }
    if (value.trim().length > 200) {
      return '奖励名称不能超过200个字符';
    }
    return null;
  }

  /// 校验积分价格
  static String? validatePointsPrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '请输入积分价格';
    }
    final points = int.tryParse(value.trim());
    if (points == null || points <= 0) {
      return '请输入有效的积分数量';
    }
    return null;
  }

  /// 校验痛苦值是否在有效范围内
  static bool isValidPainValue(int value) {
    return value >= 1 && value <= 10;
  }

  /// 校验URL格式
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // URL是可选的
    }
    final uri = Uri.tryParse(value.trim());
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return '请输入有效的URL地址';
    }
    return null;
  }
}
