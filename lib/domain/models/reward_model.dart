/// 奖励商品模型
class RewardModel {
  final int id;
  final String name;
  final String? description;
  final int pricePoints;
  final double? moneyPrice;
  final String? imagePath;
  final bool isWish;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RewardModel({
    required this.id,
    required this.name,
    this.description,
    required this.pricePoints,
    this.moneyPrice,
    this.imagePath,
    this.isWish = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 创建副本
  RewardModel copyWith({
    int? id,
    String? name,
    String? description,
    int? pricePoints,
    double? moneyPrice,
    String? imagePath,
    bool? isWish,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RewardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pricePoints: pricePoints ?? this.pricePoints,
      moneyPrice: moneyPrice ?? this.moneyPrice,
      imagePath: imagePath ?? this.imagePath,
      isWish: isWish ?? this.isWish,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 心理换算价格：X = pricePoints / 30.0，保留1位小数
  String get moneyPriceDisplay {
    final x = pricePoints / 30.0;
    return '≈¥${x.toStringAsFixed(1)}';
  }

  @override
  String toString() => 'RewardModel(id: $id, name: $name, pricePoints: $pricePoints)';
}
