/// 兑换记录模型
class RedemptionModel {
  final int id;
  final int rewardId;
  final String rewardNameSnapshot;
  final int costPoints;
  final DateTime redeemedAt;
  final bool isUsed;
  final DateTime? usedAt;

  const RedemptionModel({
    required this.id,
    required this.rewardId,
    required this.rewardNameSnapshot,
    required this.costPoints,
    required this.redeemedAt,
    this.isUsed = false,
    this.usedAt,
  });

  /// 创建副本
  RedemptionModel copyWith({
    int? id,
    int? rewardId,
    String? rewardNameSnapshot,
    int? costPoints,
    DateTime? redeemedAt,
    bool? isUsed,
    DateTime? usedAt,
  }) {
    return RedemptionModel(
      id: id ?? this.id,
      rewardId: rewardId ?? this.rewardId,
      rewardNameSnapshot: rewardNameSnapshot ?? this.rewardNameSnapshot,
      costPoints: costPoints ?? this.costPoints,
      redeemedAt: redeemedAt ?? this.redeemedAt,
      isUsed: isUsed ?? this.isUsed,
      usedAt: usedAt ?? this.usedAt,
    );
  }

  /// 心理换算价格
  String get moneyPriceDisplay {
    final x = costPoints / 30.0;
    return '≈¥${x.toStringAsFixed(1)}';
  }

  @override
  String toString() => 'RedemptionModel(id: $id, rewardName: $rewardNameSnapshot, costPoints: $costPoints)';
}
