import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../data/database/daos/task_dao.dart';
import '../../data/database/daos/task_log_dao.dart';
import '../services/task_service.dart';
import '../services/point_service.dart';
import '../services/streak_service.dart';
import '../services/achievement_service.dart';

/// 数据库 Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// 任务DAO Provider
final taskDaoProvider = Provider<TaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.taskDao;
});

/// 任务日志DAO Provider
final taskLogDaoProvider = Provider<TaskLogDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.taskLogDao;
});

/// 积分服务 Provider
final pointServiceProvider = Provider<PointService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return PointService(db);
});

/// 连续打卡服务 Provider
final streakServiceProvider = Provider<StreakService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return StreakService(db);
});

/// 成就服务 Provider
final achievementServiceProvider = Provider<AchievementService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AchievementService(db);
});

/// 任务服务 Provider
final taskServiceProvider = Provider<TaskService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final pointService = ref.watch(pointServiceProvider);
  final streakService = ref.watch(streakServiceProvider);
  final achievementService = ref.watch(achievementServiceProvider);
  return TaskService(db, pointService, streakService, achievementService);
});

/// 活跃任务列表 Stream Provider
final activeTasksProvider = StreamProvider.autoDispose((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.taskDao.watchActiveTasks();
});

/// 指定日期的任务完成日志 Stream Provider
final taskLogsByDateProvider =
    StreamProvider.family.autoDispose((ref, DateTime date) {
  final db = ref.watch(appDatabaseProvider);
  return db.taskLogDao.watchLogsByDate(date);
});

/// 任务创建 StateNotifier
class CreateTaskState {
  final String title;
  final String description;
  final int painValue;
  final bool isDailyHabit;
  final bool hasBet;
  final int betPoints;
  final bool isLoading;
  final String? error;

  const CreateTaskState({
    this.title = '',
    this.description = '',
    this.painValue = 3,
    this.isDailyHabit = false,
    this.hasBet = false,
    this.betPoints = 0,
    this.isLoading = false,
    this.error,
  });

  CreateTaskState copyWith({
    String? title,
    String? description,
    int? painValue,
    bool? isDailyHabit,
    bool? hasBet,
    int? betPoints,
    bool? isLoading,
    String? error,
  }) {
    return CreateTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      painValue: painValue ?? this.painValue,
      isDailyHabit: isDailyHabit ?? this.isDailyHabit,
      hasBet: hasBet ?? this.hasBet,
      betPoints: betPoints ?? this.betPoints,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class CreateTaskNotifier extends StateNotifier<CreateTaskState> {
  final TaskService _taskService;

  CreateTaskNotifier(this._taskService) : super(const CreateTaskState());

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updatePainValue(int painValue) {
    state = state.copyWith(painValue: painValue);
  }

  void updateIsDailyHabit(bool isDailyHabit) {
    state = state.copyWith(isDailyHabit: isDailyHabit);
  }

  void updateHasBet(bool hasBet) {
    state = state.copyWith(hasBet: hasBet);
  }

  void updateBetPoints(int betPoints) {
    state = state.copyWith(betPoints: betPoints);
  }

  /// 提交创建任务
  Future<int?> submit() async {
    if (state.title.trim().isEmpty) {
      state = state.copyWith(error: '请输入任务标题');
      return null;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final taskId = await _taskService.createTask(
        title: state.title.trim(),
        description: state.description.trim().isEmpty
            ? null
            : state.description.trim(),
        painValue: state.painValue,
        isDailyHabit: state.isDailyHabit,
        hasBet: state.hasBet,
        betPoints: state.hasBet ? state.betPoints : 0,
      );
      state = const CreateTaskState(); // 重置
      return taskId;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  void reset() {
    state = const CreateTaskState();
  }
}

final createTaskProvider =
    StateNotifierProvider.autoDispose<CreateTaskNotifier, CreateTaskState>(
        (ref) {
  final taskService = ref.watch(taskServiceProvider);
  return CreateTaskNotifier(taskService);
});
