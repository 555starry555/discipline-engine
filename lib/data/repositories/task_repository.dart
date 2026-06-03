import '../database/app_database.dart';

/// 任务仓库
class TaskRepository {
  final AppDatabase _db;

  TaskRepository(this._db);

  /// 获取活跃任务列表
  Future<List<TaskTableData>> getActiveTasks() {
    return _db.taskDao.getActiveTasks();
  }

  /// 监听活跃任务列表
  Stream<List<TaskTableData>> watchActiveTasks() {
    return _db.taskDao.watchActiveTasks();
  }

  /// 根据ID获取任务
  Future<TaskTableData?> getTaskById(int id) {
    return _db.taskDao.getTaskById(id);
  }
}
