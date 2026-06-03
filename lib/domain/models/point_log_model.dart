import 'point_type.dart';

/// 积分流水记录模型
class PointLogModel {
  final int id;
  final DateTime createdAt;
  final int amount; // 正数=获得，负数=消耗
  final PointType type;
  final String reason;
  final String? relatedId;
  final int balanceAfter;

  const PointLogModel({
    required this.id,
    required this.createdAt,
    required this.amount,
    required this.type,
    required this.reason,
    this.relatedId,
    required this.balanceAfter,
  });

  /// 是否是正向积分
  bool get isPositive => amount > 0;

  /// 是否是负向积分
  bool get isNegative => amount < 0;

  /// 获取显示用的金额字符串（带+/-符号）
  String get displayAmount {
    if (amount > 0) return '+$amount';
    return amount.toString();
  }

  @override
  String toString() => 'PointLogModel(id: $id, amount: $amount, type: ${type.label})';
}
