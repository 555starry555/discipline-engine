/// 用户统计数据模型
class UserStatsModel {
  final int id;
  final int currentPoints;
  final int totalPoints;
  final int totalExp;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastCheckInDate;
  final int dailyUndoCount;
  final DateTime? lastUndoDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserStatsModel({
    required this.id,
    this.currentPoints = 0,
    this.totalPoints = 0,
    this.totalExp = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastCheckInDate,
    this.dailyUndoCount = 0,
    this.lastUndoDate,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 创建副本
  UserStatsModel copyWith({
    int? id,
    int? currentPoints,
    int? totalPoints,
    int? totalExp,
    int? currentStreak,
    int? longestStreak,
    DateTime? lastCheckInDate,
    int? dailyUndoCount,
    DateTime? lastUndoDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserStatsModel(
      id: id ?? this.id,
      currentPoints: currentPoints ?? this.currentPoints,
      totalPoints: totalPoints ?? this.totalPoints,
      totalExp: totalExp ?? this.totalExp,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastCheckInDate: lastCheckInDate ?? this.lastCheckInDate,
      dailyUndoCount: dailyUndoCount ?? this.dailyUndoCount,
      lastUndoDate: lastUndoDate ?? this.lastUndoDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 默认初始化的用户统计
  factory UserStatsModel.initial() {
    final now = DateTime.now();
    return UserStatsModel(
      id: 1,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 是否已打卡今天
  bool get checkedInToday {
    if (lastCheckInDate == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkIn = DateTime(
      lastCheckInDate!.year,
      lastCheckInDate!.month,
      lastCheckInDate!.day,
    );
    return checkIn == today;
  }

  @override
  String toString() =>
      'UserStatsModel(points: $currentPoints, streak: $currentStreak, exp: $totalExp)';
}
