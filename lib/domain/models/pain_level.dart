import '../../core/constants/app_constants.dart';

/// 痛苦等级模型
class PainLevel {
  final int value; // 1-10
  final String level; // C/B/A/S
  final int basePoints;

  const PainLevel({
    required this.value,
    required this.level,
    required this.basePoints,
  });

  /// 通过痛苦值创建PainLevel
  factory PainLevel.fromValue(int value) {
    if (!AppConstants.isValidPainValue(value)) {
      throw ArgumentError('痛苦值必须在1-10之间: $value');
    }
    final mapping = AppConstants.painValueMap[value]!;
    return PainLevel(
      value: value,
      level: mapping['level'] as String,
      basePoints: mapping['basePoints'] as int,
    );
  }

  /// 是否是S级挑战
  bool get isChallenge => level == 'S';

  /// 获取等级颜色描述
  String get levelDescription {
    switch (level) {
      case 'S':
        return '挑战自我';
      case 'A':
        return '勇敢者';
      case 'B':
        return '日常任务';
      case 'C':
        return '微习惯';
      default:
        return '日常任务';
    }
  }

  @override
  String toString() => 'PainLevel(value: $value, level: $level, basePoints: $basePoints)';
}

/// PainLevel扩展校验
extension PainLevelValidation on int {
  bool get isValidPainValue => AppConstants.isValidPainValue(this);
}
