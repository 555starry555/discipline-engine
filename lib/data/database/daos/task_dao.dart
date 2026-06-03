import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/task_table.dart';
import '../tables/task_log_table.dart';

part 'task_dao.g.dart';

/// 任务DAO
@DriftAccessor(tables: [TaskTable, TaskLogTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(AppDatabase db) : super(db);

  /// 获取所有活跃任务
  Future<List<TaskTableData>> getActiveTasks() {
    return (select(taskTable)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// 监听活跃任务列表
  Stream<List<TaskTableData>> watchActiveTasks() {
    return (select(taskTable)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  /// 根据ID获取任务
  Future<TaskTableData?> getTaskById(int id) {
    return (select(taskTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// 创建任务
  Future<int> createTask(TaskTableCompanion task) {
    return into(taskTable).insert(task);
  }

  /// 更新任务
  Future<bool> updateTask(TaskTableCompanion task) async {
    return update(taskTable).replace(task);
  }

  /// 删除任务（软删除，设为非活跃）
  Future<void> deactivateTask(int id) async {
    await (update(taskTable)..where((t) => t.id.equals(id))).write(
      TaskTableCompanion(
        isActive: const Value(false),
        status: const Value('archived'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 获取活跃任务数量
  Future<int> getActiveTaskCount() async {
    final count = await customSelect(
      'SELECT COUNT(*) as count FROM tasks WHERE is_active = 1',
      readsFrom: {taskTable},
    ).getSingle();
    return count.data['count'] as int;
  }

  /// 获取已完成任务总数（非撤销的TaskLog去重计数）
  Future<int> getCompletedTaskCount() async {
    final count = await customSelect(
      'SELECT COUNT(DISTINCT task_id) as count FROM task_logs WHERE is_revoked = 0',
      readsFrom: {taskLogTable},
    ).getSingle();
    return count.data['count'] as int;
  }

  /// 获取S级任务完成数
  Future<int> getSTaskCompletedCount() async {
    final count = await customSelect(
      'SELECT COUNT(*) as count FROM task_logs tl '
      'JOIN tasks t ON tl.task_id = t.id '
      'WHERE t.level = \'S\' AND tl.is_revoked = 0',
      readsFrom: {taskTable, taskLogTable},
    ).getSingle();
    return count.data['count'] as int;
  }

  /// 获取C级任务完成数
  Future<int> getCTaskCompletedCount() async {
    final count = await customSelect(
      'SELECT COUNT(*) as count FROM task_logs tl '
      'JOIN tasks t ON tl.task_id = t.id '
      'WHERE t.level = \'C\' AND tl.is_revoked = 0',
      readsFrom: {taskTable, taskLogTable},
    ).getSingle();
    return count.data['count'] as int;
  }
}
