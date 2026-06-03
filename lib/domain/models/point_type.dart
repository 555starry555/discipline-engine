/// 积分流水类型枚举
enum PointType {
  /// 完成任务获得
  taskEarned('task_earned', '完成任务'),

  /// 连续打卡加成
  bonusStreak('bonus_streak', '连续打卡加成'),

  /// 兑换奖励消耗
  rewardRedeem('reward_redeem', '兑换奖励'),

  /// 撤销打卡扣回
  undoCheckin('undo_checkin', '撤销打卡');

  const PointType(this.value, this.label);

  /// 存储到数据库的字符串值
  final String value;

  /// 显示标签
  final String label;

  /// 从数据库字符串解析
  static PointType fromValue(String value) {
    return PointType.values.firstWhere(
      (t) => t.value == value,
      orElse: () => PointType.taskEarned,
    );
  }

  /// 是否是正向积分（获得）
  bool get isPositive =>
      this == PointType.taskEarned || this == PointType.bonusStreak;

  /// 是否是负向积分（消耗/扣回）
  bool get isNegative =>
      this == PointType.rewardRedeem || this == PointType.undoCheckin;
}
