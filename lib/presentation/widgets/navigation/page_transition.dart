import 'package:flutter/material.dart';

/// 自定义页面过渡动画
class AppPageTransitions {
  AppPageTransitions._();

  /// 从右向左滑入的过渡
  static SlideTransition slideFromRight(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeOutCubic));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  /// 从底部弹出的过渡
  static SlideTransition slideFromBottom(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeOutCubic));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  /// 淡入淡出过渡
  static FadeTransition fade(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ),
      child: child,
    );
  }
}
