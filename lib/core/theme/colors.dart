import 'package:flutter/material.dart';

/// 自律引擎色彩规范
/// 暖色治愈系配色方案
class AppColors {
  AppColors._();

  // ── 主色调 ──
  static const Color background = Color(0xFFFFFAF3); // 暖白色
  static const Color card = Color(0xFFFFFFFF); // 纯白
  static const Color primary = Color(0xFFFF8A65); // 珊瑚橙
  static const Color primaryLight = Color(0xFFFFCCBC); // 浅珊瑚
  static const Color accent = Color(0xFFFFB74D); // 暖黄
  static const Color danger = Color(0xFFE57373); // 暖红
  static const Color success = Color(0xFF81C784); // 暖绿
  static const Color textPrimary = Color(0xFF4E342E); // 深棕
  static const Color textSecondary = Color(0xFF8D6E63); // 浅棕
  static const Color border = Color(0xFFFFE0B2); // 边框暖黄
  static const Color gold = Color(0xFFFFD54F); // 金色

  // ── 等级颜色 ──
  static const Color levelC = Color(0xFFA5D6A7); // C级: 柔和绿
  static const Color levelCLight = Color(0xFFE8F5E9); // C级浅色背景
  static const Color levelB = Color(0xFF90CAF9); // B级: 暖蓝
  static const Color levelBLight = Color(0xFFE3F2FD); // B级浅色背景
  static const Color levelA = Color(0xFFFF8A65); // A级: 珊瑚橙
  static const Color levelALight = Color(0xFFFFF3E0); // A级浅色背景
  static const Color levelS = Color(0xFFFFD54F); // S级: 金色
  static const Color levelSLight = Color(0xFFFFFDE7); // S级浅色背景

  // ── 功能色 ──
  static const Color overlay = Color(0x80000000); // 遮罩层
  static const Color shimmer = Color(0xFFEEEEEE); // 加载骨架屏
  static const Color divider = Color(0xFFFFE0B2); // 分割线
  static const Color disabled = Color(0xFFBDBDBD); // 禁用状态

  /// 根据等级字符串获取对应颜色
  static Color getLevelColor(String level) {
    switch (level.toUpperCase()) {
      case 'S':
        return levelS;
      case 'A':
        return levelA;
      case 'B':
        return levelB;
      case 'C':
        return levelC;
      default:
        return levelC;
    }
  }

  /// 根据等级字符串获取对应的浅色背景
  static Color getLevelLightColor(String level) {
    switch (level.toUpperCase()) {
      case 'S':
        return levelSLight;
      case 'A':
        return levelALight;
      case 'B':
        return levelBLight;
      case 'C':
        return levelCLight;
      default:
        return levelCLight;
    }
  }
}
