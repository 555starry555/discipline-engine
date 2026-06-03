import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_paths.dart';
import '../widgets/navigation/bottom_nav_bar.dart';
import '../pages/today/today_page.dart';
import '../pages/shop/shop_page.dart';
import '../pages/stats/stats_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/task/create_task_page.dart';
import '../pages/task/task_detail_page.dart';
import '../pages/points/points_history_page.dart';
import '../pages/achievements/achievements_page.dart';
import '../pages/level/level_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/settings/backup_page.dart';
import '../pages/settings/ai_settings_page.dart';
import '../pages/settings/webdav_settings_page.dart';
import '../pages/settings/notification_settings_page.dart';
import '../pages/settings/widget_settings_page.dart';

/// 应用路由配置
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.today,
    routes: [
      // 带底部导航栏的Shell路由
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // 今日 Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.today,
                builder: (context, state) => const TodayPage(),
              ),
            ],
          ),
          // 商店 Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.shop,
                builder: (context, state) => const ShopPage(),
              ),
            ],
          ),
          // 统计 Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.stats,
                builder: (context, state) => const StatsPage(),
              ),
            ],
          ),
          // 我的 Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      // 子页面路由（不带底部导航栏）
      GoRoute(
        path: RoutePaths.createTask,
        builder: (context, state) => const CreateTaskPage(),
      ),
      GoRoute(
        path: '/task/:taskId',
        builder: (context, state) {
          final taskId = int.parse(state.pathParameters['taskId']!);
          return TaskDetailPage(taskId: taskId);
        },
      ),
      GoRoute(
        path: RoutePaths.pointsHistory,
        builder: (context, state) => const PointsHistoryPage(),
      ),
      GoRoute(
        path: RoutePaths.achievements,
        builder: (context, state) => const AchievementsPage(),
      ),
      GoRoute(
        path: RoutePaths.level,
        builder: (context, state) => const LevelPage(),
      ),
      GoRoute(
        path: RoutePaths.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.backup,
        builder: (context, state) => const BackupPage(),
      ),
      GoRoute(
        path: RoutePaths.aiSettings,
        builder: (context, state) => const AiSettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.webdavSettings,
        builder: (context, state) => const WebdavSettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.notificationSettings,
        builder: (context, state) => const NotificationSettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.widgetSettings,
        builder: (context, state) => const WidgetSettingsPage(),
      ),
    ],
  );
});
