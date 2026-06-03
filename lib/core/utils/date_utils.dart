/// 日期工具类
class AppDateUtils {
  AppDateUtils._();

  /// 获取今天的日期（不含时间）
  static DateTime today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// 获取昨天的日期
  static DateTime yesterday() {
    final t = today();
    return t.subtract(const Duration(days: 1));
  }

  /// 判断 date 是否是昨天
  static bool isYesterday(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    final y = yesterday();
    return d.year == y.year && d.month == y.month && d.day == y.day;
  }

  /// 判断 date 是否是今天
  static bool isToday(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    final t = today();
    return d.year == t.year && d.month == t.month && d.day == t.day;
  }

  /// 判断两个日期是否是同一天
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// 格式化日期为 YYYY-MM-DD
  static String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// 格式化日期为 MM月DD日
  static String formatDateChinese(DateTime date) {
    return '${date.month}月${date.day}日';
  }

  /// 格式化日期时间为 MM月DD日 HH:mm
  static String formatDateTimeChinese(DateTime date) {
    return '${date.month}月${date.day}日 ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  /// 格式化为相对时间描述（刚刚、x分钟前、x小时前、今天HH:mm、昨天HH:mm、MM月DD日）
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) {
      return '刚刚';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}分钟前';
    } else if (diff.inHours < 24 && isToday(dateTime)) {
      return '今天${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (isYesterday(dateTime)) {
      return '昨天${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else {
      return formatDateChinese(dateTime);
    }
  }

  /// 获取本周的起始日期（周一）
  static DateTime getWeekStart(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    return d.subtract(Duration(days: d.weekday - 1));
  }

  /// 获取本月的起始日期
  static DateTime getMonthStart(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// 获取最近N天的日期列表（包含今天）
  static List<DateTime> getLastNDays(int n) {
    final t = today();
    return List.generate(n, (i) => t.subtract(Duration(days: n - 1 - i)));
  }
}
