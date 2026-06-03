// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserStatsTableTable extends UserStatsTable
    with TableInfo<$UserStatsTableTable, UserStatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _currentPointsMeta =
      const VerificationMeta('currentPoints');
  @override
  late final GeneratedColumn<int> currentPoints = GeneratedColumn<int>(
      'current_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalPointsMeta =
      const VerificationMeta('totalPoints');
  @override
  late final GeneratedColumn<int> totalPoints = GeneratedColumn<int>(
      'total_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalExpMeta =
      const VerificationMeta('totalExp');
  @override
  late final GeneratedColumn<int> totalExp = GeneratedColumn<int>(
      'total_exp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currentStreakMeta =
      const VerificationMeta('currentStreak');
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
      'current_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _longestStreakMeta =
      const VerificationMeta('longestStreak');
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
      'longest_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastCheckInDateMeta =
      const VerificationMeta('lastCheckInDate');
  @override
  late final GeneratedColumn<DateTime> lastCheckInDate =
      GeneratedColumn<DateTime>('last_check_in_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dailyUndoCountMeta =
      const VerificationMeta('dailyUndoCount');
  @override
  late final GeneratedColumn<int> dailyUndoCount = GeneratedColumn<int>(
      'daily_undo_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUndoDateMeta =
      const VerificationMeta('lastUndoDate');
  @override
  late final GeneratedColumn<DateTime> lastUndoDate = GeneratedColumn<DateTime>(
      'last_undo_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        currentPoints,
        totalPoints,
        totalExp,
        currentStreak,
        longestStreak,
        lastCheckInDate,
        dailyUndoCount,
        lastUndoDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_stats';
  @override
  VerificationContext validateIntegrity(Insertable<UserStatsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_points')) {
      context.handle(
          _currentPointsMeta,
          currentPoints.isAcceptableOrUnknown(
              data['current_points']!, _currentPointsMeta));
    }
    if (data.containsKey('total_points')) {
      context.handle(
          _totalPointsMeta,
          totalPoints.isAcceptableOrUnknown(
              data['total_points']!, _totalPointsMeta));
    }
    if (data.containsKey('total_exp')) {
      context.handle(_totalExpMeta,
          totalExp.isAcceptableOrUnknown(data['total_exp']!, _totalExpMeta));
    }
    if (data.containsKey('current_streak')) {
      context.handle(
          _currentStreakMeta,
          currentStreak.isAcceptableOrUnknown(
              data['current_streak']!, _currentStreakMeta));
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
          _longestStreakMeta,
          longestStreak.isAcceptableOrUnknown(
              data['longest_streak']!, _longestStreakMeta));
    }
    if (data.containsKey('last_check_in_date')) {
      context.handle(
          _lastCheckInDateMeta,
          lastCheckInDate.isAcceptableOrUnknown(
              data['last_check_in_date']!, _lastCheckInDateMeta));
    }
    if (data.containsKey('daily_undo_count')) {
      context.handle(
          _dailyUndoCountMeta,
          dailyUndoCount.isAcceptableOrUnknown(
              data['daily_undo_count']!, _dailyUndoCountMeta));
    }
    if (data.containsKey('last_undo_date')) {
      context.handle(
          _lastUndoDateMeta,
          lastUndoDate.isAcceptableOrUnknown(
              data['last_undo_date']!, _lastUndoDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserStatsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStatsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currentPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_points'])!,
      totalPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_points'])!,
      totalExp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_exp'])!,
      currentStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_streak'])!,
      longestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}longest_streak'])!,
      lastCheckInDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_check_in_date']),
      dailyUndoCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_undo_count'])!,
      lastUndoDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_undo_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserStatsTableTable createAlias(String alias) {
    return $UserStatsTableTable(attachedDatabase, alias);
  }
}

class UserStatsTableData extends DataClass
    implements Insertable<UserStatsTableData> {
  final int id;
  final int currentPoints;
  final int totalPoints;
  final int totalExp;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastCheckInDate;
  final int dailyUndoCount;
  final DateTime? lastUndoDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserStatsTableData(
      {required this.id,
      required this.currentPoints,
      required this.totalPoints,
      required this.totalExp,
      required this.currentStreak,
      required this.longestStreak,
      this.lastCheckInDate,
      required this.dailyUndoCount,
      this.lastUndoDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_points'] = Variable<int>(currentPoints);
    map['total_points'] = Variable<int>(totalPoints);
    map['total_exp'] = Variable<int>(totalExp);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastCheckInDate != null) {
      map['last_check_in_date'] = Variable<DateTime>(lastCheckInDate);
    }
    map['daily_undo_count'] = Variable<int>(dailyUndoCount);
    if (!nullToAbsent || lastUndoDate != null) {
      map['last_undo_date'] = Variable<DateTime>(lastUndoDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserStatsTableCompanion toCompanion(bool nullToAbsent) {
    return UserStatsTableCompanion(
      id: Value(id),
      currentPoints: Value(currentPoints),
      totalPoints: Value(totalPoints),
      totalExp: Value(totalExp),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastCheckInDate: lastCheckInDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCheckInDate),
      dailyUndoCount: Value(dailyUndoCount),
      lastUndoDate: lastUndoDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUndoDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserStatsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStatsTableData(
      id: serializer.fromJson<int>(json['id']),
      currentPoints: serializer.fromJson<int>(json['currentPoints']),
      totalPoints: serializer.fromJson<int>(json['totalPoints']),
      totalExp: serializer.fromJson<int>(json['totalExp']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastCheckInDate: serializer.fromJson<DateTime?>(json['lastCheckInDate']),
      dailyUndoCount: serializer.fromJson<int>(json['dailyUndoCount']),
      lastUndoDate: serializer.fromJson<DateTime?>(json['lastUndoDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentPoints': serializer.toJson<int>(currentPoints),
      'totalPoints': serializer.toJson<int>(totalPoints),
      'totalExp': serializer.toJson<int>(totalExp),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastCheckInDate': serializer.toJson<DateTime?>(lastCheckInDate),
      'dailyUndoCount': serializer.toJson<int>(dailyUndoCount),
      'lastUndoDate': serializer.toJson<DateTime?>(lastUndoDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserStatsTableData copyWith(
          {int? id,
          int? currentPoints,
          int? totalPoints,
          int? totalExp,
          int? currentStreak,
          int? longestStreak,
          Value<DateTime?> lastCheckInDate = const Value.absent(),
          int? dailyUndoCount,
          Value<DateTime?> lastUndoDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserStatsTableData(
        id: id ?? this.id,
        currentPoints: currentPoints ?? this.currentPoints,
        totalPoints: totalPoints ?? this.totalPoints,
        totalExp: totalExp ?? this.totalExp,
        currentStreak: currentStreak ?? this.currentStreak,
        longestStreak: longestStreak ?? this.longestStreak,
        lastCheckInDate: lastCheckInDate.present
            ? lastCheckInDate.value
            : this.lastCheckInDate,
        dailyUndoCount: dailyUndoCount ?? this.dailyUndoCount,
        lastUndoDate:
            lastUndoDate.present ? lastUndoDate.value : this.lastUndoDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserStatsTableData copyWithCompanion(UserStatsTableCompanion data) {
    return UserStatsTableData(
      id: data.id.present ? data.id.value : this.id,
      currentPoints: data.currentPoints.present
          ? data.currentPoints.value
          : this.currentPoints,
      totalPoints:
          data.totalPoints.present ? data.totalPoints.value : this.totalPoints,
      totalExp: data.totalExp.present ? data.totalExp.value : this.totalExp,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastCheckInDate: data.lastCheckInDate.present
          ? data.lastCheckInDate.value
          : this.lastCheckInDate,
      dailyUndoCount: data.dailyUndoCount.present
          ? data.dailyUndoCount.value
          : this.dailyUndoCount,
      lastUndoDate: data.lastUndoDate.present
          ? data.lastUndoDate.value
          : this.lastUndoDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStatsTableData(')
          ..write('id: $id, ')
          ..write('currentPoints: $currentPoints, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('totalExp: $totalExp, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastCheckInDate: $lastCheckInDate, ')
          ..write('dailyUndoCount: $dailyUndoCount, ')
          ..write('lastUndoDate: $lastUndoDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      currentPoints,
      totalPoints,
      totalExp,
      currentStreak,
      longestStreak,
      lastCheckInDate,
      dailyUndoCount,
      lastUndoDate,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStatsTableData &&
          other.id == this.id &&
          other.currentPoints == this.currentPoints &&
          other.totalPoints == this.totalPoints &&
          other.totalExp == this.totalExp &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastCheckInDate == this.lastCheckInDate &&
          other.dailyUndoCount == this.dailyUndoCount &&
          other.lastUndoDate == this.lastUndoDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserStatsTableCompanion extends UpdateCompanion<UserStatsTableData> {
  final Value<int> id;
  final Value<int> currentPoints;
  final Value<int> totalPoints;
  final Value<int> totalExp;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastCheckInDate;
  final Value<int> dailyUndoCount;
  final Value<DateTime?> lastUndoDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserStatsTableCompanion({
    this.id = const Value.absent(),
    this.currentPoints = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.totalExp = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastCheckInDate = const Value.absent(),
    this.dailyUndoCount = const Value.absent(),
    this.lastUndoDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserStatsTableCompanion.insert({
    this.id = const Value.absent(),
    this.currentPoints = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.totalExp = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastCheckInDate = const Value.absent(),
    this.dailyUndoCount = const Value.absent(),
    this.lastUndoDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserStatsTableData> custom({
    Expression<int>? id,
    Expression<int>? currentPoints,
    Expression<int>? totalPoints,
    Expression<int>? totalExp,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastCheckInDate,
    Expression<int>? dailyUndoCount,
    Expression<DateTime>? lastUndoDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentPoints != null) 'current_points': currentPoints,
      if (totalPoints != null) 'total_points': totalPoints,
      if (totalExp != null) 'total_exp': totalExp,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastCheckInDate != null) 'last_check_in_date': lastCheckInDate,
      if (dailyUndoCount != null) 'daily_undo_count': dailyUndoCount,
      if (lastUndoDate != null) 'last_undo_date': lastUndoDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserStatsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? currentPoints,
      Value<int>? totalPoints,
      Value<int>? totalExp,
      Value<int>? currentStreak,
      Value<int>? longestStreak,
      Value<DateTime?>? lastCheckInDate,
      Value<int>? dailyUndoCount,
      Value<DateTime?>? lastUndoDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UserStatsTableCompanion(
      id: id ?? this.id,
      currentPoints: currentPoints ?? this.currentPoints,
      totalPoints: totalPoints ?? this.totalPoints,
      totalExp: totalExp ?? this.totalExp,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastCheckInDate: lastCheckInDate ?? this.lastCheckInDate,
      dailyUndoCount: dailyUndoCount ?? this.dailyUndoCount,
      lastUndoDate: lastUndoDate ?? this.lastUndoDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentPoints.present) {
      map['current_points'] = Variable<int>(currentPoints.value);
    }
    if (totalPoints.present) {
      map['total_points'] = Variable<int>(totalPoints.value);
    }
    if (totalExp.present) {
      map['total_exp'] = Variable<int>(totalExp.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastCheckInDate.present) {
      map['last_check_in_date'] = Variable<DateTime>(lastCheckInDate.value);
    }
    if (dailyUndoCount.present) {
      map['daily_undo_count'] = Variable<int>(dailyUndoCount.value);
    }
    if (lastUndoDate.present) {
      map['last_undo_date'] = Variable<DateTime>(lastUndoDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStatsTableCompanion(')
          ..write('id: $id, ')
          ..write('currentPoints: $currentPoints, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('totalExp: $totalExp, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastCheckInDate: $lastCheckInDate, ')
          ..write('dailyUndoCount: $dailyUndoCount, ')
          ..write('lastUndoDate: $lastUndoDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _painValueMeta =
      const VerificationMeta('painValue');
  @override
  late final GeneratedColumn<int> painValue = GeneratedColumn<int>(
      'pain_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePointsMeta =
      const VerificationMeta('basePoints');
  @override
  late final GeneratedColumn<int> basePoints = GeneratedColumn<int>(
      'base_points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isDailyHabitMeta =
      const VerificationMeta('isDailyHabit');
  @override
  late final GeneratedColumn<bool> isDailyHabit = GeneratedColumn<bool>(
      'is_daily_habit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_daily_habit" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _hasBetMeta = const VerificationMeta('hasBet');
  @override
  late final GeneratedColumn<bool> hasBet = GeneratedColumn<bool>(
      'has_bet', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_bet" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _betPointsMeta =
      const VerificationMeta('betPoints');
  @override
  late final GeneratedColumn<int> betPoints = GeneratedColumn<int>(
      'bet_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        painValue,
        level,
        basePoints,
        isDailyHabit,
        isActive,
        status,
        hasBet,
        betPoints,
        dueDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('pain_value')) {
      context.handle(_painValueMeta,
          painValue.isAcceptableOrUnknown(data['pain_value']!, _painValueMeta));
    } else if (isInserting) {
      context.missing(_painValueMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('base_points')) {
      context.handle(
          _basePointsMeta,
          basePoints.isAcceptableOrUnknown(
              data['base_points']!, _basePointsMeta));
    } else if (isInserting) {
      context.missing(_basePointsMeta);
    }
    if (data.containsKey('is_daily_habit')) {
      context.handle(
          _isDailyHabitMeta,
          isDailyHabit.isAcceptableOrUnknown(
              data['is_daily_habit']!, _isDailyHabitMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('has_bet')) {
      context.handle(_hasBetMeta,
          hasBet.isAcceptableOrUnknown(data['has_bet']!, _hasBetMeta));
    }
    if (data.containsKey('bet_points')) {
      context.handle(_betPointsMeta,
          betPoints.isAcceptableOrUnknown(data['bet_points']!, _betPointsMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      painValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pain_value'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      basePoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_points'])!,
      isDailyHabit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_daily_habit'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      hasBet: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_bet'])!,
      betPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bet_points'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int id;
  final String title;
  final String? description;
  final int painValue;
  final String level;
  final int basePoints;
  final bool isDailyHabit;
  final bool isActive;
  final String status;
  final bool hasBet;
  final int betPoints;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TaskTableData(
      {required this.id,
      required this.title,
      this.description,
      required this.painValue,
      required this.level,
      required this.basePoints,
      required this.isDailyHabit,
      required this.isActive,
      required this.status,
      required this.hasBet,
      required this.betPoints,
      this.dueDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['pain_value'] = Variable<int>(painValue);
    map['level'] = Variable<String>(level);
    map['base_points'] = Variable<int>(basePoints);
    map['is_daily_habit'] = Variable<bool>(isDailyHabit);
    map['is_active'] = Variable<bool>(isActive);
    map['status'] = Variable<String>(status);
    map['has_bet'] = Variable<bool>(hasBet);
    map['bet_points'] = Variable<int>(betPoints);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      painValue: Value(painValue),
      level: Value(level),
      basePoints: Value(basePoints),
      isDailyHabit: Value(isDailyHabit),
      isActive: Value(isActive),
      status: Value(status),
      hasBet: Value(hasBet),
      betPoints: Value(betPoints),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      painValue: serializer.fromJson<int>(json['painValue']),
      level: serializer.fromJson<String>(json['level']),
      basePoints: serializer.fromJson<int>(json['basePoints']),
      isDailyHabit: serializer.fromJson<bool>(json['isDailyHabit']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      status: serializer.fromJson<String>(json['status']),
      hasBet: serializer.fromJson<bool>(json['hasBet']),
      betPoints: serializer.fromJson<int>(json['betPoints']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'painValue': serializer.toJson<int>(painValue),
      'level': serializer.toJson<String>(level),
      'basePoints': serializer.toJson<int>(basePoints),
      'isDailyHabit': serializer.toJson<bool>(isDailyHabit),
      'isActive': serializer.toJson<bool>(isActive),
      'status': serializer.toJson<String>(status),
      'hasBet': serializer.toJson<bool>(hasBet),
      'betPoints': serializer.toJson<int>(betPoints),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TaskTableData copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          int? painValue,
          String? level,
          int? basePoints,
          bool? isDailyHabit,
          bool? isActive,
          String? status,
          bool? hasBet,
          int? betPoints,
          Value<DateTime?> dueDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TaskTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        painValue: painValue ?? this.painValue,
        level: level ?? this.level,
        basePoints: basePoints ?? this.basePoints,
        isDailyHabit: isDailyHabit ?? this.isDailyHabit,
        isActive: isActive ?? this.isActive,
        status: status ?? this.status,
        hasBet: hasBet ?? this.hasBet,
        betPoints: betPoints ?? this.betPoints,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      painValue: data.painValue.present ? data.painValue.value : this.painValue,
      level: data.level.present ? data.level.value : this.level,
      basePoints:
          data.basePoints.present ? data.basePoints.value : this.basePoints,
      isDailyHabit: data.isDailyHabit.present
          ? data.isDailyHabit.value
          : this.isDailyHabit,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      status: data.status.present ? data.status.value : this.status,
      hasBet: data.hasBet.present ? data.hasBet.value : this.hasBet,
      betPoints: data.betPoints.present ? data.betPoints.value : this.betPoints,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('painValue: $painValue, ')
          ..write('level: $level, ')
          ..write('basePoints: $basePoints, ')
          ..write('isDailyHabit: $isDailyHabit, ')
          ..write('isActive: $isActive, ')
          ..write('status: $status, ')
          ..write('hasBet: $hasBet, ')
          ..write('betPoints: $betPoints, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      painValue,
      level,
      basePoints,
      isDailyHabit,
      isActive,
      status,
      hasBet,
      betPoints,
      dueDate,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.painValue == this.painValue &&
          other.level == this.level &&
          other.basePoints == this.basePoints &&
          other.isDailyHabit == this.isDailyHabit &&
          other.isActive == this.isActive &&
          other.status == this.status &&
          other.hasBet == this.hasBet &&
          other.betPoints == this.betPoints &&
          other.dueDate == this.dueDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> painValue;
  final Value<String> level;
  final Value<int> basePoints;
  final Value<bool> isDailyHabit;
  final Value<bool> isActive;
  final Value<String> status;
  final Value<bool> hasBet;
  final Value<int> betPoints;
  final Value<DateTime?> dueDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.painValue = const Value.absent(),
    this.level = const Value.absent(),
    this.basePoints = const Value.absent(),
    this.isDailyHabit = const Value.absent(),
    this.isActive = const Value.absent(),
    this.status = const Value.absent(),
    this.hasBet = const Value.absent(),
    this.betPoints = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int painValue,
    required String level,
    required int basePoints,
    this.isDailyHabit = const Value.absent(),
    this.isActive = const Value.absent(),
    this.status = const Value.absent(),
    this.hasBet = const Value.absent(),
    this.betPoints = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : title = Value(title),
        painValue = Value(painValue),
        level = Value(level),
        basePoints = Value(basePoints);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? painValue,
    Expression<String>? level,
    Expression<int>? basePoints,
    Expression<bool>? isDailyHabit,
    Expression<bool>? isActive,
    Expression<String>? status,
    Expression<bool>? hasBet,
    Expression<int>? betPoints,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (painValue != null) 'pain_value': painValue,
      if (level != null) 'level': level,
      if (basePoints != null) 'base_points': basePoints,
      if (isDailyHabit != null) 'is_daily_habit': isDailyHabit,
      if (isActive != null) 'is_active': isActive,
      if (status != null) 'status': status,
      if (hasBet != null) 'has_bet': hasBet,
      if (betPoints != null) 'bet_points': betPoints,
      if (dueDate != null) 'due_date': dueDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? painValue,
      Value<String>? level,
      Value<int>? basePoints,
      Value<bool>? isDailyHabit,
      Value<bool>? isActive,
      Value<String>? status,
      Value<bool>? hasBet,
      Value<int>? betPoints,
      Value<DateTime?>? dueDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      painValue: painValue ?? this.painValue,
      level: level ?? this.level,
      basePoints: basePoints ?? this.basePoints,
      isDailyHabit: isDailyHabit ?? this.isDailyHabit,
      isActive: isActive ?? this.isActive,
      status: status ?? this.status,
      hasBet: hasBet ?? this.hasBet,
      betPoints: betPoints ?? this.betPoints,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (painValue.present) {
      map['pain_value'] = Variable<int>(painValue.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (basePoints.present) {
      map['base_points'] = Variable<int>(basePoints.value);
    }
    if (isDailyHabit.present) {
      map['is_daily_habit'] = Variable<bool>(isDailyHabit.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (hasBet.present) {
      map['has_bet'] = Variable<bool>(hasBet.value);
    }
    if (betPoints.present) {
      map['bet_points'] = Variable<int>(betPoints.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('painValue: $painValue, ')
          ..write('level: $level, ')
          ..write('basePoints: $basePoints, ')
          ..write('isDailyHabit: $isDailyHabit, ')
          ..write('isActive: $isActive, ')
          ..write('status: $status, ')
          ..write('hasBet: $hasBet, ')
          ..write('betPoints: $betPoints, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaskLogTableTable extends TaskLogTable
    with TableInfo<$TaskLogTableTable, TaskLogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isMakeUpMeta =
      const VerificationMeta('isMakeUp');
  @override
  late final GeneratedColumn<bool> isMakeUp = GeneratedColumn<bool>(
      'is_make_up', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_make_up" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _earnedPointsMeta =
      const VerificationMeta('earnedPoints');
  @override
  late final GeneratedColumn<int> earnedPoints = GeneratedColumn<int>(
      'earned_points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _earnedExpMeta =
      const VerificationMeta('earnedExp');
  @override
  late final GeneratedColumn<int> earnedExp = GeneratedColumn<int>(
      'earned_exp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _basePointsMeta =
      const VerificationMeta('basePoints');
  @override
  late final GeneratedColumn<int> basePoints = GeneratedColumn<int>(
      'base_points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bonusPointsMeta =
      const VerificationMeta('bonusPoints');
  @override
  late final GeneratedColumn<int> bonusPoints = GeneratedColumn<int>(
      'bonus_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _overflowPointsMeta =
      const VerificationMeta('overflowPoints');
  @override
  late final GeneratedColumn<int> overflowPoints = GeneratedColumn<int>(
      'overflow_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _betReturnedPointsMeta =
      const VerificationMeta('betReturnedPoints');
  @override
  late final GeneratedColumn<int> betReturnedPoints = GeneratedColumn<int>(
      'bet_returned_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isRevokedMeta =
      const VerificationMeta('isRevoked');
  @override
  late final GeneratedColumn<bool> isRevoked = GeneratedColumn<bool>(
      'is_revoked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_revoked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _revokedAtMeta =
      const VerificationMeta('revokedAt');
  @override
  late final GeneratedColumn<DateTime> revokedAt = GeneratedColumn<DateTime>(
      'revoked_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        date,
        completedAt,
        isMakeUp,
        earnedPoints,
        earnedExp,
        basePoints,
        bonusPoints,
        overflowPoints,
        betReturnedPoints,
        isRevoked,
        revokedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_logs';
  @override
  VerificationContext validateIntegrity(Insertable<TaskLogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('is_make_up')) {
      context.handle(_isMakeUpMeta,
          isMakeUp.isAcceptableOrUnknown(data['is_make_up']!, _isMakeUpMeta));
    }
    if (data.containsKey('earned_points')) {
      context.handle(
          _earnedPointsMeta,
          earnedPoints.isAcceptableOrUnknown(
              data['earned_points']!, _earnedPointsMeta));
    } else if (isInserting) {
      context.missing(_earnedPointsMeta);
    }
    if (data.containsKey('earned_exp')) {
      context.handle(_earnedExpMeta,
          earnedExp.isAcceptableOrUnknown(data['earned_exp']!, _earnedExpMeta));
    } else if (isInserting) {
      context.missing(_earnedExpMeta);
    }
    if (data.containsKey('base_points')) {
      context.handle(
          _basePointsMeta,
          basePoints.isAcceptableOrUnknown(
              data['base_points']!, _basePointsMeta));
    } else if (isInserting) {
      context.missing(_basePointsMeta);
    }
    if (data.containsKey('bonus_points')) {
      context.handle(
          _bonusPointsMeta,
          bonusPoints.isAcceptableOrUnknown(
              data['bonus_points']!, _bonusPointsMeta));
    }
    if (data.containsKey('overflow_points')) {
      context.handle(
          _overflowPointsMeta,
          overflowPoints.isAcceptableOrUnknown(
              data['overflow_points']!, _overflowPointsMeta));
    }
    if (data.containsKey('bet_returned_points')) {
      context.handle(
          _betReturnedPointsMeta,
          betReturnedPoints.isAcceptableOrUnknown(
              data['bet_returned_points']!, _betReturnedPointsMeta));
    }
    if (data.containsKey('is_revoked')) {
      context.handle(_isRevokedMeta,
          isRevoked.isAcceptableOrUnknown(data['is_revoked']!, _isRevokedMeta));
    }
    if (data.containsKey('revoked_at')) {
      context.handle(_revokedAtMeta,
          revokedAt.isAcceptableOrUnknown(data['revoked_at']!, _revokedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskLogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskLogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at'])!,
      isMakeUp: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_make_up'])!,
      earnedPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}earned_points'])!,
      earnedExp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}earned_exp'])!,
      basePoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_points'])!,
      bonusPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bonus_points'])!,
      overflowPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}overflow_points'])!,
      betReturnedPoints: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}bet_returned_points'])!,
      isRevoked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_revoked'])!,
      revokedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}revoked_at']),
    );
  }

  @override
  $TaskLogTableTable createAlias(String alias) {
    return $TaskLogTableTable(attachedDatabase, alias);
  }
}

class TaskLogTableData extends DataClass
    implements Insertable<TaskLogTableData> {
  final int id;
  final int taskId;
  final DateTime date;
  final DateTime completedAt;
  final bool isMakeUp;
  final int earnedPoints;
  final int earnedExp;
  final int basePoints;
  final int bonusPoints;
  final int overflowPoints;
  final int betReturnedPoints;
  final bool isRevoked;
  final DateTime? revokedAt;
  const TaskLogTableData(
      {required this.id,
      required this.taskId,
      required this.date,
      required this.completedAt,
      required this.isMakeUp,
      required this.earnedPoints,
      required this.earnedExp,
      required this.basePoints,
      required this.bonusPoints,
      required this.overflowPoints,
      required this.betReturnedPoints,
      required this.isRevoked,
      this.revokedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['date'] = Variable<DateTime>(date);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['is_make_up'] = Variable<bool>(isMakeUp);
    map['earned_points'] = Variable<int>(earnedPoints);
    map['earned_exp'] = Variable<int>(earnedExp);
    map['base_points'] = Variable<int>(basePoints);
    map['bonus_points'] = Variable<int>(bonusPoints);
    map['overflow_points'] = Variable<int>(overflowPoints);
    map['bet_returned_points'] = Variable<int>(betReturnedPoints);
    map['is_revoked'] = Variable<bool>(isRevoked);
    if (!nullToAbsent || revokedAt != null) {
      map['revoked_at'] = Variable<DateTime>(revokedAt);
    }
    return map;
  }

  TaskLogTableCompanion toCompanion(bool nullToAbsent) {
    return TaskLogTableCompanion(
      id: Value(id),
      taskId: Value(taskId),
      date: Value(date),
      completedAt: Value(completedAt),
      isMakeUp: Value(isMakeUp),
      earnedPoints: Value(earnedPoints),
      earnedExp: Value(earnedExp),
      basePoints: Value(basePoints),
      bonusPoints: Value(bonusPoints),
      overflowPoints: Value(overflowPoints),
      betReturnedPoints: Value(betReturnedPoints),
      isRevoked: Value(isRevoked),
      revokedAt: revokedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(revokedAt),
    );
  }

  factory TaskLogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskLogTableData(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      date: serializer.fromJson<DateTime>(json['date']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      isMakeUp: serializer.fromJson<bool>(json['isMakeUp']),
      earnedPoints: serializer.fromJson<int>(json['earnedPoints']),
      earnedExp: serializer.fromJson<int>(json['earnedExp']),
      basePoints: serializer.fromJson<int>(json['basePoints']),
      bonusPoints: serializer.fromJson<int>(json['bonusPoints']),
      overflowPoints: serializer.fromJson<int>(json['overflowPoints']),
      betReturnedPoints: serializer.fromJson<int>(json['betReturnedPoints']),
      isRevoked: serializer.fromJson<bool>(json['isRevoked']),
      revokedAt: serializer.fromJson<DateTime?>(json['revokedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'date': serializer.toJson<DateTime>(date),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'isMakeUp': serializer.toJson<bool>(isMakeUp),
      'earnedPoints': serializer.toJson<int>(earnedPoints),
      'earnedExp': serializer.toJson<int>(earnedExp),
      'basePoints': serializer.toJson<int>(basePoints),
      'bonusPoints': serializer.toJson<int>(bonusPoints),
      'overflowPoints': serializer.toJson<int>(overflowPoints),
      'betReturnedPoints': serializer.toJson<int>(betReturnedPoints),
      'isRevoked': serializer.toJson<bool>(isRevoked),
      'revokedAt': serializer.toJson<DateTime?>(revokedAt),
    };
  }

  TaskLogTableData copyWith(
          {int? id,
          int? taskId,
          DateTime? date,
          DateTime? completedAt,
          bool? isMakeUp,
          int? earnedPoints,
          int? earnedExp,
          int? basePoints,
          int? bonusPoints,
          int? overflowPoints,
          int? betReturnedPoints,
          bool? isRevoked,
          Value<DateTime?> revokedAt = const Value.absent()}) =>
      TaskLogTableData(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        date: date ?? this.date,
        completedAt: completedAt ?? this.completedAt,
        isMakeUp: isMakeUp ?? this.isMakeUp,
        earnedPoints: earnedPoints ?? this.earnedPoints,
        earnedExp: earnedExp ?? this.earnedExp,
        basePoints: basePoints ?? this.basePoints,
        bonusPoints: bonusPoints ?? this.bonusPoints,
        overflowPoints: overflowPoints ?? this.overflowPoints,
        betReturnedPoints: betReturnedPoints ?? this.betReturnedPoints,
        isRevoked: isRevoked ?? this.isRevoked,
        revokedAt: revokedAt.present ? revokedAt.value : this.revokedAt,
      );
  TaskLogTableData copyWithCompanion(TaskLogTableCompanion data) {
    return TaskLogTableData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      date: data.date.present ? data.date.value : this.date,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      isMakeUp: data.isMakeUp.present ? data.isMakeUp.value : this.isMakeUp,
      earnedPoints: data.earnedPoints.present
          ? data.earnedPoints.value
          : this.earnedPoints,
      earnedExp: data.earnedExp.present ? data.earnedExp.value : this.earnedExp,
      basePoints:
          data.basePoints.present ? data.basePoints.value : this.basePoints,
      bonusPoints:
          data.bonusPoints.present ? data.bonusPoints.value : this.bonusPoints,
      overflowPoints: data.overflowPoints.present
          ? data.overflowPoints.value
          : this.overflowPoints,
      betReturnedPoints: data.betReturnedPoints.present
          ? data.betReturnedPoints.value
          : this.betReturnedPoints,
      isRevoked: data.isRevoked.present ? data.isRevoked.value : this.isRevoked,
      revokedAt: data.revokedAt.present ? data.revokedAt.value : this.revokedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskLogTableData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('date: $date, ')
          ..write('completedAt: $completedAt, ')
          ..write('isMakeUp: $isMakeUp, ')
          ..write('earnedPoints: $earnedPoints, ')
          ..write('earnedExp: $earnedExp, ')
          ..write('basePoints: $basePoints, ')
          ..write('bonusPoints: $bonusPoints, ')
          ..write('overflowPoints: $overflowPoints, ')
          ..write('betReturnedPoints: $betReturnedPoints, ')
          ..write('isRevoked: $isRevoked, ')
          ..write('revokedAt: $revokedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      taskId,
      date,
      completedAt,
      isMakeUp,
      earnedPoints,
      earnedExp,
      basePoints,
      bonusPoints,
      overflowPoints,
      betReturnedPoints,
      isRevoked,
      revokedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskLogTableData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.date == this.date &&
          other.completedAt == this.completedAt &&
          other.isMakeUp == this.isMakeUp &&
          other.earnedPoints == this.earnedPoints &&
          other.earnedExp == this.earnedExp &&
          other.basePoints == this.basePoints &&
          other.bonusPoints == this.bonusPoints &&
          other.overflowPoints == this.overflowPoints &&
          other.betReturnedPoints == this.betReturnedPoints &&
          other.isRevoked == this.isRevoked &&
          other.revokedAt == this.revokedAt);
}

class TaskLogTableCompanion extends UpdateCompanion<TaskLogTableData> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<DateTime> date;
  final Value<DateTime> completedAt;
  final Value<bool> isMakeUp;
  final Value<int> earnedPoints;
  final Value<int> earnedExp;
  final Value<int> basePoints;
  final Value<int> bonusPoints;
  final Value<int> overflowPoints;
  final Value<int> betReturnedPoints;
  final Value<bool> isRevoked;
  final Value<DateTime?> revokedAt;
  const TaskLogTableCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.date = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.isMakeUp = const Value.absent(),
    this.earnedPoints = const Value.absent(),
    this.earnedExp = const Value.absent(),
    this.basePoints = const Value.absent(),
    this.bonusPoints = const Value.absent(),
    this.overflowPoints = const Value.absent(),
    this.betReturnedPoints = const Value.absent(),
    this.isRevoked = const Value.absent(),
    this.revokedAt = const Value.absent(),
  });
  TaskLogTableCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    required DateTime date,
    this.completedAt = const Value.absent(),
    this.isMakeUp = const Value.absent(),
    required int earnedPoints,
    required int earnedExp,
    required int basePoints,
    this.bonusPoints = const Value.absent(),
    this.overflowPoints = const Value.absent(),
    this.betReturnedPoints = const Value.absent(),
    this.isRevoked = const Value.absent(),
    this.revokedAt = const Value.absent(),
  })  : taskId = Value(taskId),
        date = Value(date),
        earnedPoints = Value(earnedPoints),
        earnedExp = Value(earnedExp),
        basePoints = Value(basePoints);
  static Insertable<TaskLogTableData> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<DateTime>? date,
    Expression<DateTime>? completedAt,
    Expression<bool>? isMakeUp,
    Expression<int>? earnedPoints,
    Expression<int>? earnedExp,
    Expression<int>? basePoints,
    Expression<int>? bonusPoints,
    Expression<int>? overflowPoints,
    Expression<int>? betReturnedPoints,
    Expression<bool>? isRevoked,
    Expression<DateTime>? revokedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (date != null) 'date': date,
      if (completedAt != null) 'completed_at': completedAt,
      if (isMakeUp != null) 'is_make_up': isMakeUp,
      if (earnedPoints != null) 'earned_points': earnedPoints,
      if (earnedExp != null) 'earned_exp': earnedExp,
      if (basePoints != null) 'base_points': basePoints,
      if (bonusPoints != null) 'bonus_points': bonusPoints,
      if (overflowPoints != null) 'overflow_points': overflowPoints,
      if (betReturnedPoints != null) 'bet_returned_points': betReturnedPoints,
      if (isRevoked != null) 'is_revoked': isRevoked,
      if (revokedAt != null) 'revoked_at': revokedAt,
    });
  }

  TaskLogTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<DateTime>? date,
      Value<DateTime>? completedAt,
      Value<bool>? isMakeUp,
      Value<int>? earnedPoints,
      Value<int>? earnedExp,
      Value<int>? basePoints,
      Value<int>? bonusPoints,
      Value<int>? overflowPoints,
      Value<int>? betReturnedPoints,
      Value<bool>? isRevoked,
      Value<DateTime?>? revokedAt}) {
    return TaskLogTableCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      date: date ?? this.date,
      completedAt: completedAt ?? this.completedAt,
      isMakeUp: isMakeUp ?? this.isMakeUp,
      earnedPoints: earnedPoints ?? this.earnedPoints,
      earnedExp: earnedExp ?? this.earnedExp,
      basePoints: basePoints ?? this.basePoints,
      bonusPoints: bonusPoints ?? this.bonusPoints,
      overflowPoints: overflowPoints ?? this.overflowPoints,
      betReturnedPoints: betReturnedPoints ?? this.betReturnedPoints,
      isRevoked: isRevoked ?? this.isRevoked,
      revokedAt: revokedAt ?? this.revokedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (isMakeUp.present) {
      map['is_make_up'] = Variable<bool>(isMakeUp.value);
    }
    if (earnedPoints.present) {
      map['earned_points'] = Variable<int>(earnedPoints.value);
    }
    if (earnedExp.present) {
      map['earned_exp'] = Variable<int>(earnedExp.value);
    }
    if (basePoints.present) {
      map['base_points'] = Variable<int>(basePoints.value);
    }
    if (bonusPoints.present) {
      map['bonus_points'] = Variable<int>(bonusPoints.value);
    }
    if (overflowPoints.present) {
      map['overflow_points'] = Variable<int>(overflowPoints.value);
    }
    if (betReturnedPoints.present) {
      map['bet_returned_points'] = Variable<int>(betReturnedPoints.value);
    }
    if (isRevoked.present) {
      map['is_revoked'] = Variable<bool>(isRevoked.value);
    }
    if (revokedAt.present) {
      map['revoked_at'] = Variable<DateTime>(revokedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskLogTableCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('date: $date, ')
          ..write('completedAt: $completedAt, ')
          ..write('isMakeUp: $isMakeUp, ')
          ..write('earnedPoints: $earnedPoints, ')
          ..write('earnedExp: $earnedExp, ')
          ..write('basePoints: $basePoints, ')
          ..write('bonusPoints: $bonusPoints, ')
          ..write('overflowPoints: $overflowPoints, ')
          ..write('betReturnedPoints: $betReturnedPoints, ')
          ..write('isRevoked: $isRevoked, ')
          ..write('revokedAt: $revokedAt')
          ..write(')'))
        .toString();
  }
}

class $PointLogTableTable extends PointLogTable
    with TableInfo<$PointLogTableTable, PointLogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relatedIdMeta =
      const VerificationMeta('relatedId');
  @override
  late final GeneratedColumn<String> relatedId = GeneratedColumn<String>(
      'related_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _balanceAfterMeta =
      const VerificationMeta('balanceAfter');
  @override
  late final GeneratedColumn<int> balanceAfter = GeneratedColumn<int>(
      'balance_after', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, amount, type, reason, relatedId, balanceAfter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'point_logs';
  @override
  VerificationContext validateIntegrity(Insertable<PointLogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('related_id')) {
      context.handle(_relatedIdMeta,
          relatedId.isAcceptableOrUnknown(data['related_id']!, _relatedIdMeta));
    }
    if (data.containsKey('balance_after')) {
      context.handle(
          _balanceAfterMeta,
          balanceAfter.isAcceptableOrUnknown(
              data['balance_after']!, _balanceAfterMeta));
    } else if (isInserting) {
      context.missing(_balanceAfterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointLogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointLogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      relatedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}related_id']),
      balanceAfter: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}balance_after'])!,
    );
  }

  @override
  $PointLogTableTable createAlias(String alias) {
    return $PointLogTableTable(attachedDatabase, alias);
  }
}

class PointLogTableData extends DataClass
    implements Insertable<PointLogTableData> {
  final int id;
  final DateTime createdAt;
  final int amount;
  final String type;
  final String reason;
  final String? relatedId;
  final int balanceAfter;
  const PointLogTableData(
      {required this.id,
      required this.createdAt,
      required this.amount,
      required this.type,
      required this.reason,
      this.relatedId,
      required this.balanceAfter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['amount'] = Variable<int>(amount);
    map['type'] = Variable<String>(type);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || relatedId != null) {
      map['related_id'] = Variable<String>(relatedId);
    }
    map['balance_after'] = Variable<int>(balanceAfter);
    return map;
  }

  PointLogTableCompanion toCompanion(bool nullToAbsent) {
    return PointLogTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      amount: Value(amount),
      type: Value(type),
      reason: Value(reason),
      relatedId: relatedId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedId),
      balanceAfter: Value(balanceAfter),
    );
  }

  factory PointLogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointLogTableData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      amount: serializer.fromJson<int>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      reason: serializer.fromJson<String>(json['reason']),
      relatedId: serializer.fromJson<String?>(json['relatedId']),
      balanceAfter: serializer.fromJson<int>(json['balanceAfter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'amount': serializer.toJson<int>(amount),
      'type': serializer.toJson<String>(type),
      'reason': serializer.toJson<String>(reason),
      'relatedId': serializer.toJson<String?>(relatedId),
      'balanceAfter': serializer.toJson<int>(balanceAfter),
    };
  }

  PointLogTableData copyWith(
          {int? id,
          DateTime? createdAt,
          int? amount,
          String? type,
          String? reason,
          Value<String?> relatedId = const Value.absent(),
          int? balanceAfter}) =>
      PointLogTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        reason: reason ?? this.reason,
        relatedId: relatedId.present ? relatedId.value : this.relatedId,
        balanceAfter: balanceAfter ?? this.balanceAfter,
      );
  PointLogTableData copyWithCompanion(PointLogTableCompanion data) {
    return PointLogTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      reason: data.reason.present ? data.reason.value : this.reason,
      relatedId: data.relatedId.present ? data.relatedId.value : this.relatedId,
      balanceAfter: data.balanceAfter.present
          ? data.balanceAfter.value
          : this.balanceAfter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointLogTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('reason: $reason, ')
          ..write('relatedId: $relatedId, ')
          ..write('balanceAfter: $balanceAfter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, amount, type, reason, relatedId, balanceAfter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointLogTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.reason == this.reason &&
          other.relatedId == this.relatedId &&
          other.balanceAfter == this.balanceAfter);
}

class PointLogTableCompanion extends UpdateCompanion<PointLogTableData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> amount;
  final Value<String> type;
  final Value<String> reason;
  final Value<String?> relatedId;
  final Value<int> balanceAfter;
  const PointLogTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.reason = const Value.absent(),
    this.relatedId = const Value.absent(),
    this.balanceAfter = const Value.absent(),
  });
  PointLogTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int amount,
    required String type,
    required String reason,
    this.relatedId = const Value.absent(),
    required int balanceAfter,
  })  : amount = Value(amount),
        type = Value(type),
        reason = Value(reason),
        balanceAfter = Value(balanceAfter);
  static Insertable<PointLogTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? amount,
    Expression<String>? type,
    Expression<String>? reason,
    Expression<String>? relatedId,
    Expression<int>? balanceAfter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (reason != null) 'reason': reason,
      if (relatedId != null) 'related_id': relatedId,
      if (balanceAfter != null) 'balance_after': balanceAfter,
    });
  }

  PointLogTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<int>? amount,
      Value<String>? type,
      Value<String>? reason,
      Value<String?>? relatedId,
      Value<int>? balanceAfter}) {
    return PointLogTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      reason: reason ?? this.reason,
      relatedId: relatedId ?? this.relatedId,
      balanceAfter: balanceAfter ?? this.balanceAfter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (relatedId.present) {
      map['related_id'] = Variable<String>(relatedId.value);
    }
    if (balanceAfter.present) {
      map['balance_after'] = Variable<int>(balanceAfter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointLogTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('reason: $reason, ')
          ..write('relatedId: $relatedId, ')
          ..write('balanceAfter: $balanceAfter')
          ..write(')'))
        .toString();
  }
}

class $RewardItemTableTable extends RewardItemTable
    with TableInfo<$RewardItemTableTable, RewardItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RewardItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pricePointsMeta =
      const VerificationMeta('pricePoints');
  @override
  late final GeneratedColumn<int> pricePoints = GeneratedColumn<int>(
      'price_points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moneyPriceMeta =
      const VerificationMeta('moneyPrice');
  @override
  late final GeneratedColumn<double> moneyPrice = GeneratedColumn<double>(
      'money_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isWishMeta = const VerificationMeta('isWish');
  @override
  late final GeneratedColumn<bool> isWish = GeneratedColumn<bool>(
      'is_wish', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_wish" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        pricePoints,
        moneyPrice,
        imagePath,
        isWish,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reward_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<RewardItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('price_points')) {
      context.handle(
          _pricePointsMeta,
          pricePoints.isAcceptableOrUnknown(
              data['price_points']!, _pricePointsMeta));
    } else if (isInserting) {
      context.missing(_pricePointsMeta);
    }
    if (data.containsKey('money_price')) {
      context.handle(
          _moneyPriceMeta,
          moneyPrice.isAcceptableOrUnknown(
              data['money_price']!, _moneyPriceMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('is_wish')) {
      context.handle(_isWishMeta,
          isWish.isAcceptableOrUnknown(data['is_wish']!, _isWishMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RewardItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RewardItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      pricePoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_points'])!,
      moneyPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}money_price']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      isWish: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_wish'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RewardItemTableTable createAlias(String alias) {
    return $RewardItemTableTable(attachedDatabase, alias);
  }
}

class RewardItemTableData extends DataClass
    implements Insertable<RewardItemTableData> {
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
  const RewardItemTableData(
      {required this.id,
      required this.name,
      this.description,
      required this.pricePoints,
      this.moneyPrice,
      this.imagePath,
      required this.isWish,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['price_points'] = Variable<int>(pricePoints);
    if (!nullToAbsent || moneyPrice != null) {
      map['money_price'] = Variable<double>(moneyPrice);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['is_wish'] = Variable<bool>(isWish);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RewardItemTableCompanion toCompanion(bool nullToAbsent) {
    return RewardItemTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      pricePoints: Value(pricePoints),
      moneyPrice: moneyPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(moneyPrice),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isWish: Value(isWish),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RewardItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RewardItemTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      pricePoints: serializer.fromJson<int>(json['pricePoints']),
      moneyPrice: serializer.fromJson<double?>(json['moneyPrice']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isWish: serializer.fromJson<bool>(json['isWish']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'pricePoints': serializer.toJson<int>(pricePoints),
      'moneyPrice': serializer.toJson<double?>(moneyPrice),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isWish': serializer.toJson<bool>(isWish),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RewardItemTableData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          int? pricePoints,
          Value<double?> moneyPrice = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          bool? isWish,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      RewardItemTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        pricePoints: pricePoints ?? this.pricePoints,
        moneyPrice: moneyPrice.present ? moneyPrice.value : this.moneyPrice,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        isWish: isWish ?? this.isWish,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  RewardItemTableData copyWithCompanion(RewardItemTableCompanion data) {
    return RewardItemTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      pricePoints:
          data.pricePoints.present ? data.pricePoints.value : this.pricePoints,
      moneyPrice:
          data.moneyPrice.present ? data.moneyPrice.value : this.moneyPrice,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isWish: data.isWish.present ? data.isWish.value : this.isWish,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RewardItemTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pricePoints: $pricePoints, ')
          ..write('moneyPrice: $moneyPrice, ')
          ..write('imagePath: $imagePath, ')
          ..write('isWish: $isWish, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, pricePoints,
      moneyPrice, imagePath, isWish, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RewardItemTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.pricePoints == this.pricePoints &&
          other.moneyPrice == this.moneyPrice &&
          other.imagePath == this.imagePath &&
          other.isWish == this.isWish &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RewardItemTableCompanion extends UpdateCompanion<RewardItemTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> pricePoints;
  final Value<double?> moneyPrice;
  final Value<String?> imagePath;
  final Value<bool> isWish;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RewardItemTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.pricePoints = const Value.absent(),
    this.moneyPrice = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isWish = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RewardItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required int pricePoints,
    this.moneyPrice = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isWish = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        pricePoints = Value(pricePoints);
  static Insertable<RewardItemTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? pricePoints,
    Expression<double>? moneyPrice,
    Expression<String>? imagePath,
    Expression<bool>? isWish,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (pricePoints != null) 'price_points': pricePoints,
      if (moneyPrice != null) 'money_price': moneyPrice,
      if (imagePath != null) 'image_path': imagePath,
      if (isWish != null) 'is_wish': isWish,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RewardItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<int>? pricePoints,
      Value<double?>? moneyPrice,
      Value<String?>? imagePath,
      Value<bool>? isWish,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return RewardItemTableCompanion(
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pricePoints.present) {
      map['price_points'] = Variable<int>(pricePoints.value);
    }
    if (moneyPrice.present) {
      map['money_price'] = Variable<double>(moneyPrice.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (isWish.present) {
      map['is_wish'] = Variable<bool>(isWish.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RewardItemTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pricePoints: $pricePoints, ')
          ..write('moneyPrice: $moneyPrice, ')
          ..write('imagePath: $imagePath, ')
          ..write('isWish: $isWish, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RedemptionTableTable extends RedemptionTable
    with TableInfo<$RedemptionTableTable, RedemptionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RedemptionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rewardIdMeta =
      const VerificationMeta('rewardId');
  @override
  late final GeneratedColumn<int> rewardId = GeneratedColumn<int>(
      'reward_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rewardNameSnapshotMeta =
      const VerificationMeta('rewardNameSnapshot');
  @override
  late final GeneratedColumn<String> rewardNameSnapshot =
      GeneratedColumn<String>('reward_name_snapshot', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costPointsMeta =
      const VerificationMeta('costPoints');
  @override
  late final GeneratedColumn<int> costPoints = GeneratedColumn<int>(
      'cost_points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _redeemedAtMeta =
      const VerificationMeta('redeemedAt');
  @override
  late final GeneratedColumn<DateTime> redeemedAt = GeneratedColumn<DateTime>(
      'redeemed_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isUsedMeta = const VerificationMeta('isUsed');
  @override
  late final GeneratedColumn<bool> isUsed = GeneratedColumn<bool>(
      'is_used', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_used" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _usedAtMeta = const VerificationMeta('usedAt');
  @override
  late final GeneratedColumn<DateTime> usedAt = GeneratedColumn<DateTime>(
      'used_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        rewardId,
        rewardNameSnapshot,
        costPoints,
        redeemedAt,
        isUsed,
        usedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'redemptions';
  @override
  VerificationContext validateIntegrity(
      Insertable<RedemptionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reward_id')) {
      context.handle(_rewardIdMeta,
          rewardId.isAcceptableOrUnknown(data['reward_id']!, _rewardIdMeta));
    } else if (isInserting) {
      context.missing(_rewardIdMeta);
    }
    if (data.containsKey('reward_name_snapshot')) {
      context.handle(
          _rewardNameSnapshotMeta,
          rewardNameSnapshot.isAcceptableOrUnknown(
              data['reward_name_snapshot']!, _rewardNameSnapshotMeta));
    } else if (isInserting) {
      context.missing(_rewardNameSnapshotMeta);
    }
    if (data.containsKey('cost_points')) {
      context.handle(
          _costPointsMeta,
          costPoints.isAcceptableOrUnknown(
              data['cost_points']!, _costPointsMeta));
    } else if (isInserting) {
      context.missing(_costPointsMeta);
    }
    if (data.containsKey('redeemed_at')) {
      context.handle(
          _redeemedAtMeta,
          redeemedAt.isAcceptableOrUnknown(
              data['redeemed_at']!, _redeemedAtMeta));
    }
    if (data.containsKey('is_used')) {
      context.handle(_isUsedMeta,
          isUsed.isAcceptableOrUnknown(data['is_used']!, _isUsedMeta));
    }
    if (data.containsKey('used_at')) {
      context.handle(_usedAtMeta,
          usedAt.isAcceptableOrUnknown(data['used_at']!, _usedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RedemptionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RedemptionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rewardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reward_id'])!,
      rewardNameSnapshot: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reward_name_snapshot'])!,
      costPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost_points'])!,
      redeemedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}redeemed_at'])!,
      isUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_used'])!,
      usedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}used_at']),
    );
  }

  @override
  $RedemptionTableTable createAlias(String alias) {
    return $RedemptionTableTable(attachedDatabase, alias);
  }
}

class RedemptionTableData extends DataClass
    implements Insertable<RedemptionTableData> {
  final int id;
  final int rewardId;
  final String rewardNameSnapshot;
  final int costPoints;
  final DateTime redeemedAt;
  final bool isUsed;
  final DateTime? usedAt;
  const RedemptionTableData(
      {required this.id,
      required this.rewardId,
      required this.rewardNameSnapshot,
      required this.costPoints,
      required this.redeemedAt,
      required this.isUsed,
      this.usedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reward_id'] = Variable<int>(rewardId);
    map['reward_name_snapshot'] = Variable<String>(rewardNameSnapshot);
    map['cost_points'] = Variable<int>(costPoints);
    map['redeemed_at'] = Variable<DateTime>(redeemedAt);
    map['is_used'] = Variable<bool>(isUsed);
    if (!nullToAbsent || usedAt != null) {
      map['used_at'] = Variable<DateTime>(usedAt);
    }
    return map;
  }

  RedemptionTableCompanion toCompanion(bool nullToAbsent) {
    return RedemptionTableCompanion(
      id: Value(id),
      rewardId: Value(rewardId),
      rewardNameSnapshot: Value(rewardNameSnapshot),
      costPoints: Value(costPoints),
      redeemedAt: Value(redeemedAt),
      isUsed: Value(isUsed),
      usedAt:
          usedAt == null && nullToAbsent ? const Value.absent() : Value(usedAt),
    );
  }

  factory RedemptionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RedemptionTableData(
      id: serializer.fromJson<int>(json['id']),
      rewardId: serializer.fromJson<int>(json['rewardId']),
      rewardNameSnapshot:
          serializer.fromJson<String>(json['rewardNameSnapshot']),
      costPoints: serializer.fromJson<int>(json['costPoints']),
      redeemedAt: serializer.fromJson<DateTime>(json['redeemedAt']),
      isUsed: serializer.fromJson<bool>(json['isUsed']),
      usedAt: serializer.fromJson<DateTime?>(json['usedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rewardId': serializer.toJson<int>(rewardId),
      'rewardNameSnapshot': serializer.toJson<String>(rewardNameSnapshot),
      'costPoints': serializer.toJson<int>(costPoints),
      'redeemedAt': serializer.toJson<DateTime>(redeemedAt),
      'isUsed': serializer.toJson<bool>(isUsed),
      'usedAt': serializer.toJson<DateTime?>(usedAt),
    };
  }

  RedemptionTableData copyWith(
          {int? id,
          int? rewardId,
          String? rewardNameSnapshot,
          int? costPoints,
          DateTime? redeemedAt,
          bool? isUsed,
          Value<DateTime?> usedAt = const Value.absent()}) =>
      RedemptionTableData(
        id: id ?? this.id,
        rewardId: rewardId ?? this.rewardId,
        rewardNameSnapshot: rewardNameSnapshot ?? this.rewardNameSnapshot,
        costPoints: costPoints ?? this.costPoints,
        redeemedAt: redeemedAt ?? this.redeemedAt,
        isUsed: isUsed ?? this.isUsed,
        usedAt: usedAt.present ? usedAt.value : this.usedAt,
      );
  RedemptionTableData copyWithCompanion(RedemptionTableCompanion data) {
    return RedemptionTableData(
      id: data.id.present ? data.id.value : this.id,
      rewardId: data.rewardId.present ? data.rewardId.value : this.rewardId,
      rewardNameSnapshot: data.rewardNameSnapshot.present
          ? data.rewardNameSnapshot.value
          : this.rewardNameSnapshot,
      costPoints:
          data.costPoints.present ? data.costPoints.value : this.costPoints,
      redeemedAt:
          data.redeemedAt.present ? data.redeemedAt.value : this.redeemedAt,
      isUsed: data.isUsed.present ? data.isUsed.value : this.isUsed,
      usedAt: data.usedAt.present ? data.usedAt.value : this.usedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RedemptionTableData(')
          ..write('id: $id, ')
          ..write('rewardId: $rewardId, ')
          ..write('rewardNameSnapshot: $rewardNameSnapshot, ')
          ..write('costPoints: $costPoints, ')
          ..write('redeemedAt: $redeemedAt, ')
          ..write('isUsed: $isUsed, ')
          ..write('usedAt: $usedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, rewardId, rewardNameSnapshot, costPoints, redeemedAt, isUsed, usedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RedemptionTableData &&
          other.id == this.id &&
          other.rewardId == this.rewardId &&
          other.rewardNameSnapshot == this.rewardNameSnapshot &&
          other.costPoints == this.costPoints &&
          other.redeemedAt == this.redeemedAt &&
          other.isUsed == this.isUsed &&
          other.usedAt == this.usedAt);
}

class RedemptionTableCompanion extends UpdateCompanion<RedemptionTableData> {
  final Value<int> id;
  final Value<int> rewardId;
  final Value<String> rewardNameSnapshot;
  final Value<int> costPoints;
  final Value<DateTime> redeemedAt;
  final Value<bool> isUsed;
  final Value<DateTime?> usedAt;
  const RedemptionTableCompanion({
    this.id = const Value.absent(),
    this.rewardId = const Value.absent(),
    this.rewardNameSnapshot = const Value.absent(),
    this.costPoints = const Value.absent(),
    this.redeemedAt = const Value.absent(),
    this.isUsed = const Value.absent(),
    this.usedAt = const Value.absent(),
  });
  RedemptionTableCompanion.insert({
    this.id = const Value.absent(),
    required int rewardId,
    required String rewardNameSnapshot,
    required int costPoints,
    this.redeemedAt = const Value.absent(),
    this.isUsed = const Value.absent(),
    this.usedAt = const Value.absent(),
  })  : rewardId = Value(rewardId),
        rewardNameSnapshot = Value(rewardNameSnapshot),
        costPoints = Value(costPoints);
  static Insertable<RedemptionTableData> custom({
    Expression<int>? id,
    Expression<int>? rewardId,
    Expression<String>? rewardNameSnapshot,
    Expression<int>? costPoints,
    Expression<DateTime>? redeemedAt,
    Expression<bool>? isUsed,
    Expression<DateTime>? usedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rewardId != null) 'reward_id': rewardId,
      if (rewardNameSnapshot != null)
        'reward_name_snapshot': rewardNameSnapshot,
      if (costPoints != null) 'cost_points': costPoints,
      if (redeemedAt != null) 'redeemed_at': redeemedAt,
      if (isUsed != null) 'is_used': isUsed,
      if (usedAt != null) 'used_at': usedAt,
    });
  }

  RedemptionTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? rewardId,
      Value<String>? rewardNameSnapshot,
      Value<int>? costPoints,
      Value<DateTime>? redeemedAt,
      Value<bool>? isUsed,
      Value<DateTime?>? usedAt}) {
    return RedemptionTableCompanion(
      id: id ?? this.id,
      rewardId: rewardId ?? this.rewardId,
      rewardNameSnapshot: rewardNameSnapshot ?? this.rewardNameSnapshot,
      costPoints: costPoints ?? this.costPoints,
      redeemedAt: redeemedAt ?? this.redeemedAt,
      isUsed: isUsed ?? this.isUsed,
      usedAt: usedAt ?? this.usedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rewardId.present) {
      map['reward_id'] = Variable<int>(rewardId.value);
    }
    if (rewardNameSnapshot.present) {
      map['reward_name_snapshot'] = Variable<String>(rewardNameSnapshot.value);
    }
    if (costPoints.present) {
      map['cost_points'] = Variable<int>(costPoints.value);
    }
    if (redeemedAt.present) {
      map['redeemed_at'] = Variable<DateTime>(redeemedAt.value);
    }
    if (isUsed.present) {
      map['is_used'] = Variable<bool>(isUsed.value);
    }
    if (usedAt.present) {
      map['used_at'] = Variable<DateTime>(usedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RedemptionTableCompanion(')
          ..write('id: $id, ')
          ..write('rewardId: $rewardId, ')
          ..write('rewardNameSnapshot: $rewardNameSnapshot, ')
          ..write('costPoints: $costPoints, ')
          ..write('redeemedAt: $redeemedAt, ')
          ..write('isUsed: $isUsed, ')
          ..write('usedAt: $usedAt')
          ..write(')'))
        .toString();
  }
}

class $AchievementTableTable extends AchievementTable
    with TableInfo<$AchievementTableTable, AchievementTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionTypeMeta =
      const VerificationMeta('conditionType');
  @override
  late final GeneratedColumn<String> conditionType = GeneratedColumn<String>(
      'condition_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetValueMeta =
      const VerificationMeta('targetValue');
  @override
  late final GeneratedColumn<int> targetValue = GeneratedColumn<int>(
      'target_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isUnlockedMeta =
      const VerificationMeta('isUnlocked');
  @override
  late final GeneratedColumn<bool> isUnlocked = GeneratedColumn<bool>(
      'is_unlocked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_unlocked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _unlockedAtMeta =
      const VerificationMeta('unlockedAt');
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
      'unlocked_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        name,
        description,
        icon,
        conditionType,
        targetValue,
        isUnlocked,
        unlockedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
      Insertable<AchievementTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('condition_type')) {
      context.handle(
          _conditionTypeMeta,
          conditionType.isAcceptableOrUnknown(
              data['condition_type']!, _conditionTypeMeta));
    } else if (isInserting) {
      context.missing(_conditionTypeMeta);
    }
    if (data.containsKey('target_value')) {
      context.handle(
          _targetValueMeta,
          targetValue.isAcceptableOrUnknown(
              data['target_value']!, _targetValueMeta));
    } else if (isInserting) {
      context.missing(_targetValueMeta);
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
          _isUnlockedMeta,
          isUnlocked.isAcceptableOrUnknown(
              data['is_unlocked']!, _isUnlockedMeta));
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
          _unlockedAtMeta,
          unlockedAt.isAcceptableOrUnknown(
              data['unlocked_at']!, _unlockedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      conditionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition_type'])!,
      targetValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_value'])!,
      isUnlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_unlocked'])!,
      unlockedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}unlocked_at']),
    );
  }

  @override
  $AchievementTableTable createAlias(String alias) {
    return $AchievementTableTable(attachedDatabase, alias);
  }
}

class AchievementTableData extends DataClass
    implements Insertable<AchievementTableData> {
  final int id;
  final String code;
  final String name;
  final String description;
  final String icon;
  final String conditionType;
  final int targetValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  const AchievementTableData(
      {required this.id,
      required this.code,
      required this.name,
      required this.description,
      required this.icon,
      required this.conditionType,
      required this.targetValue,
      required this.isUnlocked,
      this.unlockedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon'] = Variable<String>(icon);
    map['condition_type'] = Variable<String>(conditionType);
    map['target_value'] = Variable<int>(targetValue);
    map['is_unlocked'] = Variable<bool>(isUnlocked);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    return map;
  }

  AchievementTableCompanion toCompanion(bool nullToAbsent) {
    return AchievementTableCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: Value(description),
      icon: Value(icon),
      conditionType: Value(conditionType),
      targetValue: Value(targetValue),
      isUnlocked: Value(isUnlocked),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
    );
  }

  factory AchievementTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementTableData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
      conditionType: serializer.fromJson<String>(json['conditionType']),
      targetValue: serializer.fromJson<int>(json['targetValue']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
      'conditionType': serializer.toJson<String>(conditionType),
      'targetValue': serializer.toJson<int>(targetValue),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
    };
  }

  AchievementTableData copyWith(
          {int? id,
          String? code,
          String? name,
          String? description,
          String? icon,
          String? conditionType,
          int? targetValue,
          bool? isUnlocked,
          Value<DateTime?> unlockedAt = const Value.absent()}) =>
      AchievementTableData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        description: description ?? this.description,
        icon: icon ?? this.icon,
        conditionType: conditionType ?? this.conditionType,
        targetValue: targetValue ?? this.targetValue,
        isUnlocked: isUnlocked ?? this.isUnlocked,
        unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
      );
  AchievementTableData copyWithCompanion(AchievementTableCompanion data) {
    return AchievementTableData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      conditionType: data.conditionType.present
          ? data.conditionType.value
          : this.conditionType,
      targetValue:
          data.targetValue.present ? data.targetValue.value : this.targetValue,
      isUnlocked:
          data.isUnlocked.present ? data.isUnlocked.value : this.isUnlocked,
      unlockedAt:
          data.unlockedAt.present ? data.unlockedAt.value : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AchievementTableData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('conditionType: $conditionType, ')
          ..write('targetValue: $targetValue, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, description, icon,
      conditionType, targetValue, isUnlocked, unlockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementTableData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.conditionType == this.conditionType &&
          other.targetValue == this.targetValue &&
          other.isUnlocked == this.isUnlocked &&
          other.unlockedAt == this.unlockedAt);
}

class AchievementTableCompanion extends UpdateCompanion<AchievementTableData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<String> icon;
  final Value<String> conditionType;
  final Value<int> targetValue;
  final Value<bool> isUnlocked;
  final Value<DateTime?> unlockedAt;
  const AchievementTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.conditionType = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.unlockedAt = const Value.absent(),
  });
  AchievementTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String description,
    required String icon,
    required String conditionType,
    required int targetValue,
    this.isUnlocked = const Value.absent(),
    this.unlockedAt = const Value.absent(),
  })  : code = Value(code),
        name = Value(name),
        description = Value(description),
        icon = Value(icon),
        conditionType = Value(conditionType),
        targetValue = Value(targetValue);
  static Insertable<AchievementTableData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? conditionType,
    Expression<int>? targetValue,
    Expression<bool>? isUnlocked,
    Expression<DateTime>? unlockedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (conditionType != null) 'condition_type': conditionType,
      if (targetValue != null) 'target_value': targetValue,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
    });
  }

  AchievementTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? name,
      Value<String>? description,
      Value<String>? icon,
      Value<String>? conditionType,
      Value<int>? targetValue,
      Value<bool>? isUnlocked,
      Value<DateTime?>? unlockedAt}) {
    return AchievementTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      conditionType: conditionType ?? this.conditionType,
      targetValue: targetValue ?? this.targetValue,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (conditionType.present) {
      map['condition_type'] = Variable<String>(conditionType.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<int>(targetValue.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('conditionType: $conditionType, ')
          ..write('targetValue: $targetValue, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitPenaltyEnabledMeta =
      const VerificationMeta('habitPenaltyEnabled');
  @override
  late final GeneratedColumn<bool> habitPenaltyEnabled = GeneratedColumn<bool>(
      'habit_penalty_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("habit_penalty_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lazyTaxEnabledMeta =
      const VerificationMeta('lazyTaxEnabled');
  @override
  late final GeneratedColumn<bool> lazyTaxEnabled = GeneratedColumn<bool>(
      'lazy_tax_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("lazy_tax_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lazyTaxTargetMeta =
      const VerificationMeta('lazyTaxTarget');
  @override
  late final GeneratedColumn<int> lazyTaxTarget = GeneratedColumn<int>(
      'lazy_tax_target', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _streakProtectionEnabledMeta =
      const VerificationMeta('streakProtectionEnabled');
  @override
  late final GeneratedColumn<bool> streakProtectionEnabled =
      GeneratedColumn<bool>('streak_protection_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("streak_protection_enabled" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _aiBaseUrlMeta =
      const VerificationMeta('aiBaseUrl');
  @override
  late final GeneratedColumn<String> aiBaseUrl = GeneratedColumn<String>(
      'ai_base_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aiApiKeyMeta =
      const VerificationMeta('aiApiKey');
  @override
  late final GeneratedColumn<String> aiApiKey = GeneratedColumn<String>(
      'ai_api_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aiModelMeta =
      const VerificationMeta('aiModel');
  @override
  late final GeneratedColumn<String> aiModel = GeneratedColumn<String>(
      'ai_model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aiPricingEnabledMeta =
      const VerificationMeta('aiPricingEnabled');
  @override
  late final GeneratedColumn<bool> aiPricingEnabled = GeneratedColumn<bool>(
      'ai_pricing_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ai_pricing_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _weeklySummaryEnabledMeta =
      const VerificationMeta('weeklySummaryEnabled');
  @override
  late final GeneratedColumn<bool> weeklySummaryEnabled = GeneratedColumn<bool>(
      'weekly_summary_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("weekly_summary_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _webdavUrlMeta =
      const VerificationMeta('webdavUrl');
  @override
  late final GeneratedColumn<String> webdavUrl = GeneratedColumn<String>(
      'webdav_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _webdavUsernameMeta =
      const VerificationMeta('webdavUsername');
  @override
  late final GeneratedColumn<String> webdavUsername = GeneratedColumn<String>(
      'webdav_username', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _webdavPasswordMeta =
      const VerificationMeta('webdavPassword');
  @override
  late final GeneratedColumn<String> webdavPassword = GeneratedColumn<String>(
      'webdav_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _webdavPathMeta =
      const VerificationMeta('webdavPath');
  @override
  late final GeneratedColumn<String> webdavPath = GeneratedColumn<String>(
      'webdav_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        habitPenaltyEnabled,
        lazyTaxEnabled,
        lazyTaxTarget,
        streakProtectionEnabled,
        aiBaseUrl,
        aiApiKey,
        aiModel,
        aiPricingEnabled,
        weeklySummaryEnabled,
        webdavUrl,
        webdavUsername,
        webdavPassword,
        webdavPath,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_penalty_enabled')) {
      context.handle(
          _habitPenaltyEnabledMeta,
          habitPenaltyEnabled.isAcceptableOrUnknown(
              data['habit_penalty_enabled']!, _habitPenaltyEnabledMeta));
    }
    if (data.containsKey('lazy_tax_enabled')) {
      context.handle(
          _lazyTaxEnabledMeta,
          lazyTaxEnabled.isAcceptableOrUnknown(
              data['lazy_tax_enabled']!, _lazyTaxEnabledMeta));
    }
    if (data.containsKey('lazy_tax_target')) {
      context.handle(
          _lazyTaxTargetMeta,
          lazyTaxTarget.isAcceptableOrUnknown(
              data['lazy_tax_target']!, _lazyTaxTargetMeta));
    }
    if (data.containsKey('streak_protection_enabled')) {
      context.handle(
          _streakProtectionEnabledMeta,
          streakProtectionEnabled.isAcceptableOrUnknown(
              data['streak_protection_enabled']!,
              _streakProtectionEnabledMeta));
    }
    if (data.containsKey('ai_base_url')) {
      context.handle(
          _aiBaseUrlMeta,
          aiBaseUrl.isAcceptableOrUnknown(
              data['ai_base_url']!, _aiBaseUrlMeta));
    }
    if (data.containsKey('ai_api_key')) {
      context.handle(_aiApiKeyMeta,
          aiApiKey.isAcceptableOrUnknown(data['ai_api_key']!, _aiApiKeyMeta));
    }
    if (data.containsKey('ai_model')) {
      context.handle(_aiModelMeta,
          aiModel.isAcceptableOrUnknown(data['ai_model']!, _aiModelMeta));
    }
    if (data.containsKey('ai_pricing_enabled')) {
      context.handle(
          _aiPricingEnabledMeta,
          aiPricingEnabled.isAcceptableOrUnknown(
              data['ai_pricing_enabled']!, _aiPricingEnabledMeta));
    }
    if (data.containsKey('weekly_summary_enabled')) {
      context.handle(
          _weeklySummaryEnabledMeta,
          weeklySummaryEnabled.isAcceptableOrUnknown(
              data['weekly_summary_enabled']!, _weeklySummaryEnabledMeta));
    }
    if (data.containsKey('webdav_url')) {
      context.handle(_webdavUrlMeta,
          webdavUrl.isAcceptableOrUnknown(data['webdav_url']!, _webdavUrlMeta));
    }
    if (data.containsKey('webdav_username')) {
      context.handle(
          _webdavUsernameMeta,
          webdavUsername.isAcceptableOrUnknown(
              data['webdav_username']!, _webdavUsernameMeta));
    }
    if (data.containsKey('webdav_password')) {
      context.handle(
          _webdavPasswordMeta,
          webdavPassword.isAcceptableOrUnknown(
              data['webdav_password']!, _webdavPasswordMeta));
    }
    if (data.containsKey('webdav_path')) {
      context.handle(
          _webdavPathMeta,
          webdavPath.isAcceptableOrUnknown(
              data['webdav_path']!, _webdavPathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habitPenaltyEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}habit_penalty_enabled'])!,
      lazyTaxEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}lazy_tax_enabled'])!,
      lazyTaxTarget: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lazy_tax_target'])!,
      streakProtectionEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}streak_protection_enabled'])!,
      aiBaseUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ai_base_url']),
      aiApiKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ai_api_key']),
      aiModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ai_model']),
      aiPricingEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}ai_pricing_enabled'])!,
      weeklySummaryEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}weekly_summary_enabled'])!,
      webdavUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}webdav_url']),
      webdavUsername: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}webdav_username']),
      webdavPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}webdav_password']),
      webdavPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}webdav_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
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
  const AppSettingsTableData(
      {required this.id,
      required this.habitPenaltyEnabled,
      required this.lazyTaxEnabled,
      required this.lazyTaxTarget,
      required this.streakProtectionEnabled,
      this.aiBaseUrl,
      this.aiApiKey,
      this.aiModel,
      required this.aiPricingEnabled,
      required this.weeklySummaryEnabled,
      this.webdavUrl,
      this.webdavUsername,
      this.webdavPassword,
      this.webdavPath,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_penalty_enabled'] = Variable<bool>(habitPenaltyEnabled);
    map['lazy_tax_enabled'] = Variable<bool>(lazyTaxEnabled);
    map['lazy_tax_target'] = Variable<int>(lazyTaxTarget);
    map['streak_protection_enabled'] = Variable<bool>(streakProtectionEnabled);
    if (!nullToAbsent || aiBaseUrl != null) {
      map['ai_base_url'] = Variable<String>(aiBaseUrl);
    }
    if (!nullToAbsent || aiApiKey != null) {
      map['ai_api_key'] = Variable<String>(aiApiKey);
    }
    if (!nullToAbsent || aiModel != null) {
      map['ai_model'] = Variable<String>(aiModel);
    }
    map['ai_pricing_enabled'] = Variable<bool>(aiPricingEnabled);
    map['weekly_summary_enabled'] = Variable<bool>(weeklySummaryEnabled);
    if (!nullToAbsent || webdavUrl != null) {
      map['webdav_url'] = Variable<String>(webdavUrl);
    }
    if (!nullToAbsent || webdavUsername != null) {
      map['webdav_username'] = Variable<String>(webdavUsername);
    }
    if (!nullToAbsent || webdavPassword != null) {
      map['webdav_password'] = Variable<String>(webdavPassword);
    }
    if (!nullToAbsent || webdavPath != null) {
      map['webdav_path'] = Variable<String>(webdavPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      habitPenaltyEnabled: Value(habitPenaltyEnabled),
      lazyTaxEnabled: Value(lazyTaxEnabled),
      lazyTaxTarget: Value(lazyTaxTarget),
      streakProtectionEnabled: Value(streakProtectionEnabled),
      aiBaseUrl: aiBaseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(aiBaseUrl),
      aiApiKey: aiApiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(aiApiKey),
      aiModel: aiModel == null && nullToAbsent
          ? const Value.absent()
          : Value(aiModel),
      aiPricingEnabled: Value(aiPricingEnabled),
      weeklySummaryEnabled: Value(weeklySummaryEnabled),
      webdavUrl: webdavUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(webdavUrl),
      webdavUsername: webdavUsername == null && nullToAbsent
          ? const Value.absent()
          : Value(webdavUsername),
      webdavPassword: webdavPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(webdavPassword),
      webdavPath: webdavPath == null && nullToAbsent
          ? const Value.absent()
          : Value(webdavPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      habitPenaltyEnabled:
          serializer.fromJson<bool>(json['habitPenaltyEnabled']),
      lazyTaxEnabled: serializer.fromJson<bool>(json['lazyTaxEnabled']),
      lazyTaxTarget: serializer.fromJson<int>(json['lazyTaxTarget']),
      streakProtectionEnabled:
          serializer.fromJson<bool>(json['streakProtectionEnabled']),
      aiBaseUrl: serializer.fromJson<String?>(json['aiBaseUrl']),
      aiApiKey: serializer.fromJson<String?>(json['aiApiKey']),
      aiModel: serializer.fromJson<String?>(json['aiModel']),
      aiPricingEnabled: serializer.fromJson<bool>(json['aiPricingEnabled']),
      weeklySummaryEnabled:
          serializer.fromJson<bool>(json['weeklySummaryEnabled']),
      webdavUrl: serializer.fromJson<String?>(json['webdavUrl']),
      webdavUsername: serializer.fromJson<String?>(json['webdavUsername']),
      webdavPassword: serializer.fromJson<String?>(json['webdavPassword']),
      webdavPath: serializer.fromJson<String?>(json['webdavPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitPenaltyEnabled': serializer.toJson<bool>(habitPenaltyEnabled),
      'lazyTaxEnabled': serializer.toJson<bool>(lazyTaxEnabled),
      'lazyTaxTarget': serializer.toJson<int>(lazyTaxTarget),
      'streakProtectionEnabled':
          serializer.toJson<bool>(streakProtectionEnabled),
      'aiBaseUrl': serializer.toJson<String?>(aiBaseUrl),
      'aiApiKey': serializer.toJson<String?>(aiApiKey),
      'aiModel': serializer.toJson<String?>(aiModel),
      'aiPricingEnabled': serializer.toJson<bool>(aiPricingEnabled),
      'weeklySummaryEnabled': serializer.toJson<bool>(weeklySummaryEnabled),
      'webdavUrl': serializer.toJson<String?>(webdavUrl),
      'webdavUsername': serializer.toJson<String?>(webdavUsername),
      'webdavPassword': serializer.toJson<String?>(webdavPassword),
      'webdavPath': serializer.toJson<String?>(webdavPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSettingsTableData copyWith(
          {int? id,
          bool? habitPenaltyEnabled,
          bool? lazyTaxEnabled,
          int? lazyTaxTarget,
          bool? streakProtectionEnabled,
          Value<String?> aiBaseUrl = const Value.absent(),
          Value<String?> aiApiKey = const Value.absent(),
          Value<String?> aiModel = const Value.absent(),
          bool? aiPricingEnabled,
          bool? weeklySummaryEnabled,
          Value<String?> webdavUrl = const Value.absent(),
          Value<String?> webdavUsername = const Value.absent(),
          Value<String?> webdavPassword = const Value.absent(),
          Value<String?> webdavPath = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      AppSettingsTableData(
        id: id ?? this.id,
        habitPenaltyEnabled: habitPenaltyEnabled ?? this.habitPenaltyEnabled,
        lazyTaxEnabled: lazyTaxEnabled ?? this.lazyTaxEnabled,
        lazyTaxTarget: lazyTaxTarget ?? this.lazyTaxTarget,
        streakProtectionEnabled:
            streakProtectionEnabled ?? this.streakProtectionEnabled,
        aiBaseUrl: aiBaseUrl.present ? aiBaseUrl.value : this.aiBaseUrl,
        aiApiKey: aiApiKey.present ? aiApiKey.value : this.aiApiKey,
        aiModel: aiModel.present ? aiModel.value : this.aiModel,
        aiPricingEnabled: aiPricingEnabled ?? this.aiPricingEnabled,
        weeklySummaryEnabled: weeklySummaryEnabled ?? this.weeklySummaryEnabled,
        webdavUrl: webdavUrl.present ? webdavUrl.value : this.webdavUrl,
        webdavUsername:
            webdavUsername.present ? webdavUsername.value : this.webdavUsername,
        webdavPassword:
            webdavPassword.present ? webdavPassword.value : this.webdavPassword,
        webdavPath: webdavPath.present ? webdavPath.value : this.webdavPath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      habitPenaltyEnabled: data.habitPenaltyEnabled.present
          ? data.habitPenaltyEnabled.value
          : this.habitPenaltyEnabled,
      lazyTaxEnabled: data.lazyTaxEnabled.present
          ? data.lazyTaxEnabled.value
          : this.lazyTaxEnabled,
      lazyTaxTarget: data.lazyTaxTarget.present
          ? data.lazyTaxTarget.value
          : this.lazyTaxTarget,
      streakProtectionEnabled: data.streakProtectionEnabled.present
          ? data.streakProtectionEnabled.value
          : this.streakProtectionEnabled,
      aiBaseUrl: data.aiBaseUrl.present ? data.aiBaseUrl.value : this.aiBaseUrl,
      aiApiKey: data.aiApiKey.present ? data.aiApiKey.value : this.aiApiKey,
      aiModel: data.aiModel.present ? data.aiModel.value : this.aiModel,
      aiPricingEnabled: data.aiPricingEnabled.present
          ? data.aiPricingEnabled.value
          : this.aiPricingEnabled,
      weeklySummaryEnabled: data.weeklySummaryEnabled.present
          ? data.weeklySummaryEnabled.value
          : this.weeklySummaryEnabled,
      webdavUrl: data.webdavUrl.present ? data.webdavUrl.value : this.webdavUrl,
      webdavUsername: data.webdavUsername.present
          ? data.webdavUsername.value
          : this.webdavUsername,
      webdavPassword: data.webdavPassword.present
          ? data.webdavPassword.value
          : this.webdavPassword,
      webdavPath:
          data.webdavPath.present ? data.webdavPath.value : this.webdavPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('id: $id, ')
          ..write('habitPenaltyEnabled: $habitPenaltyEnabled, ')
          ..write('lazyTaxEnabled: $lazyTaxEnabled, ')
          ..write('lazyTaxTarget: $lazyTaxTarget, ')
          ..write('streakProtectionEnabled: $streakProtectionEnabled, ')
          ..write('aiBaseUrl: $aiBaseUrl, ')
          ..write('aiApiKey: $aiApiKey, ')
          ..write('aiModel: $aiModel, ')
          ..write('aiPricingEnabled: $aiPricingEnabled, ')
          ..write('weeklySummaryEnabled: $weeklySummaryEnabled, ')
          ..write('webdavUrl: $webdavUrl, ')
          ..write('webdavUsername: $webdavUsername, ')
          ..write('webdavPassword: $webdavPassword, ')
          ..write('webdavPath: $webdavPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      habitPenaltyEnabled,
      lazyTaxEnabled,
      lazyTaxTarget,
      streakProtectionEnabled,
      aiBaseUrl,
      aiApiKey,
      aiModel,
      aiPricingEnabled,
      weeklySummaryEnabled,
      webdavUrl,
      webdavUsername,
      webdavPassword,
      webdavPath,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.id == this.id &&
          other.habitPenaltyEnabled == this.habitPenaltyEnabled &&
          other.lazyTaxEnabled == this.lazyTaxEnabled &&
          other.lazyTaxTarget == this.lazyTaxTarget &&
          other.streakProtectionEnabled == this.streakProtectionEnabled &&
          other.aiBaseUrl == this.aiBaseUrl &&
          other.aiApiKey == this.aiApiKey &&
          other.aiModel == this.aiModel &&
          other.aiPricingEnabled == this.aiPricingEnabled &&
          other.weeklySummaryEnabled == this.weeklySummaryEnabled &&
          other.webdavUrl == this.webdavUrl &&
          other.webdavUsername == this.webdavUsername &&
          other.webdavPassword == this.webdavPassword &&
          other.webdavPath == this.webdavPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<int> id;
  final Value<bool> habitPenaltyEnabled;
  final Value<bool> lazyTaxEnabled;
  final Value<int> lazyTaxTarget;
  final Value<bool> streakProtectionEnabled;
  final Value<String?> aiBaseUrl;
  final Value<String?> aiApiKey;
  final Value<String?> aiModel;
  final Value<bool> aiPricingEnabled;
  final Value<bool> weeklySummaryEnabled;
  final Value<String?> webdavUrl;
  final Value<String?> webdavUsername;
  final Value<String?> webdavPassword;
  final Value<String?> webdavPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.habitPenaltyEnabled = const Value.absent(),
    this.lazyTaxEnabled = const Value.absent(),
    this.lazyTaxTarget = const Value.absent(),
    this.streakProtectionEnabled = const Value.absent(),
    this.aiBaseUrl = const Value.absent(),
    this.aiApiKey = const Value.absent(),
    this.aiModel = const Value.absent(),
    this.aiPricingEnabled = const Value.absent(),
    this.weeklySummaryEnabled = const Value.absent(),
    this.webdavUrl = const Value.absent(),
    this.webdavUsername = const Value.absent(),
    this.webdavPassword = const Value.absent(),
    this.webdavPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.habitPenaltyEnabled = const Value.absent(),
    this.lazyTaxEnabled = const Value.absent(),
    this.lazyTaxTarget = const Value.absent(),
    this.streakProtectionEnabled = const Value.absent(),
    this.aiBaseUrl = const Value.absent(),
    this.aiApiKey = const Value.absent(),
    this.aiModel = const Value.absent(),
    this.aiPricingEnabled = const Value.absent(),
    this.weeklySummaryEnabled = const Value.absent(),
    this.webdavUrl = const Value.absent(),
    this.webdavUsername = const Value.absent(),
    this.webdavPassword = const Value.absent(),
    this.webdavPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<AppSettingsTableData> custom({
    Expression<int>? id,
    Expression<bool>? habitPenaltyEnabled,
    Expression<bool>? lazyTaxEnabled,
    Expression<int>? lazyTaxTarget,
    Expression<bool>? streakProtectionEnabled,
    Expression<String>? aiBaseUrl,
    Expression<String>? aiApiKey,
    Expression<String>? aiModel,
    Expression<bool>? aiPricingEnabled,
    Expression<bool>? weeklySummaryEnabled,
    Expression<String>? webdavUrl,
    Expression<String>? webdavUsername,
    Expression<String>? webdavPassword,
    Expression<String>? webdavPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitPenaltyEnabled != null)
        'habit_penalty_enabled': habitPenaltyEnabled,
      if (lazyTaxEnabled != null) 'lazy_tax_enabled': lazyTaxEnabled,
      if (lazyTaxTarget != null) 'lazy_tax_target': lazyTaxTarget,
      if (streakProtectionEnabled != null)
        'streak_protection_enabled': streakProtectionEnabled,
      if (aiBaseUrl != null) 'ai_base_url': aiBaseUrl,
      if (aiApiKey != null) 'ai_api_key': aiApiKey,
      if (aiModel != null) 'ai_model': aiModel,
      if (aiPricingEnabled != null) 'ai_pricing_enabled': aiPricingEnabled,
      if (weeklySummaryEnabled != null)
        'weekly_summary_enabled': weeklySummaryEnabled,
      if (webdavUrl != null) 'webdav_url': webdavUrl,
      if (webdavUsername != null) 'webdav_username': webdavUsername,
      if (webdavPassword != null) 'webdav_password': webdavPassword,
      if (webdavPath != null) 'webdav_path': webdavPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? habitPenaltyEnabled,
      Value<bool>? lazyTaxEnabled,
      Value<int>? lazyTaxTarget,
      Value<bool>? streakProtectionEnabled,
      Value<String?>? aiBaseUrl,
      Value<String?>? aiApiKey,
      Value<String?>? aiModel,
      Value<bool>? aiPricingEnabled,
      Value<bool>? weeklySummaryEnabled,
      Value<String?>? webdavUrl,
      Value<String?>? webdavUsername,
      Value<String?>? webdavPassword,
      Value<String?>? webdavPath,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      habitPenaltyEnabled: habitPenaltyEnabled ?? this.habitPenaltyEnabled,
      lazyTaxEnabled: lazyTaxEnabled ?? this.lazyTaxEnabled,
      lazyTaxTarget: lazyTaxTarget ?? this.lazyTaxTarget,
      streakProtectionEnabled:
          streakProtectionEnabled ?? this.streakProtectionEnabled,
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitPenaltyEnabled.present) {
      map['habit_penalty_enabled'] = Variable<bool>(habitPenaltyEnabled.value);
    }
    if (lazyTaxEnabled.present) {
      map['lazy_tax_enabled'] = Variable<bool>(lazyTaxEnabled.value);
    }
    if (lazyTaxTarget.present) {
      map['lazy_tax_target'] = Variable<int>(lazyTaxTarget.value);
    }
    if (streakProtectionEnabled.present) {
      map['streak_protection_enabled'] =
          Variable<bool>(streakProtectionEnabled.value);
    }
    if (aiBaseUrl.present) {
      map['ai_base_url'] = Variable<String>(aiBaseUrl.value);
    }
    if (aiApiKey.present) {
      map['ai_api_key'] = Variable<String>(aiApiKey.value);
    }
    if (aiModel.present) {
      map['ai_model'] = Variable<String>(aiModel.value);
    }
    if (aiPricingEnabled.present) {
      map['ai_pricing_enabled'] = Variable<bool>(aiPricingEnabled.value);
    }
    if (weeklySummaryEnabled.present) {
      map['weekly_summary_enabled'] =
          Variable<bool>(weeklySummaryEnabled.value);
    }
    if (webdavUrl.present) {
      map['webdav_url'] = Variable<String>(webdavUrl.value);
    }
    if (webdavUsername.present) {
      map['webdav_username'] = Variable<String>(webdavUsername.value);
    }
    if (webdavPassword.present) {
      map['webdav_password'] = Variable<String>(webdavPassword.value);
    }
    if (webdavPath.present) {
      map['webdav_path'] = Variable<String>(webdavPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('habitPenaltyEnabled: $habitPenaltyEnabled, ')
          ..write('lazyTaxEnabled: $lazyTaxEnabled, ')
          ..write('lazyTaxTarget: $lazyTaxTarget, ')
          ..write('streakProtectionEnabled: $streakProtectionEnabled, ')
          ..write('aiBaseUrl: $aiBaseUrl, ')
          ..write('aiApiKey: $aiApiKey, ')
          ..write('aiModel: $aiModel, ')
          ..write('aiPricingEnabled: $aiPricingEnabled, ')
          ..write('weeklySummaryEnabled: $weeklySummaryEnabled, ')
          ..write('webdavUrl: $webdavUrl, ')
          ..write('webdavUsername: $webdavUsername, ')
          ..write('webdavPassword: $webdavPassword, ')
          ..write('webdavPath: $webdavPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserStatsTableTable userStatsTable = $UserStatsTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $TaskLogTableTable taskLogTable = $TaskLogTableTable(this);
  late final $PointLogTableTable pointLogTable = $PointLogTableTable(this);
  late final $RewardItemTableTable rewardItemTable =
      $RewardItemTableTable(this);
  late final $RedemptionTableTable redemptionTable =
      $RedemptionTableTable(this);
  late final $AchievementTableTable achievementTable =
      $AchievementTableTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  late final UserStatsDao userStatsDao = UserStatsDao(this as AppDatabase);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  late final TaskLogDao taskLogDao = TaskLogDao(this as AppDatabase);
  late final PointLogDao pointLogDao = PointLogDao(this as AppDatabase);
  late final RewardDao rewardDao = RewardDao(this as AppDatabase);
  late final RedemptionDao redemptionDao = RedemptionDao(this as AppDatabase);
  late final AchievementDao achievementDao =
      AchievementDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userStatsTable,
        taskTable,
        taskLogTable,
        pointLogTable,
        rewardItemTable,
        redemptionTable,
        achievementTable,
        appSettingsTable
      ];
}

typedef $$UserStatsTableTableCreateCompanionBuilder = UserStatsTableCompanion
    Function({
  Value<int> id,
  Value<int> currentPoints,
  Value<int> totalPoints,
  Value<int> totalExp,
  Value<int> currentStreak,
  Value<int> longestStreak,
  Value<DateTime?> lastCheckInDate,
  Value<int> dailyUndoCount,
  Value<DateTime?> lastUndoDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UserStatsTableTableUpdateCompanionBuilder = UserStatsTableCompanion
    Function({
  Value<int> id,
  Value<int> currentPoints,
  Value<int> totalPoints,
  Value<int> totalExp,
  Value<int> currentStreak,
  Value<int> longestStreak,
  Value<DateTime?> lastCheckInDate,
  Value<int> dailyUndoCount,
  Value<DateTime?> lastUndoDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$UserStatsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserStatsTableTable> {
  $$UserStatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentPoints => $composableBuilder(
      column: $table.currentPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalExp => $composableBuilder(
      column: $table.totalExp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastCheckInDate => $composableBuilder(
      column: $table.lastCheckInDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dailyUndoCount => $composableBuilder(
      column: $table.dailyUndoCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUndoDate => $composableBuilder(
      column: $table.lastUndoDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UserStatsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserStatsTableTable> {
  $$UserStatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentPoints => $composableBuilder(
      column: $table.currentPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalExp => $composableBuilder(
      column: $table.totalExp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastCheckInDate => $composableBuilder(
      column: $table.lastCheckInDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dailyUndoCount => $composableBuilder(
      column: $table.dailyUndoCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUndoDate => $composableBuilder(
      column: $table.lastUndoDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserStatsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserStatsTableTable> {
  $$UserStatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get currentPoints => $composableBuilder(
      column: $table.currentPoints, builder: (column) => column);

  GeneratedColumn<int> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => column);

  GeneratedColumn<int> get totalExp =>
      $composableBuilder(column: $table.totalExp, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => column);

  GeneratedColumn<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCheckInDate => $composableBuilder(
      column: $table.lastCheckInDate, builder: (column) => column);

  GeneratedColumn<int> get dailyUndoCount => $composableBuilder(
      column: $table.dailyUndoCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUndoDate => $composableBuilder(
      column: $table.lastUndoDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserStatsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserStatsTableTable,
    UserStatsTableData,
    $$UserStatsTableTableFilterComposer,
    $$UserStatsTableTableOrderingComposer,
    $$UserStatsTableTableAnnotationComposer,
    $$UserStatsTableTableCreateCompanionBuilder,
    $$UserStatsTableTableUpdateCompanionBuilder,
    (
      UserStatsTableData,
      BaseReferences<_$AppDatabase, $UserStatsTableTable, UserStatsTableData>
    ),
    UserStatsTableData,
    PrefetchHooks Function()> {
  $$UserStatsTableTableTableManager(
      _$AppDatabase db, $UserStatsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserStatsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserStatsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserStatsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> currentPoints = const Value.absent(),
            Value<int> totalPoints = const Value.absent(),
            Value<int> totalExp = const Value.absent(),
            Value<int> currentStreak = const Value.absent(),
            Value<int> longestStreak = const Value.absent(),
            Value<DateTime?> lastCheckInDate = const Value.absent(),
            Value<int> dailyUndoCount = const Value.absent(),
            Value<DateTime?> lastUndoDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UserStatsTableCompanion(
            id: id,
            currentPoints: currentPoints,
            totalPoints: totalPoints,
            totalExp: totalExp,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastCheckInDate: lastCheckInDate,
            dailyUndoCount: dailyUndoCount,
            lastUndoDate: lastUndoDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> currentPoints = const Value.absent(),
            Value<int> totalPoints = const Value.absent(),
            Value<int> totalExp = const Value.absent(),
            Value<int> currentStreak = const Value.absent(),
            Value<int> longestStreak = const Value.absent(),
            Value<DateTime?> lastCheckInDate = const Value.absent(),
            Value<int> dailyUndoCount = const Value.absent(),
            Value<DateTime?> lastUndoDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UserStatsTableCompanion.insert(
            id: id,
            currentPoints: currentPoints,
            totalPoints: totalPoints,
            totalExp: totalExp,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastCheckInDate: lastCheckInDate,
            dailyUndoCount: dailyUndoCount,
            lastUndoDate: lastUndoDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserStatsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserStatsTableTable,
    UserStatsTableData,
    $$UserStatsTableTableFilterComposer,
    $$UserStatsTableTableOrderingComposer,
    $$UserStatsTableTableAnnotationComposer,
    $$UserStatsTableTableCreateCompanionBuilder,
    $$UserStatsTableTableUpdateCompanionBuilder,
    (
      UserStatsTableData,
      BaseReferences<_$AppDatabase, $UserStatsTableTable, UserStatsTableData>
    ),
    UserStatsTableData,
    PrefetchHooks Function()>;
typedef $$TaskTableTableCreateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required int painValue,
  required String level,
  required int basePoints,
  Value<bool> isDailyHabit,
  Value<bool> isActive,
  Value<String> status,
  Value<bool> hasBet,
  Value<int> betPoints,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<int> painValue,
  Value<String> level,
  Value<int> basePoints,
  Value<bool> isDailyHabit,
  Value<bool> isActive,
  Value<String> status,
  Value<bool> hasBet,
  Value<int> betPoints,
  Value<DateTime?> dueDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$TaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get painValue => $composableBuilder(
      column: $table.painValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDailyHabit => $composableBuilder(
      column: $table.isDailyHabit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasBet => $composableBuilder(
      column: $table.hasBet, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get betPoints => $composableBuilder(
      column: $table.betPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get painValue => $composableBuilder(
      column: $table.painValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDailyHabit => $composableBuilder(
      column: $table.isDailyHabit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasBet => $composableBuilder(
      column: $table.hasBet, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get betPoints => $composableBuilder(
      column: $table.betPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get painValue =>
      $composableBuilder(column: $table.painValue, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => column);

  GeneratedColumn<bool> get isDailyHabit => $composableBuilder(
      column: $table.isDailyHabit, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get hasBet =>
      $composableBuilder(column: $table.hasBet, builder: (column) => column);

  GeneratedColumn<int> get betPoints =>
      $composableBuilder(column: $table.betPoints, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (
      TaskTableData,
      BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>
    ),
    TaskTableData,
    PrefetchHooks Function()> {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> painValue = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<int> basePoints = const Value.absent(),
            Value<bool> isDailyHabit = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> hasBet = const Value.absent(),
            Value<int> betPoints = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TaskTableCompanion(
            id: id,
            title: title,
            description: description,
            painValue: painValue,
            level: level,
            basePoints: basePoints,
            isDailyHabit: isDailyHabit,
            isActive: isActive,
            status: status,
            hasBet: hasBet,
            betPoints: betPoints,
            dueDate: dueDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required int painValue,
            required String level,
            required int basePoints,
            Value<bool> isDailyHabit = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> hasBet = const Value.absent(),
            Value<int> betPoints = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TaskTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            painValue: painValue,
            level: level,
            basePoints: basePoints,
            isDailyHabit: isDailyHabit,
            isActive: isActive,
            status: status,
            hasBet: hasBet,
            betPoints: betPoints,
            dueDate: dueDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (
      TaskTableData,
      BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>
    ),
    TaskTableData,
    PrefetchHooks Function()>;
typedef $$TaskLogTableTableCreateCompanionBuilder = TaskLogTableCompanion
    Function({
  Value<int> id,
  required int taskId,
  required DateTime date,
  Value<DateTime> completedAt,
  Value<bool> isMakeUp,
  required int earnedPoints,
  required int earnedExp,
  required int basePoints,
  Value<int> bonusPoints,
  Value<int> overflowPoints,
  Value<int> betReturnedPoints,
  Value<bool> isRevoked,
  Value<DateTime?> revokedAt,
});
typedef $$TaskLogTableTableUpdateCompanionBuilder = TaskLogTableCompanion
    Function({
  Value<int> id,
  Value<int> taskId,
  Value<DateTime> date,
  Value<DateTime> completedAt,
  Value<bool> isMakeUp,
  Value<int> earnedPoints,
  Value<int> earnedExp,
  Value<int> basePoints,
  Value<int> bonusPoints,
  Value<int> overflowPoints,
  Value<int> betReturnedPoints,
  Value<bool> isRevoked,
  Value<DateTime?> revokedAt,
});

class $$TaskLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskLogTableTable> {
  $$TaskLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMakeUp => $composableBuilder(
      column: $table.isMakeUp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get earnedPoints => $composableBuilder(
      column: $table.earnedPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get earnedExp => $composableBuilder(
      column: $table.earnedExp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bonusPoints => $composableBuilder(
      column: $table.bonusPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get overflowPoints => $composableBuilder(
      column: $table.overflowPoints,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get betReturnedPoints => $composableBuilder(
      column: $table.betReturnedPoints,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRevoked => $composableBuilder(
      column: $table.isRevoked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get revokedAt => $composableBuilder(
      column: $table.revokedAt, builder: (column) => ColumnFilters(column));
}

class $$TaskLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskLogTableTable> {
  $$TaskLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMakeUp => $composableBuilder(
      column: $table.isMakeUp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get earnedPoints => $composableBuilder(
      column: $table.earnedPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get earnedExp => $composableBuilder(
      column: $table.earnedExp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bonusPoints => $composableBuilder(
      column: $table.bonusPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get overflowPoints => $composableBuilder(
      column: $table.overflowPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get betReturnedPoints => $composableBuilder(
      column: $table.betReturnedPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRevoked => $composableBuilder(
      column: $table.isRevoked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get revokedAt => $composableBuilder(
      column: $table.revokedAt, builder: (column) => ColumnOrderings(column));
}

class $$TaskLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskLogTableTable> {
  $$TaskLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<bool> get isMakeUp =>
      $composableBuilder(column: $table.isMakeUp, builder: (column) => column);

  GeneratedColumn<int> get earnedPoints => $composableBuilder(
      column: $table.earnedPoints, builder: (column) => column);

  GeneratedColumn<int> get earnedExp =>
      $composableBuilder(column: $table.earnedExp, builder: (column) => column);

  GeneratedColumn<int> get basePoints => $composableBuilder(
      column: $table.basePoints, builder: (column) => column);

  GeneratedColumn<int> get bonusPoints => $composableBuilder(
      column: $table.bonusPoints, builder: (column) => column);

  GeneratedColumn<int> get overflowPoints => $composableBuilder(
      column: $table.overflowPoints, builder: (column) => column);

  GeneratedColumn<int> get betReturnedPoints => $composableBuilder(
      column: $table.betReturnedPoints, builder: (column) => column);

  GeneratedColumn<bool> get isRevoked =>
      $composableBuilder(column: $table.isRevoked, builder: (column) => column);

  GeneratedColumn<DateTime> get revokedAt =>
      $composableBuilder(column: $table.revokedAt, builder: (column) => column);
}

class $$TaskLogTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskLogTableTable,
    TaskLogTableData,
    $$TaskLogTableTableFilterComposer,
    $$TaskLogTableTableOrderingComposer,
    $$TaskLogTableTableAnnotationComposer,
    $$TaskLogTableTableCreateCompanionBuilder,
    $$TaskLogTableTableUpdateCompanionBuilder,
    (
      TaskLogTableData,
      BaseReferences<_$AppDatabase, $TaskLogTableTable, TaskLogTableData>
    ),
    TaskLogTableData,
    PrefetchHooks Function()> {
  $$TaskLogTableTableTableManager(_$AppDatabase db, $TaskLogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> completedAt = const Value.absent(),
            Value<bool> isMakeUp = const Value.absent(),
            Value<int> earnedPoints = const Value.absent(),
            Value<int> earnedExp = const Value.absent(),
            Value<int> basePoints = const Value.absent(),
            Value<int> bonusPoints = const Value.absent(),
            Value<int> overflowPoints = const Value.absent(),
            Value<int> betReturnedPoints = const Value.absent(),
            Value<bool> isRevoked = const Value.absent(),
            Value<DateTime?> revokedAt = const Value.absent(),
          }) =>
              TaskLogTableCompanion(
            id: id,
            taskId: taskId,
            date: date,
            completedAt: completedAt,
            isMakeUp: isMakeUp,
            earnedPoints: earnedPoints,
            earnedExp: earnedExp,
            basePoints: basePoints,
            bonusPoints: bonusPoints,
            overflowPoints: overflowPoints,
            betReturnedPoints: betReturnedPoints,
            isRevoked: isRevoked,
            revokedAt: revokedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int taskId,
            required DateTime date,
            Value<DateTime> completedAt = const Value.absent(),
            Value<bool> isMakeUp = const Value.absent(),
            required int earnedPoints,
            required int earnedExp,
            required int basePoints,
            Value<int> bonusPoints = const Value.absent(),
            Value<int> overflowPoints = const Value.absent(),
            Value<int> betReturnedPoints = const Value.absent(),
            Value<bool> isRevoked = const Value.absent(),
            Value<DateTime?> revokedAt = const Value.absent(),
          }) =>
              TaskLogTableCompanion.insert(
            id: id,
            taskId: taskId,
            date: date,
            completedAt: completedAt,
            isMakeUp: isMakeUp,
            earnedPoints: earnedPoints,
            earnedExp: earnedExp,
            basePoints: basePoints,
            bonusPoints: bonusPoints,
            overflowPoints: overflowPoints,
            betReturnedPoints: betReturnedPoints,
            isRevoked: isRevoked,
            revokedAt: revokedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskLogTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskLogTableTable,
    TaskLogTableData,
    $$TaskLogTableTableFilterComposer,
    $$TaskLogTableTableOrderingComposer,
    $$TaskLogTableTableAnnotationComposer,
    $$TaskLogTableTableCreateCompanionBuilder,
    $$TaskLogTableTableUpdateCompanionBuilder,
    (
      TaskLogTableData,
      BaseReferences<_$AppDatabase, $TaskLogTableTable, TaskLogTableData>
    ),
    TaskLogTableData,
    PrefetchHooks Function()>;
typedef $$PointLogTableTableCreateCompanionBuilder = PointLogTableCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  required int amount,
  required String type,
  required String reason,
  Value<String?> relatedId,
  required int balanceAfter,
});
typedef $$PointLogTableTableUpdateCompanionBuilder = PointLogTableCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<int> amount,
  Value<String> type,
  Value<String> reason,
  Value<String?> relatedId,
  Value<int> balanceAfter,
});

class $$PointLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $PointLogTableTable> {
  $$PointLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedId => $composableBuilder(
      column: $table.relatedId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter, builder: (column) => ColumnFilters(column));
}

class $$PointLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PointLogTableTable> {
  $$PointLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedId => $composableBuilder(
      column: $table.relatedId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter,
      builder: (column) => ColumnOrderings(column));
}

class $$PointLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointLogTableTable> {
  $$PointLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get relatedId =>
      $composableBuilder(column: $table.relatedId, builder: (column) => column);

  GeneratedColumn<int> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter, builder: (column) => column);
}

class $$PointLogTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PointLogTableTable,
    PointLogTableData,
    $$PointLogTableTableFilterComposer,
    $$PointLogTableTableOrderingComposer,
    $$PointLogTableTableAnnotationComposer,
    $$PointLogTableTableCreateCompanionBuilder,
    $$PointLogTableTableUpdateCompanionBuilder,
    (
      PointLogTableData,
      BaseReferences<_$AppDatabase, $PointLogTableTable, PointLogTableData>
    ),
    PointLogTableData,
    PrefetchHooks Function()> {
  $$PointLogTableTableTableManager(_$AppDatabase db, $PointLogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<String?> relatedId = const Value.absent(),
            Value<int> balanceAfter = const Value.absent(),
          }) =>
              PointLogTableCompanion(
            id: id,
            createdAt: createdAt,
            amount: amount,
            type: type,
            reason: reason,
            relatedId: relatedId,
            balanceAfter: balanceAfter,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required int amount,
            required String type,
            required String reason,
            Value<String?> relatedId = const Value.absent(),
            required int balanceAfter,
          }) =>
              PointLogTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            amount: amount,
            type: type,
            reason: reason,
            relatedId: relatedId,
            balanceAfter: balanceAfter,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PointLogTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PointLogTableTable,
    PointLogTableData,
    $$PointLogTableTableFilterComposer,
    $$PointLogTableTableOrderingComposer,
    $$PointLogTableTableAnnotationComposer,
    $$PointLogTableTableCreateCompanionBuilder,
    $$PointLogTableTableUpdateCompanionBuilder,
    (
      PointLogTableData,
      BaseReferences<_$AppDatabase, $PointLogTableTable, PointLogTableData>
    ),
    PointLogTableData,
    PrefetchHooks Function()>;
typedef $$RewardItemTableTableCreateCompanionBuilder = RewardItemTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  required int pricePoints,
  Value<double?> moneyPrice,
  Value<String?> imagePath,
  Value<bool> isWish,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$RewardItemTableTableUpdateCompanionBuilder = RewardItemTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<int> pricePoints,
  Value<double?> moneyPrice,
  Value<String?> imagePath,
  Value<bool> isWish,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$RewardItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $RewardItemTableTable> {
  $$RewardItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pricePoints => $composableBuilder(
      column: $table.pricePoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get moneyPrice => $composableBuilder(
      column: $table.moneyPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isWish => $composableBuilder(
      column: $table.isWish, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$RewardItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RewardItemTableTable> {
  $$RewardItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pricePoints => $composableBuilder(
      column: $table.pricePoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get moneyPrice => $composableBuilder(
      column: $table.moneyPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isWish => $composableBuilder(
      column: $table.isWish, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RewardItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RewardItemTableTable> {
  $$RewardItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get pricePoints => $composableBuilder(
      column: $table.pricePoints, builder: (column) => column);

  GeneratedColumn<double> get moneyPrice => $composableBuilder(
      column: $table.moneyPrice, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isWish =>
      $composableBuilder(column: $table.isWish, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RewardItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RewardItemTableTable,
    RewardItemTableData,
    $$RewardItemTableTableFilterComposer,
    $$RewardItemTableTableOrderingComposer,
    $$RewardItemTableTableAnnotationComposer,
    $$RewardItemTableTableCreateCompanionBuilder,
    $$RewardItemTableTableUpdateCompanionBuilder,
    (
      RewardItemTableData,
      BaseReferences<_$AppDatabase, $RewardItemTableTable, RewardItemTableData>
    ),
    RewardItemTableData,
    PrefetchHooks Function()> {
  $$RewardItemTableTableTableManager(
      _$AppDatabase db, $RewardItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RewardItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RewardItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RewardItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> pricePoints = const Value.absent(),
            Value<double?> moneyPrice = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isWish = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RewardItemTableCompanion(
            id: id,
            name: name,
            description: description,
            pricePoints: pricePoints,
            moneyPrice: moneyPrice,
            imagePath: imagePath,
            isWish: isWish,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required int pricePoints,
            Value<double?> moneyPrice = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isWish = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RewardItemTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            pricePoints: pricePoints,
            moneyPrice: moneyPrice,
            imagePath: imagePath,
            isWish: isWish,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RewardItemTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RewardItemTableTable,
    RewardItemTableData,
    $$RewardItemTableTableFilterComposer,
    $$RewardItemTableTableOrderingComposer,
    $$RewardItemTableTableAnnotationComposer,
    $$RewardItemTableTableCreateCompanionBuilder,
    $$RewardItemTableTableUpdateCompanionBuilder,
    (
      RewardItemTableData,
      BaseReferences<_$AppDatabase, $RewardItemTableTable, RewardItemTableData>
    ),
    RewardItemTableData,
    PrefetchHooks Function()>;
typedef $$RedemptionTableTableCreateCompanionBuilder = RedemptionTableCompanion
    Function({
  Value<int> id,
  required int rewardId,
  required String rewardNameSnapshot,
  required int costPoints,
  Value<DateTime> redeemedAt,
  Value<bool> isUsed,
  Value<DateTime?> usedAt,
});
typedef $$RedemptionTableTableUpdateCompanionBuilder = RedemptionTableCompanion
    Function({
  Value<int> id,
  Value<int> rewardId,
  Value<String> rewardNameSnapshot,
  Value<int> costPoints,
  Value<DateTime> redeemedAt,
  Value<bool> isUsed,
  Value<DateTime?> usedAt,
});

class $$RedemptionTableTableFilterComposer
    extends Composer<_$AppDatabase, $RedemptionTableTable> {
  $$RedemptionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rewardId => $composableBuilder(
      column: $table.rewardId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rewardNameSnapshot => $composableBuilder(
      column: $table.rewardNameSnapshot,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get costPoints => $composableBuilder(
      column: $table.costPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get redeemedAt => $composableBuilder(
      column: $table.redeemedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isUsed => $composableBuilder(
      column: $table.isUsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnFilters(column));
}

class $$RedemptionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RedemptionTableTable> {
  $$RedemptionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rewardId => $composableBuilder(
      column: $table.rewardId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rewardNameSnapshot => $composableBuilder(
      column: $table.rewardNameSnapshot,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get costPoints => $composableBuilder(
      column: $table.costPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get redeemedAt => $composableBuilder(
      column: $table.redeemedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isUsed => $composableBuilder(
      column: $table.isUsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnOrderings(column));
}

class $$RedemptionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RedemptionTableTable> {
  $$RedemptionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rewardId =>
      $composableBuilder(column: $table.rewardId, builder: (column) => column);

  GeneratedColumn<String> get rewardNameSnapshot => $composableBuilder(
      column: $table.rewardNameSnapshot, builder: (column) => column);

  GeneratedColumn<int> get costPoints => $composableBuilder(
      column: $table.costPoints, builder: (column) => column);

  GeneratedColumn<DateTime> get redeemedAt => $composableBuilder(
      column: $table.redeemedAt, builder: (column) => column);

  GeneratedColumn<bool> get isUsed =>
      $composableBuilder(column: $table.isUsed, builder: (column) => column);

  GeneratedColumn<DateTime> get usedAt =>
      $composableBuilder(column: $table.usedAt, builder: (column) => column);
}

class $$RedemptionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RedemptionTableTable,
    RedemptionTableData,
    $$RedemptionTableTableFilterComposer,
    $$RedemptionTableTableOrderingComposer,
    $$RedemptionTableTableAnnotationComposer,
    $$RedemptionTableTableCreateCompanionBuilder,
    $$RedemptionTableTableUpdateCompanionBuilder,
    (
      RedemptionTableData,
      BaseReferences<_$AppDatabase, $RedemptionTableTable, RedemptionTableData>
    ),
    RedemptionTableData,
    PrefetchHooks Function()> {
  $$RedemptionTableTableTableManager(
      _$AppDatabase db, $RedemptionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RedemptionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RedemptionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RedemptionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rewardId = const Value.absent(),
            Value<String> rewardNameSnapshot = const Value.absent(),
            Value<int> costPoints = const Value.absent(),
            Value<DateTime> redeemedAt = const Value.absent(),
            Value<bool> isUsed = const Value.absent(),
            Value<DateTime?> usedAt = const Value.absent(),
          }) =>
              RedemptionTableCompanion(
            id: id,
            rewardId: rewardId,
            rewardNameSnapshot: rewardNameSnapshot,
            costPoints: costPoints,
            redeemedAt: redeemedAt,
            isUsed: isUsed,
            usedAt: usedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int rewardId,
            required String rewardNameSnapshot,
            required int costPoints,
            Value<DateTime> redeemedAt = const Value.absent(),
            Value<bool> isUsed = const Value.absent(),
            Value<DateTime?> usedAt = const Value.absent(),
          }) =>
              RedemptionTableCompanion.insert(
            id: id,
            rewardId: rewardId,
            rewardNameSnapshot: rewardNameSnapshot,
            costPoints: costPoints,
            redeemedAt: redeemedAt,
            isUsed: isUsed,
            usedAt: usedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RedemptionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RedemptionTableTable,
    RedemptionTableData,
    $$RedemptionTableTableFilterComposer,
    $$RedemptionTableTableOrderingComposer,
    $$RedemptionTableTableAnnotationComposer,
    $$RedemptionTableTableCreateCompanionBuilder,
    $$RedemptionTableTableUpdateCompanionBuilder,
    (
      RedemptionTableData,
      BaseReferences<_$AppDatabase, $RedemptionTableTable, RedemptionTableData>
    ),
    RedemptionTableData,
    PrefetchHooks Function()>;
typedef $$AchievementTableTableCreateCompanionBuilder
    = AchievementTableCompanion Function({
  Value<int> id,
  required String code,
  required String name,
  required String description,
  required String icon,
  required String conditionType,
  required int targetValue,
  Value<bool> isUnlocked,
  Value<DateTime?> unlockedAt,
});
typedef $$AchievementTableTableUpdateCompanionBuilder
    = AchievementTableCompanion Function({
  Value<int> id,
  Value<String> code,
  Value<String> name,
  Value<String> description,
  Value<String> icon,
  Value<String> conditionType,
  Value<int> targetValue,
  Value<bool> isUnlocked,
  Value<DateTime?> unlockedAt,
});

class $$AchievementTableTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementTableTable> {
  $$AchievementTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get conditionType => $composableBuilder(
      column: $table.conditionType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isUnlocked => $composableBuilder(
      column: $table.isUnlocked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnFilters(column));
}

class $$AchievementTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementTableTable> {
  $$AchievementTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get conditionType => $composableBuilder(
      column: $table.conditionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isUnlocked => $composableBuilder(
      column: $table.isUnlocked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnOrderings(column));
}

class $$AchievementTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementTableTable> {
  $$AchievementTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get conditionType => $composableBuilder(
      column: $table.conditionType, builder: (column) => column);

  GeneratedColumn<int> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => column);

  GeneratedColumn<bool> get isUnlocked => $composableBuilder(
      column: $table.isUnlocked, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => column);
}

class $$AchievementTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AchievementTableTable,
    AchievementTableData,
    $$AchievementTableTableFilterComposer,
    $$AchievementTableTableOrderingComposer,
    $$AchievementTableTableAnnotationComposer,
    $$AchievementTableTableCreateCompanionBuilder,
    $$AchievementTableTableUpdateCompanionBuilder,
    (
      AchievementTableData,
      BaseReferences<_$AppDatabase, $AchievementTableTable,
          AchievementTableData>
    ),
    AchievementTableData,
    PrefetchHooks Function()> {
  $$AchievementTableTableTableManager(
      _$AppDatabase db, $AchievementTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> conditionType = const Value.absent(),
            Value<int> targetValue = const Value.absent(),
            Value<bool> isUnlocked = const Value.absent(),
            Value<DateTime?> unlockedAt = const Value.absent(),
          }) =>
              AchievementTableCompanion(
            id: id,
            code: code,
            name: name,
            description: description,
            icon: icon,
            conditionType: conditionType,
            targetValue: targetValue,
            isUnlocked: isUnlocked,
            unlockedAt: unlockedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String code,
            required String name,
            required String description,
            required String icon,
            required String conditionType,
            required int targetValue,
            Value<bool> isUnlocked = const Value.absent(),
            Value<DateTime?> unlockedAt = const Value.absent(),
          }) =>
              AchievementTableCompanion.insert(
            id: id,
            code: code,
            name: name,
            description: description,
            icon: icon,
            conditionType: conditionType,
            targetValue: targetValue,
            isUnlocked: isUnlocked,
            unlockedAt: unlockedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AchievementTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AchievementTableTable,
    AchievementTableData,
    $$AchievementTableTableFilterComposer,
    $$AchievementTableTableOrderingComposer,
    $$AchievementTableTableAnnotationComposer,
    $$AchievementTableTableCreateCompanionBuilder,
    $$AchievementTableTableUpdateCompanionBuilder,
    (
      AchievementTableData,
      BaseReferences<_$AppDatabase, $AchievementTableTable,
          AchievementTableData>
    ),
    AchievementTableData,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> habitPenaltyEnabled,
  Value<bool> lazyTaxEnabled,
  Value<int> lazyTaxTarget,
  Value<bool> streakProtectionEnabled,
  Value<String?> aiBaseUrl,
  Value<String?> aiApiKey,
  Value<String?> aiModel,
  Value<bool> aiPricingEnabled,
  Value<bool> weeklySummaryEnabled,
  Value<String?> webdavUrl,
  Value<String?> webdavUsername,
  Value<String?> webdavPassword,
  Value<String?> webdavPath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> habitPenaltyEnabled,
  Value<bool> lazyTaxEnabled,
  Value<int> lazyTaxTarget,
  Value<bool> streakProtectionEnabled,
  Value<String?> aiBaseUrl,
  Value<String?> aiApiKey,
  Value<String?> aiModel,
  Value<bool> aiPricingEnabled,
  Value<bool> weeklySummaryEnabled,
  Value<String?> webdavUrl,
  Value<String?> webdavUsername,
  Value<String?> webdavPassword,
  Value<String?> webdavPath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get habitPenaltyEnabled => $composableBuilder(
      column: $table.habitPenaltyEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get lazyTaxEnabled => $composableBuilder(
      column: $table.lazyTaxEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lazyTaxTarget => $composableBuilder(
      column: $table.lazyTaxTarget, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get streakProtectionEnabled => $composableBuilder(
      column: $table.streakProtectionEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aiBaseUrl => $composableBuilder(
      column: $table.aiBaseUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aiApiKey => $composableBuilder(
      column: $table.aiApiKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aiModel => $composableBuilder(
      column: $table.aiModel, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get aiPricingEnabled => $composableBuilder(
      column: $table.aiPricingEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get weeklySummaryEnabled => $composableBuilder(
      column: $table.weeklySummaryEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get webdavUrl => $composableBuilder(
      column: $table.webdavUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get webdavUsername => $composableBuilder(
      column: $table.webdavUsername,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get webdavPassword => $composableBuilder(
      column: $table.webdavPassword,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get webdavPath => $composableBuilder(
      column: $table.webdavPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get habitPenaltyEnabled => $composableBuilder(
      column: $table.habitPenaltyEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get lazyTaxEnabled => $composableBuilder(
      column: $table.lazyTaxEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lazyTaxTarget => $composableBuilder(
      column: $table.lazyTaxTarget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get streakProtectionEnabled => $composableBuilder(
      column: $table.streakProtectionEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aiBaseUrl => $composableBuilder(
      column: $table.aiBaseUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aiApiKey => $composableBuilder(
      column: $table.aiApiKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aiModel => $composableBuilder(
      column: $table.aiModel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get aiPricingEnabled => $composableBuilder(
      column: $table.aiPricingEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get weeklySummaryEnabled => $composableBuilder(
      column: $table.weeklySummaryEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get webdavUrl => $composableBuilder(
      column: $table.webdavUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get webdavUsername => $composableBuilder(
      column: $table.webdavUsername,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get webdavPassword => $composableBuilder(
      column: $table.webdavPassword,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get webdavPath => $composableBuilder(
      column: $table.webdavPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get habitPenaltyEnabled => $composableBuilder(
      column: $table.habitPenaltyEnabled, builder: (column) => column);

  GeneratedColumn<bool> get lazyTaxEnabled => $composableBuilder(
      column: $table.lazyTaxEnabled, builder: (column) => column);

  GeneratedColumn<int> get lazyTaxTarget => $composableBuilder(
      column: $table.lazyTaxTarget, builder: (column) => column);

  GeneratedColumn<bool> get streakProtectionEnabled => $composableBuilder(
      column: $table.streakProtectionEnabled, builder: (column) => column);

  GeneratedColumn<String> get aiBaseUrl =>
      $composableBuilder(column: $table.aiBaseUrl, builder: (column) => column);

  GeneratedColumn<String> get aiApiKey =>
      $composableBuilder(column: $table.aiApiKey, builder: (column) => column);

  GeneratedColumn<String> get aiModel =>
      $composableBuilder(column: $table.aiModel, builder: (column) => column);

  GeneratedColumn<bool> get aiPricingEnabled => $composableBuilder(
      column: $table.aiPricingEnabled, builder: (column) => column);

  GeneratedColumn<bool> get weeklySummaryEnabled => $composableBuilder(
      column: $table.weeklySummaryEnabled, builder: (column) => column);

  GeneratedColumn<String> get webdavUrl =>
      $composableBuilder(column: $table.webdavUrl, builder: (column) => column);

  GeneratedColumn<String> get webdavUsername => $composableBuilder(
      column: $table.webdavUsername, builder: (column) => column);

  GeneratedColumn<String> get webdavPassword => $composableBuilder(
      column: $table.webdavPassword, builder: (column) => column);

  GeneratedColumn<String> get webdavPath => $composableBuilder(
      column: $table.webdavPath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> habitPenaltyEnabled = const Value.absent(),
            Value<bool> lazyTaxEnabled = const Value.absent(),
            Value<int> lazyTaxTarget = const Value.absent(),
            Value<bool> streakProtectionEnabled = const Value.absent(),
            Value<String?> aiBaseUrl = const Value.absent(),
            Value<String?> aiApiKey = const Value.absent(),
            Value<String?> aiModel = const Value.absent(),
            Value<bool> aiPricingEnabled = const Value.absent(),
            Value<bool> weeklySummaryEnabled = const Value.absent(),
            Value<String?> webdavUrl = const Value.absent(),
            Value<String?> webdavUsername = const Value.absent(),
            Value<String?> webdavPassword = const Value.absent(),
            Value<String?> webdavPath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            id: id,
            habitPenaltyEnabled: habitPenaltyEnabled,
            lazyTaxEnabled: lazyTaxEnabled,
            lazyTaxTarget: lazyTaxTarget,
            streakProtectionEnabled: streakProtectionEnabled,
            aiBaseUrl: aiBaseUrl,
            aiApiKey: aiApiKey,
            aiModel: aiModel,
            aiPricingEnabled: aiPricingEnabled,
            weeklySummaryEnabled: weeklySummaryEnabled,
            webdavUrl: webdavUrl,
            webdavUsername: webdavUsername,
            webdavPassword: webdavPassword,
            webdavPath: webdavPath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> habitPenaltyEnabled = const Value.absent(),
            Value<bool> lazyTaxEnabled = const Value.absent(),
            Value<int> lazyTaxTarget = const Value.absent(),
            Value<bool> streakProtectionEnabled = const Value.absent(),
            Value<String?> aiBaseUrl = const Value.absent(),
            Value<String?> aiApiKey = const Value.absent(),
            Value<String?> aiModel = const Value.absent(),
            Value<bool> aiPricingEnabled = const Value.absent(),
            Value<bool> weeklySummaryEnabled = const Value.absent(),
            Value<String?> webdavUrl = const Value.absent(),
            Value<String?> webdavUsername = const Value.absent(),
            Value<String?> webdavPassword = const Value.absent(),
            Value<String?> webdavPath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            id: id,
            habitPenaltyEnabled: habitPenaltyEnabled,
            lazyTaxEnabled: lazyTaxEnabled,
            lazyTaxTarget: lazyTaxTarget,
            streakProtectionEnabled: streakProtectionEnabled,
            aiBaseUrl: aiBaseUrl,
            aiApiKey: aiApiKey,
            aiModel: aiModel,
            aiPricingEnabled: aiPricingEnabled,
            weeklySummaryEnabled: weeklySummaryEnabled,
            webdavUrl: webdavUrl,
            webdavUsername: webdavUsername,
            webdavPassword: webdavPassword,
            webdavPath: webdavPath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserStatsTableTableTableManager get userStatsTable =>
      $$UserStatsTableTableTableManager(_db, _db.userStatsTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$TaskLogTableTableTableManager get taskLogTable =>
      $$TaskLogTableTableTableManager(_db, _db.taskLogTable);
  $$PointLogTableTableTableManager get pointLogTable =>
      $$PointLogTableTableTableManager(_db, _db.pointLogTable);
  $$RewardItemTableTableTableManager get rewardItemTable =>
      $$RewardItemTableTableTableManager(_db, _db.rewardItemTable);
  $$RedemptionTableTableTableManager get redemptionTable =>
      $$RedemptionTableTableTableManager(_db, _db.redemptionTable);
  $$AchievementTableTableTableManager get achievementTable =>
      $$AchievementTableTableTableManager(_db, _db.achievementTable);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
