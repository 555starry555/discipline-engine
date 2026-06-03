import 'pain_level.dart';

/// 任务数据模型（纯Dart类，无freezed）
class TaskModel {
  final int id;
  final String title;
  final String? description;
  final int painValue;
  final String level; // C/B/A/S
  final int basePoints;
  final bool isDailyHabit;
  final bool isActive;
  final String status; // active, completed, archived
  final bool hasBet;
  final int betPoints;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.painValue,
    required this.level,
    required this.basePoints,
    this.isDailyHabit = false,
    this.isActive = true,
    this.status = 'active',
    this.hasBet = false,
    this.betPoints = 0,
    this.dueDate,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 通过痛苦值创建任务
  factory TaskModel.fromPainValue({
    required int id,
    required String title,
    String? description,
    required int painValue,
    bool isDailyHabit = false,
    bool hasBet = false,
    int betPoints = 0,
    DateTime? dueDate,
  }) {
    final painLevel = PainLevel.fromValue(painValue);
    final now = DateTime.now();
    return TaskModel(
      id: id,
      title: title,
      description: description,
      painValue: painValue,
      level: painLevel.level,
      basePoints: painLevel.basePoints,
      isDailyHabit: isDailyHabit,
      hasBet: hasBet,
      betPoints: betPoints,
      dueDate: dueDate,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 创建副本并修改部分字段
  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    int? painValue,
    String? level,
    int? basePoints,
    bool? isDailyHabit,
    bool? isActive,
    String? status,
    bool? hasBet,
    int? betPoints,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      painValue: painValue ?? this.painValue,
      level: level ?? this.level,
      basePoints: basePoints ?? this.basePoints,
      isDailyHabit: isDailyHabit ?? this.isDailyHabit,
      isActive: isActive ?? this.isActive,
      status: status ?? this.status,
      hasBet: hasBet ?? this.hasBet,
      betPoints: betPoints ?? this.betPoints,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 获取PainLevel模型
  PainLevel get painLevel => PainLevel.fromValue(painValue);

  /// 是否是S级挑战任务
  bool get isChallenge => level == 'S';

  /// 是否已归档
  bool get isArchived => status == 'archived';

  @override
  String toString() => 'TaskModel(id: $id, title: $title, level: $level, basePoints: $basePoints)';
}
