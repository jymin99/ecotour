// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final String memo;
  final String title;
  final String place;
  final DateTime date;
  final int startTimeH;
  final int startTimeM;
  final int endTimeH;
  final int endTimeM;
  const Schedule(
      {required this.id,
      required this.memo,
      required this.title,
      required this.place,
      required this.date,
      required this.startTimeH,
      required this.startTimeM,
      required this.endTimeH,
      required this.endTimeM});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memo'] = Variable<String>(memo);
    map['title'] = Variable<String>(title);
    map['place'] = Variable<String>(place);
    map['date'] = Variable<DateTime>(date);
    map['start_time_h'] = Variable<int>(startTimeH);
    map['start_time_m'] = Variable<int>(startTimeM);
    map['end_time_h'] = Variable<int>(endTimeH);
    map['end_time_m'] = Variable<int>(endTimeM);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      memo: Value(memo),
      title: Value(title),
      place: Value(place),
      date: Value(date),
      startTimeH: Value(startTimeH),
      startTimeM: Value(startTimeM),
      endTimeH: Value(endTimeH),
      endTimeM: Value(endTimeM),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      memo: serializer.fromJson<String>(json['memo']),
      title: serializer.fromJson<String>(json['title']),
      place: serializer.fromJson<String>(json['place']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTimeH: serializer.fromJson<int>(json['startTimeH']),
      startTimeM: serializer.fromJson<int>(json['startTimeM']),
      endTimeH: serializer.fromJson<int>(json['endTimeH']),
      endTimeM: serializer.fromJson<int>(json['endTimeM']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memo': serializer.toJson<String>(memo),
      'title': serializer.toJson<String>(title),
      'place': serializer.toJson<String>(place),
      'date': serializer.toJson<DateTime>(date),
      'startTimeH': serializer.toJson<int>(startTimeH),
      'startTimeM': serializer.toJson<int>(startTimeM),
      'endTimeH': serializer.toJson<int>(endTimeH),
      'endTimeM': serializer.toJson<int>(endTimeM),
    };
  }

  Schedule copyWith(
          {int? id,
          String? memo,
          String? title,
          String? place,
          DateTime? date,
          int? startTimeH,
          int? startTimeM,
          int? endTimeH,
          int? endTimeM}) =>
      Schedule(
        id: id ?? this.id,
        memo: memo ?? this.memo,
        title: title ?? this.title,
        place: place ?? this.place,
        date: date ?? this.date,
        startTimeH: startTimeH ?? this.startTimeH,
        startTimeM: startTimeM ?? this.startTimeM,
        endTimeH: endTimeH ?? this.endTimeH,
        endTimeM: endTimeM ?? this.endTimeM,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('memo: $memo, ')
          ..write('title: $title, ')
          ..write('place: $place, ')
          ..write('date: $date, ')
          ..write('startTimeH: $startTimeH, ')
          ..write('startTimeM: $startTimeM, ')
          ..write('endTimeH: $endTimeH, ')
          ..write('endTimeM: $endTimeM')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, memo, title, place, date, startTimeH, startTimeM, endTimeH, endTimeM);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.memo == this.memo &&
          other.title == this.title &&
          other.place == this.place &&
          other.date == this.date &&
          other.startTimeH == this.startTimeH &&
          other.startTimeM == this.startTimeM &&
          other.endTimeH == this.endTimeH &&
          other.endTimeM == this.endTimeM);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<String> memo;
  final Value<String> title;
  final Value<String> place;
  final Value<DateTime> date;
  final Value<int> startTimeH;
  final Value<int> startTimeM;
  final Value<int> endTimeH;
  final Value<int> endTimeM;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.memo = const Value.absent(),
    this.title = const Value.absent(),
    this.place = const Value.absent(),
    this.date = const Value.absent(),
    this.startTimeH = const Value.absent(),
    this.startTimeM = const Value.absent(),
    this.endTimeH = const Value.absent(),
    this.endTimeM = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String memo,
    required String title,
    required String place,
    required DateTime date,
    required int startTimeH,
    required int startTimeM,
    required int endTimeH,
    required int endTimeM,
  })  : memo = Value(memo),
        title = Value(title),
        place = Value(place),
        date = Value(date),
        startTimeH = Value(startTimeH),
        startTimeM = Value(startTimeM),
        endTimeH = Value(endTimeH),
        endTimeM = Value(endTimeM);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<String>? memo,
    Expression<String>? title,
    Expression<String>? place,
    Expression<DateTime>? date,
    Expression<int>? startTimeH,
    Expression<int>? startTimeM,
    Expression<int>? endTimeH,
    Expression<int>? endTimeM,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memo != null) 'memo': memo,
      if (title != null) 'title': title,
      if (place != null) 'place': place,
      if (date != null) 'date': date,
      if (startTimeH != null) 'start_time_h': startTimeH,
      if (startTimeM != null) 'start_time_m': startTimeM,
      if (endTimeH != null) 'end_time_h': endTimeH,
      if (endTimeM != null) 'end_time_m': endTimeM,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? memo,
      Value<String>? title,
      Value<String>? place,
      Value<DateTime>? date,
      Value<int>? startTimeH,
      Value<int>? startTimeM,
      Value<int>? endTimeH,
      Value<int>? endTimeM}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      memo: memo ?? this.memo,
      title: title ?? this.title,
      place: place ?? this.place,
      date: date ?? this.date,
      startTimeH: startTimeH ?? this.startTimeH,
      startTimeM: startTimeM ?? this.startTimeM,
      endTimeH: endTimeH ?? this.endTimeH,
      endTimeM: endTimeM ?? this.endTimeM,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTimeH.present) {
      map['start_time_h'] = Variable<int>(startTimeH.value);
    }
    if (startTimeM.present) {
      map['start_time_m'] = Variable<int>(startTimeM.value);
    }
    if (endTimeH.present) {
      map['end_time_h'] = Variable<int>(endTimeH.value);
    }
    if (endTimeM.present) {
      map['end_time_m'] = Variable<int>(endTimeM.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('memo: $memo, ')
          ..write('title: $title, ')
          ..write('place: $place, ')
          ..write('date: $date, ')
          ..write('startTimeH: $startTimeH, ')
          ..write('startTimeM: $startTimeM, ')
          ..write('endTimeH: $endTimeH, ')
          ..write('endTimeM: $endTimeM')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
      'place', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _startTimeHMeta = const VerificationMeta('startTimeH');
  @override
  late final GeneratedColumn<int> startTimeH = GeneratedColumn<int>(
      'start_time_h', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _startTimeMMeta = const VerificationMeta('startTimeM');
  @override
  late final GeneratedColumn<int> startTimeM = GeneratedColumn<int>(
      'start_time_m', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _endTimeHMeta = const VerificationMeta('endTimeH');
  @override
  late final GeneratedColumn<int> endTimeH = GeneratedColumn<int>(
      'end_time_h', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _endTimeMMeta = const VerificationMeta('endTimeM');
  @override
  late final GeneratedColumn<int> endTimeM = GeneratedColumn<int>(
      'end_time_m', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memo,
        title,
        place,
        date,
        startTimeH,
        startTimeM,
        endTimeH,
        endTimeM
      ];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['place']!, _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time_h')) {
      context.handle(
          _startTimeHMeta,
          startTimeH.isAcceptableOrUnknown(
              data['start_time_h']!, _startTimeHMeta));
    } else if (isInserting) {
      context.missing(_startTimeHMeta);
    }
    if (data.containsKey('start_time_m')) {
      context.handle(
          _startTimeMMeta,
          startTimeM.isAcceptableOrUnknown(
              data['start_time_m']!, _startTimeMMeta));
    } else if (isInserting) {
      context.missing(_startTimeMMeta);
    }
    if (data.containsKey('end_time_h')) {
      context.handle(_endTimeHMeta,
          endTimeH.isAcceptableOrUnknown(data['end_time_h']!, _endTimeHMeta));
    } else if (isInserting) {
      context.missing(_endTimeHMeta);
    }
    if (data.containsKey('end_time_m')) {
      context.handle(_endTimeMMeta,
          endTimeM.isAcceptableOrUnknown(data['end_time_m']!, _endTimeMMeta));
    } else if (isInserting) {
      context.missing(_endTimeMMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      memo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}memo'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      place: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}place'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTimeH: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}start_time_h'])!,
      startTimeM: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}start_time_m'])!,
      endTimeH: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}end_time_h'])!,
      endTimeM: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}end_time_m'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedules];
}
