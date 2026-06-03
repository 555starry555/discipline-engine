/// 成就模型
class AchievementModel {
  final int id;
  final String code;
  final String name;
  final String description;
  final String icon; // emoji或图标标识
  final String conditionType;
  final int targetValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const AchievementModel({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.icon,
    required this.conditionType,
    required this.targetValue,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  /// 创建副本
  AchievementModel copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? icon,
    String? conditionType,
    int? targetValue,
    bool? isUnlocked,
    DateTime? unlockedAt,
  }) {
    return AchievementModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      conditionType: conditionType ?? this.conditionType,
      targetValue: targetValue ?? this.targetValue,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  @override
  String toString() => 'AchievementModel(code: $code, name: $name, unlocked: $isUnlocked)';
}

/// 成就条件类型
enum AchievementConditionType {
  /// 创建任务数量
  taskCreated('task_created'),

  /// 完成任务数量
  taskCompleted('task_completed'),

  /// 完成S级任务数量
  sTaskCompleted('s_task_completed'),

  /// 连续打卡天数
  streakDays('streak_days'),

  /// 累计获得积分
  totalPoints('total_points'),

  /// 兑换奖励数量
  rewardRedeemed('reward_redeemed'),

  /// 完成C级任务数量
  cTaskCompleted('c_task_completed');

  const AchievementConditionType(this.value);

  final String value;

  static AchievementConditionType fromValue(String value) {
    return AchievementConditionType.values.firstWhere(
      (t) => t.value == value,
      orElse: () => AchievementConditionType.taskCompleted,
    );
  }
}

/// MVP 7个成就定义
class DefaultAchievements {
  DefaultAchievements._();

  static const List<Map<String, dynamic>> achievements = [
    {
      'code': 'first_task',
      'name': '初次启动',
      'description': '创建第一个任务',
      'icon': '🚀',
      'conditionType': 'task_created',
      'targetValue': 1,
    },
    {
      'code': 'first_win',
      'name': '第一次胜利',
      'description': '完成第一个任务',
      'icon': '🏆',
      'conditionType': 'task_completed',
      'targetValue': 1,
    },
    {
      'code': 'brave_moment',
      'name': '勇者时刻',
      'description': '完成第一个S级任务',
      'icon': '⚔️',
      'conditionType': 's_task_completed',
      'targetValue': 1,
    },
    {
      'code': 'seven_days',
      'name': '七日火种',
      'description': '连续打卡7天',
      'icon': '🔥',
      'conditionType': 'streak_days',
      'targetValue': 7,
    },
    {
      'code': 'thousand_points',
      'name': '千分积累',
      'description': '累计获得1000积分',
      'icon': '💰',
      'conditionType': 'total_points',
      'targetValue': 1000,
    },
    {
      'code': 'first_reward',
      'name': '第一份奖励',
      'description': '兑换第一个奖励',
      'icon': '🎁',
      'conditionType': 'reward_redeemed',
      'targetValue': 1,
    },
    {
      'code': 'micro_master',
      'name': '微习惯大师',
      'description': '完成30次C级任务',
      'icon': '✨',
      'conditionType': 'c_task_completed',
      'targetValue': 30,
    },
  ];
}
