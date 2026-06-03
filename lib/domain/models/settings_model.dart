/// 应用设置模型
class SettingsModel {
  final int id;
  final bool habitPenaltyEnabled;
  final bool lazyTaxEnabled;
  final int lazyTaxTarget;
  final bool streakProtectionEnabled;
  final String? aiBaseUrl;
  final String? aiApiKey;
  final String? aiModel;
  final bool aiPricingEnabled;
  final bool weeklySummaryEnabled;
  final String? webdavUrl;
  final String? webdavUsername;
  final String? webdavPassword;
  final String? webdavPath;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SettingsModel({
    required this.id,
    this.habitPenaltyEnabled = false,
    this.lazyTaxEnabled = false,
    this.lazyTaxTarget = 0,
    this.streakProtectionEnabled = false,
    this.aiBaseUrl,
    this.aiApiKey,
    this.aiModel,
    this.aiPricingEnabled = false,
    this.weeklySummaryEnabled = false,
    this.webdavUrl,
    this.webdavUsername,
    this.webdavPassword,
    this.webdavPath,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 创建副本
  SettingsModel copyWith({
    int? id,
    bool? habitPenaltyEnabled,
    bool? lazyTaxEnabled,
    int? lazyTaxTarget,
    bool? streakProtectionEnabled,
    String? aiBaseUrl,
    String? aiApiKey,
    String? aiModel,
    bool? aiPricingEnabled,
    bool? weeklySummaryEnabled,
    String? webdavUrl,
    String? webdavUsername,
    String? webdavPassword,
    String? webdavPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SettingsModel(
      id: id ?? this.id,
      habitPenaltyEnabled: habitPenaltyEnabled ?? this.habitPenaltyEnabled,
      lazyTaxEnabled: lazyTaxEnabled ?? this.lazyTaxEnabled,
      lazyTaxTarget: lazyTaxTarget ?? this.lazyTaxTarget,
      streakProtectionEnabled: streakProtectionEnabled ?? this.streakProtectionEnabled,
      aiBaseUrl: aiBaseUrl ?? this.aiBaseUrl,
      aiApiKey: aiApiKey ?? this.aiApiKey,
      aiModel: aiModel ?? this.aiModel,
      aiPricingEnabled: aiPricingEnabled ?? this.aiPricingEnabled,
      weeklySummaryEnabled: weeklySummaryEnabled ?? this.weeklySummaryEnabled,
      webdavUrl: webdavUrl ?? this.webdavUrl,
      webdavUsername: webdavUsername ?? this.webdavUsername,
      webdavPassword: webdavPassword ?? this.webdavPassword,
      webdavPath: webdavPath ?? this.webdavPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 默认设置
  factory SettingsModel.initial() {
    final now = DateTime.now();
    return SettingsModel(
      id: 1,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  String toString() => 'SettingsModel(id: $id, aiPricing: $aiPricingEnabled)';
}
