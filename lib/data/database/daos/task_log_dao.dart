import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/task_log_table.dart';
import '../tables/task_table.dart';
import '../../../core/utils/date_utils.dart';

part 'task_log_dao.g.dart';

/// 任务日志DAO
@DriftAccessor(tables: [TaskLogTable, TaskTable])
class TaskLogDao extends DatabaseAccessor<AppDatabase>
    with _$TaskLogDaoMixin {
  TaskLogDao(AppDatabase db) : super(db);

  /// 获取指定日期的任务日志
  Future<List<TaskLogTableData>> getLogsByDate(DateTime date) {
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));
    return (select(taskLogTable)
          ..where(
              (t) => t.date.isBiggerOrEqualValue(dayStart) & t.date.isSmallerThanValue(dayEnd))
          ..where((t) => t.isRevoked.equals(false)))
        .get();
  }

  /// 监听指定日期的任务日志
  Stream<List<TaskLogTableData>> watchLogsByDate(DateTime date) {
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));
    return (select(taskLogTable)
          ..where(
              (t) => t.date.isBiggerOrEqualValue(dayStart) & t.date.isSmallerThanValue(dayEnd))
          ..where((t) => t.isRevoked.equals(false)))
        .watch();
  }

  /// 检查任务今天是否已完成（且未撤销）
  Future<bool> isTaskCompletedToday(int taskId) async {
    final today = AppDateUtils.today();
    final tomorrow = today.add(const Duration(days: 1));
    final count = await customSelect(
      'SELECT COUNT(*) as count FROM task_logs '
      'WHERE task_id = ? AND date >= ? AND date < ? AND is_revoked = 0',
      variables: [
        Variable.withInt(taskId),
        Variable.withDateTime(today),
        Variable.withDateTime(tomorrow),
      ],
      readsFrom: {taskTable},
    ).getSingle();
    return (count.data['count'] as int) > 0;
  }

  /// 创建任务日志
  Future<int> createTaskLog(TaskLogTableCompanion log) {
    return into(taskLogTable).insert(log);
  }

  /// 撤销任务日志
  Future<void> revokeTaskLog(int logId) async {
    await (update(taskLogTable)..where((t) => t.id.equals(logId))).write(
      TaskLogTableCompanion(
        isRevoked: const Value(true),
        revokedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 获取指定日期已完成任务的总积分（S/A/B级，用于每日上限计算）
  Future<int> getTodayEarnedPoints(DateTime date) async {
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));
    final result = await customSelect(
      'SELECT COALESCE(SUM(earned_points), 0) as total FROM task_logs tl '
      'JOIN tasks t ON tl.task_id = t.id '
      'WHERE tl.date >= ? AND tl.date < ? AND tl.is_revoked = 0 '
      'AND t.level != \'C\'',
      variables: [
        Variable.withDateTime(dayStart),
        Variable.withDateTime(dayEnd),
      ],
      readsFrom: {taskTable, taskLogTable},
    ).getSingle();
    return result.data['total'] as int;
  }

  /// 获取今天指定任务的日志（包含已撤销的，用于撤销检查）
  Future<TaskLogTableData?> getTodayTaskLog(int taskId) async {
    final today = AppDateUtils.today();
    final tomorrow = today.add(const Duration(days: 1));
    return (select(taskLogTable)
          ..where((t) => t.taskId.equals(taskId))
          ..where(
              (t) => t.date.isBiggerOrEqualValue(today) & t.date.isSmallerThanValue(tomorrow))
          ..where((t) => t.isRevoked.equals(false))
          ..limit(1))
        .getSingleOrNull();
  }

  /// 获取所有任务日志（按时间倒序）
  Future<List<TaskLogTableData>> getAllLogs({
    int limit = 100,
    int offset = 0,
  }) {
    return (select(taskLogTable)
          ..where((t) => t.isRevoked.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.completedAt)])
          ..limit(limit, offset: offset))
        .get();
  }
}
