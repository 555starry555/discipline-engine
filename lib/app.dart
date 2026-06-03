import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/routes/app_router.dart';
import 'domain/providers/task_providers.dart';

/// 自律引擎 App 根组件
class DisciplineEngineApp extends ConsumerStatefulWidget {
  const DisciplineEngineApp({super.key});

  @override
  ConsumerState<DisciplineEngineApp> createState() =>
      _DisciplineEngineAppState();
}

class _DisciplineEngineAppState extends ConsumerState<DisciplineEngineApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // 延迟初始化数据库
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeDatabase();
    });
  }

  Future<void> _initializeDatabase() async {
    final db = ref.read(appDatabaseProvider);
    await db.initializeDatabase();
    if (mounted) {
      setState(() {
        _initialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);

    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('🔥', style: TextStyle(fontSize: 64)),
                SizedBox(height: 16),
                Text(
                  '自律引擎',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4E342E),
                  ),
                ),
                SizedBox(height: 24),
                CircularProgressIndicator(
                  color: Color(0xFFFF8A65),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp.router(
      title: '自律引擎',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
