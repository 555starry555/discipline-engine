/// 任务完成日志模型
class TaskLogModel {
  final int id;
  final int taskId;
  final DateTime date;
  final DateTime completedAt;
  final bool isMakeUp;
  final int earnedPoints;
  final int earnedExp;
  final int basePoints;
  final int bonusPoints;
  final int overflowPoints;
  final int betReturnedPoints;
  final bool isRevoked;
  final DateTime? revokedAt;

  const TaskLogModel({
    required this.id,
    required this.taskId,
    required this.date,
    required this.completedAt,
    this.isMakeUp = false,
    required this.earnedPoints,
    required this.earnedExp,
    required this.basePoints,
    this.bonusPoints = 0,
    this.overflowPoints = 0,
    this.betReturnedPoints = 0,
    this.isRevoked = false,
    this.revokedAt,
  });

  /// 创建副本
  TaskLogModel copyWith({
    int? id,
    int? taskId,
    DateTime? date,
    DateTime? completedAt,
    bool? isMakeUp,
    int? earnedPoints,
    int? earnedExp,
    int? basePoints,
    int? bonusPoints,
    int? overflowPoints,
    int? betReturnedPoints,
    bool? isRevoked,
    DateTime? revokedAt,
  }) {
    return TaskLogModel(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      date: date ?? this.date,
      completedAt: completedAt ?? this.completedAt,
      isMakeUp: isMakeUp ?? this.isMakeUp,
      earnedPoints: earnedPoints ?? this.earnedPoints,
      earnedExp: earnedExp ?? this.earnedExp,
      basePoints: basePoints ?? this.basePoints,
      bonusPoints: bonusPoints ?? this.bonusPoints,
      overflowPoints: overflowPoints ?? this.overflowPoints,
      betReturnedPoints: betReturnedPoints ?? this.betReturnedPoints,
      isRevoked: isRevoked ?? this.isRevoked,
      revokedAt: revokedAt ?? this.revokedAt,
    );
  }

  /// 总获得积分（不含撤销）
  int get totalEarned => earnedPoints + bonusPoints + betReturnedPoints;

  @override
  String toString() => 'TaskLogModel(id: $id, taskId: $taskId, earnedPoints: $earnedPoints, isRevoked: $isRevoked)';
}
