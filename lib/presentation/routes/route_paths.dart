import '../../core/constants/route_constants.dart';

/// 路由路径定义（用于go_router）
class RoutePaths {
  RoutePaths._();

  // Shell路由路径（底部导航）
  static const String today = '/today';
  static const String shop = '/shop';
  static const String stats = '/stats';
  static const String profile = '/profile';

  // 子路由路径
  static String taskDetail(int taskId) => '/task/$taskId';
  static const String createTask = '/create-task';
  static const String pointsHistory = '/points-history';
  static const String achievements = '/achievements';
  static const String level = '/level';
  static const String settings = '/settings';
  static const String backup = '/settings/backup';
  static const String aiSettings = '/settings/ai';
  static const String webdavSettings = '/settings/webdav';
  static const String notificationSettings = '/settings/notification';
  static const String widgetSettings = '/settings/widget';
}
