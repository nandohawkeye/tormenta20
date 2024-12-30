// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GrimoireTableTable extends GrimoireTable
    with TableInfo<$GrimoireTableTable, GrimoireTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GrimoireTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, name, desc, imagePath, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grimoire_table';
  @override
  VerificationContext validateIntegrity(Insertable<GrimoireTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  GrimoireTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GrimoireTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GrimoireTableTable createAlias(String alias) {
    return $GrimoireTableTable(attachedDatabase, alias);
  }
}

class GrimoireTableData extends DataClass
    implements Insertable<GrimoireTableData> {
  final String uuid;
  final String name;
  final String? desc;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GrimoireTableData(
      {required this.uuid,
      required this.name,
      this.desc,
      this.imagePath,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GrimoireTableCompanion toCompanion(bool nullToAbsent) {
    return GrimoireTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GrimoireTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GrimoireTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String?>(json['desc']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String?>(desc),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GrimoireTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> desc = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GrimoireTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        desc: desc.present ? desc.value : this.desc,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GrimoireTableData copyWithCompanion(GrimoireTableCompanion data) {
    return GrimoireTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GrimoireTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, name, desc, imagePath, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrimoireTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GrimoireTableCompanion extends UpdateCompanion<GrimoireTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> desc;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GrimoireTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GrimoireTableCompanion.insert({
    required String uuid,
    required String name,
    this.desc = const Value.absent(),
    this.imagePath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GrimoireTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GrimoireTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String?>? desc,
      Value<String?>? imagePath,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return GrimoireTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrimoireTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MagicCharacterTableTable extends MagicCharacterTable
    with TableInfo<$MagicCharacterTableTable, MagicCharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MagicCharacterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _magicIdMeta =
      const VerificationMeta('magicId');
  @override
  late final GeneratedColumn<int> magicId = GeneratedColumn<int>(
      'magic_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _grimoireUUidMeta =
      const VerificationMeta('grimoireUUid');
  @override
  late final GeneratedColumn<String> grimoireUUid = GeneratedColumn<String>(
      'grimoire_u_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _circleLevelMeta =
      const VerificationMeta('circleLevel');
  @override
  late final GeneratedColumn<int> circleLevel = GeneratedColumn<int>(
      'circle_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _schoolIndexMeta =
      const VerificationMeta('schoolIndex');
  @override
  late final GeneratedColumn<int> schoolIndex = GeneratedColumn<int>(
      'school_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _executionIndexMeta =
      const VerificationMeta('executionIndex');
  @override
  late final GeneratedColumn<int> executionIndex = GeneratedColumn<int>(
      'execution_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationIndexMeta =
      const VerificationMeta('durationIndex');
  @override
  late final GeneratedColumn<int> durationIndex = GeneratedColumn<int>(
      'duration_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rangeIndexMeta =
      const VerificationMeta('rangeIndex');
  @override
  late final GeneratedColumn<int> rangeIndex = GeneratedColumn<int>(
      'range_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _resistenceMeta =
      const VerificationMeta('resistence');
  @override
  late final GeneratedColumn<String> resistence = GeneratedColumn<String>(
      'resistence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetAreaEfectMeta =
      const VerificationMeta('targetAreaEfect');
  @override
  late final GeneratedColumn<String> targetAreaEfect = GeneratedColumn<String>(
      'target_area_efect', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        magicId,
        uuid,
        grimoireUUid,
        name,
        desc,
        circleLevel,
        typeIndex,
        schoolIndex,
        executionIndex,
        durationIndex,
        rangeIndex,
        resistence,
        targetAreaEfect
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'magic_character_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MagicCharacterTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('magic_id')) {
      context.handle(_magicIdMeta,
          magicId.isAcceptableOrUnknown(data['magic_id']!, _magicIdMeta));
    } else if (isInserting) {
      context.missing(_magicIdMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('grimoire_u_uid')) {
      context.handle(
          _grimoireUUidMeta,
          grimoireUUid.isAcceptableOrUnknown(
              data['grimoire_u_uid']!, _grimoireUUidMeta));
    } else if (isInserting) {
      context.missing(_grimoireUUidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('circle_level')) {
      context.handle(
          _circleLevelMeta,
          circleLevel.isAcceptableOrUnknown(
              data['circle_level']!, _circleLevelMeta));
    } else if (isInserting) {
      context.missing(_circleLevelMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('school_index')) {
      context.handle(
          _schoolIndexMeta,
          schoolIndex.isAcceptableOrUnknown(
              data['school_index']!, _schoolIndexMeta));
    } else if (isInserting) {
      context.missing(_schoolIndexMeta);
    }
    if (data.containsKey('execution_index')) {
      context.handle(
          _executionIndexMeta,
          executionIndex.isAcceptableOrUnknown(
              data['execution_index']!, _executionIndexMeta));
    } else if (isInserting) {
      context.missing(_executionIndexMeta);
    }
    if (data.containsKey('duration_index')) {
      context.handle(
          _durationIndexMeta,
          durationIndex.isAcceptableOrUnknown(
              data['duration_index']!, _durationIndexMeta));
    } else if (isInserting) {
      context.missing(_durationIndexMeta);
    }
    if (data.containsKey('range_index')) {
      context.handle(
          _rangeIndexMeta,
          rangeIndex.isAcceptableOrUnknown(
              data['range_index']!, _rangeIndexMeta));
    } else if (isInserting) {
      context.missing(_rangeIndexMeta);
    }
    if (data.containsKey('resistence')) {
      context.handle(
          _resistenceMeta,
          resistence.isAcceptableOrUnknown(
              data['resistence']!, _resistenceMeta));
    } else if (isInserting) {
      context.missing(_resistenceMeta);
    }
    if (data.containsKey('target_area_efect')) {
      context.handle(
          _targetAreaEfectMeta,
          targetAreaEfect.isAcceptableOrUnknown(
              data['target_area_efect']!, _targetAreaEfectMeta));
    } else if (isInserting) {
      context.missing(_targetAreaEfectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  MagicCharacterTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MagicCharacterTableData(
      magicId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      grimoireUUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grimoire_u_uid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      circleLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}circle_level'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      schoolIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}school_index'])!,
      executionIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}execution_index'])!,
      durationIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_index'])!,
      rangeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}range_index'])!,
      resistence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resistence'])!,
      targetAreaEfect: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_area_efect'])!,
    );
  }

  @override
  $MagicCharacterTableTable createAlias(String alias) {
    return $MagicCharacterTableTable(attachedDatabase, alias);
  }
}

class MagicCharacterTableData extends DataClass
    implements Insertable<MagicCharacterTableData> {
  final int magicId;
  final String uuid;
  final String grimoireUUid;
  final String name;
  final String desc;
  final int circleLevel;
  final int typeIndex;
  final int schoolIndex;
  final int executionIndex;
  final int durationIndex;
  final int rangeIndex;
  final String resistence;
  final String targetAreaEfect;
  const MagicCharacterTableData(
      {required this.magicId,
      required this.uuid,
      required this.grimoireUUid,
      required this.name,
      required this.desc,
      required this.circleLevel,
      required this.typeIndex,
      required this.schoolIndex,
      required this.executionIndex,
      required this.durationIndex,
      required this.rangeIndex,
      required this.resistence,
      required this.targetAreaEfect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['magic_id'] = Variable<int>(magicId);
    map['uuid'] = Variable<String>(uuid);
    map['grimoire_u_uid'] = Variable<String>(grimoireUUid);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['circle_level'] = Variable<int>(circleLevel);
    map['type_index'] = Variable<int>(typeIndex);
    map['school_index'] = Variable<int>(schoolIndex);
    map['execution_index'] = Variable<int>(executionIndex);
    map['duration_index'] = Variable<int>(durationIndex);
    map['range_index'] = Variable<int>(rangeIndex);
    map['resistence'] = Variable<String>(resistence);
    map['target_area_efect'] = Variable<String>(targetAreaEfect);
    return map;
  }

  MagicCharacterTableCompanion toCompanion(bool nullToAbsent) {
    return MagicCharacterTableCompanion(
      magicId: Value(magicId),
      uuid: Value(uuid),
      grimoireUUid: Value(grimoireUUid),
      name: Value(name),
      desc: Value(desc),
      circleLevel: Value(circleLevel),
      typeIndex: Value(typeIndex),
      schoolIndex: Value(schoolIndex),
      executionIndex: Value(executionIndex),
      durationIndex: Value(durationIndex),
      rangeIndex: Value(rangeIndex),
      resistence: Value(resistence),
      targetAreaEfect: Value(targetAreaEfect),
    );
  }

  factory MagicCharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MagicCharacterTableData(
      magicId: serializer.fromJson<int>(json['magicId']),
      uuid: serializer.fromJson<String>(json['uuid']),
      grimoireUUid: serializer.fromJson<String>(json['grimoireUUid']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      circleLevel: serializer.fromJson<int>(json['circleLevel']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      schoolIndex: serializer.fromJson<int>(json['schoolIndex']),
      executionIndex: serializer.fromJson<int>(json['executionIndex']),
      durationIndex: serializer.fromJson<int>(json['durationIndex']),
      rangeIndex: serializer.fromJson<int>(json['rangeIndex']),
      resistence: serializer.fromJson<String>(json['resistence']),
      targetAreaEfect: serializer.fromJson<String>(json['targetAreaEfect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'magicId': serializer.toJson<int>(magicId),
      'uuid': serializer.toJson<String>(uuid),
      'grimoireUUid': serializer.toJson<String>(grimoireUUid),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'circleLevel': serializer.toJson<int>(circleLevel),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'schoolIndex': serializer.toJson<int>(schoolIndex),
      'executionIndex': serializer.toJson<int>(executionIndex),
      'durationIndex': serializer.toJson<int>(durationIndex),
      'rangeIndex': serializer.toJson<int>(rangeIndex),
      'resistence': serializer.toJson<String>(resistence),
      'targetAreaEfect': serializer.toJson<String>(targetAreaEfect),
    };
  }

  MagicCharacterTableData copyWith(
          {int? magicId,
          String? uuid,
          String? grimoireUUid,
          String? name,
          String? desc,
          int? circleLevel,
          int? typeIndex,
          int? schoolIndex,
          int? executionIndex,
          int? durationIndex,
          int? rangeIndex,
          String? resistence,
          String? targetAreaEfect}) =>
      MagicCharacterTableData(
        magicId: magicId ?? this.magicId,
        uuid: uuid ?? this.uuid,
        grimoireUUid: grimoireUUid ?? this.grimoireUUid,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        circleLevel: circleLevel ?? this.circleLevel,
        typeIndex: typeIndex ?? this.typeIndex,
        schoolIndex: schoolIndex ?? this.schoolIndex,
        executionIndex: executionIndex ?? this.executionIndex,
        durationIndex: durationIndex ?? this.durationIndex,
        rangeIndex: rangeIndex ?? this.rangeIndex,
        resistence: resistence ?? this.resistence,
        targetAreaEfect: targetAreaEfect ?? this.targetAreaEfect,
      );
  MagicCharacterTableData copyWithCompanion(MagicCharacterTableCompanion data) {
    return MagicCharacterTableData(
      magicId: data.magicId.present ? data.magicId.value : this.magicId,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      grimoireUUid: data.grimoireUUid.present
          ? data.grimoireUUid.value
          : this.grimoireUUid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      circleLevel:
          data.circleLevel.present ? data.circleLevel.value : this.circleLevel,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      schoolIndex:
          data.schoolIndex.present ? data.schoolIndex.value : this.schoolIndex,
      executionIndex: data.executionIndex.present
          ? data.executionIndex.value
          : this.executionIndex,
      durationIndex: data.durationIndex.present
          ? data.durationIndex.value
          : this.durationIndex,
      rangeIndex:
          data.rangeIndex.present ? data.rangeIndex.value : this.rangeIndex,
      resistence:
          data.resistence.present ? data.resistence.value : this.resistence,
      targetAreaEfect: data.targetAreaEfect.present
          ? data.targetAreaEfect.value
          : this.targetAreaEfect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MagicCharacterTableData(')
          ..write('magicId: $magicId, ')
          ..write('uuid: $uuid, ')
          ..write('grimoireUUid: $grimoireUUid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('circleLevel: $circleLevel, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('schoolIndex: $schoolIndex, ')
          ..write('executionIndex: $executionIndex, ')
          ..write('durationIndex: $durationIndex, ')
          ..write('rangeIndex: $rangeIndex, ')
          ..write('resistence: $resistence, ')
          ..write('targetAreaEfect: $targetAreaEfect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      magicId,
      uuid,
      grimoireUUid,
      name,
      desc,
      circleLevel,
      typeIndex,
      schoolIndex,
      executionIndex,
      durationIndex,
      rangeIndex,
      resistence,
      targetAreaEfect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MagicCharacterTableData &&
          other.magicId == this.magicId &&
          other.uuid == this.uuid &&
          other.grimoireUUid == this.grimoireUUid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.circleLevel == this.circleLevel &&
          other.typeIndex == this.typeIndex &&
          other.schoolIndex == this.schoolIndex &&
          other.executionIndex == this.executionIndex &&
          other.durationIndex == this.durationIndex &&
          other.rangeIndex == this.rangeIndex &&
          other.resistence == this.resistence &&
          other.targetAreaEfect == this.targetAreaEfect);
}

class MagicCharacterTableCompanion
    extends UpdateCompanion<MagicCharacterTableData> {
  final Value<int> magicId;
  final Value<String> uuid;
  final Value<String> grimoireUUid;
  final Value<String> name;
  final Value<String> desc;
  final Value<int> circleLevel;
  final Value<int> typeIndex;
  final Value<int> schoolIndex;
  final Value<int> executionIndex;
  final Value<int> durationIndex;
  final Value<int> rangeIndex;
  final Value<String> resistence;
  final Value<String> targetAreaEfect;
  final Value<int> rowid;
  const MagicCharacterTableCompanion({
    this.magicId = const Value.absent(),
    this.uuid = const Value.absent(),
    this.grimoireUUid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.circleLevel = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.schoolIndex = const Value.absent(),
    this.executionIndex = const Value.absent(),
    this.durationIndex = const Value.absent(),
    this.rangeIndex = const Value.absent(),
    this.resistence = const Value.absent(),
    this.targetAreaEfect = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MagicCharacterTableCompanion.insert({
    required int magicId,
    required String uuid,
    required String grimoireUUid,
    required String name,
    required String desc,
    required int circleLevel,
    required int typeIndex,
    required int schoolIndex,
    required int executionIndex,
    required int durationIndex,
    required int rangeIndex,
    required String resistence,
    required String targetAreaEfect,
    this.rowid = const Value.absent(),
  })  : magicId = Value(magicId),
        uuid = Value(uuid),
        grimoireUUid = Value(grimoireUUid),
        name = Value(name),
        desc = Value(desc),
        circleLevel = Value(circleLevel),
        typeIndex = Value(typeIndex),
        schoolIndex = Value(schoolIndex),
        executionIndex = Value(executionIndex),
        durationIndex = Value(durationIndex),
        rangeIndex = Value(rangeIndex),
        resistence = Value(resistence),
        targetAreaEfect = Value(targetAreaEfect);
  static Insertable<MagicCharacterTableData> custom({
    Expression<int>? magicId,
    Expression<String>? uuid,
    Expression<String>? grimoireUUid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<int>? circleLevel,
    Expression<int>? typeIndex,
    Expression<int>? schoolIndex,
    Expression<int>? executionIndex,
    Expression<int>? durationIndex,
    Expression<int>? rangeIndex,
    Expression<String>? resistence,
    Expression<String>? targetAreaEfect,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (magicId != null) 'magic_id': magicId,
      if (uuid != null) 'uuid': uuid,
      if (grimoireUUid != null) 'grimoire_u_uid': grimoireUUid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (circleLevel != null) 'circle_level': circleLevel,
      if (typeIndex != null) 'type_index': typeIndex,
      if (schoolIndex != null) 'school_index': schoolIndex,
      if (executionIndex != null) 'execution_index': executionIndex,
      if (durationIndex != null) 'duration_index': durationIndex,
      if (rangeIndex != null) 'range_index': rangeIndex,
      if (resistence != null) 'resistence': resistence,
      if (targetAreaEfect != null) 'target_area_efect': targetAreaEfect,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MagicCharacterTableCompanion copyWith(
      {Value<int>? magicId,
      Value<String>? uuid,
      Value<String>? grimoireUUid,
      Value<String>? name,
      Value<String>? desc,
      Value<int>? circleLevel,
      Value<int>? typeIndex,
      Value<int>? schoolIndex,
      Value<int>? executionIndex,
      Value<int>? durationIndex,
      Value<int>? rangeIndex,
      Value<String>? resistence,
      Value<String>? targetAreaEfect,
      Value<int>? rowid}) {
    return MagicCharacterTableCompanion(
      magicId: magicId ?? this.magicId,
      uuid: uuid ?? this.uuid,
      grimoireUUid: grimoireUUid ?? this.grimoireUUid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      circleLevel: circleLevel ?? this.circleLevel,
      typeIndex: typeIndex ?? this.typeIndex,
      schoolIndex: schoolIndex ?? this.schoolIndex,
      executionIndex: executionIndex ?? this.executionIndex,
      durationIndex: durationIndex ?? this.durationIndex,
      rangeIndex: rangeIndex ?? this.rangeIndex,
      resistence: resistence ?? this.resistence,
      targetAreaEfect: targetAreaEfect ?? this.targetAreaEfect,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (magicId.present) {
      map['magic_id'] = Variable<int>(magicId.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (grimoireUUid.present) {
      map['grimoire_u_uid'] = Variable<String>(grimoireUUid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (circleLevel.present) {
      map['circle_level'] = Variable<int>(circleLevel.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (schoolIndex.present) {
      map['school_index'] = Variable<int>(schoolIndex.value);
    }
    if (executionIndex.present) {
      map['execution_index'] = Variable<int>(executionIndex.value);
    }
    if (durationIndex.present) {
      map['duration_index'] = Variable<int>(durationIndex.value);
    }
    if (rangeIndex.present) {
      map['range_index'] = Variable<int>(rangeIndex.value);
    }
    if (resistence.present) {
      map['resistence'] = Variable<String>(resistence.value);
    }
    if (targetAreaEfect.present) {
      map['target_area_efect'] = Variable<String>(targetAreaEfect.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MagicCharacterTableCompanion(')
          ..write('magicId: $magicId, ')
          ..write('uuid: $uuid, ')
          ..write('grimoireUUid: $grimoireUUid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('circleLevel: $circleLevel, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('schoolIndex: $schoolIndex, ')
          ..write('executionIndex: $executionIndex, ')
          ..write('durationIndex: $durationIndex, ')
          ..write('rangeIndex: $rangeIndex, ')
          ..write('resistence: $resistence, ')
          ..write('targetAreaEfect: $targetAreaEfect, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GrimoireTableTable grimoireTable = $GrimoireTableTable(this);
  late final $MagicCharacterTableTable magicCharacterTable =
      $MagicCharacterTableTable(this);
  late final GrimoireDAO grimoireDAO = GrimoireDAO(this as AppDatabase);
  late final MagicCharacterDAO magicCharacterDAO =
      MagicCharacterDAO(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [grimoireTable, magicCharacterTable];
}

typedef $$GrimoireTableTableCreateCompanionBuilder = GrimoireTableCompanion
    Function({
  required String uuid,
  required String name,
  Value<String?> desc,
  Value<String?> imagePath,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$GrimoireTableTableUpdateCompanionBuilder = GrimoireTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String?> desc,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$GrimoireTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GrimoireTableTable,
    GrimoireTableData,
    $$GrimoireTableTableFilterComposer,
    $$GrimoireTableTableOrderingComposer,
    $$GrimoireTableTableCreateCompanionBuilder,
    $$GrimoireTableTableUpdateCompanionBuilder> {
  $$GrimoireTableTableTableManager(_$AppDatabase db, $GrimoireTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GrimoireTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GrimoireTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion(
            uuid: uuid,
            name: name,
            desc: desc,
            imagePath: imagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            Value<String?> desc = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion.insert(
            uuid: uuid,
            name: name,
            desc: desc,
            imagePath: imagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$GrimoireTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GrimoireTableTable> {
  $$GrimoireTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$GrimoireTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GrimoireTableTable> {
  $$GrimoireTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MagicCharacterTableTableCreateCompanionBuilder
    = MagicCharacterTableCompanion Function({
  required int magicId,
  required String uuid,
  required String grimoireUUid,
  required String name,
  required String desc,
  required int circleLevel,
  required int typeIndex,
  required int schoolIndex,
  required int executionIndex,
  required int durationIndex,
  required int rangeIndex,
  required String resistence,
  required String targetAreaEfect,
  Value<int> rowid,
});
typedef $$MagicCharacterTableTableUpdateCompanionBuilder
    = MagicCharacterTableCompanion Function({
  Value<int> magicId,
  Value<String> uuid,
  Value<String> grimoireUUid,
  Value<String> name,
  Value<String> desc,
  Value<int> circleLevel,
  Value<int> typeIndex,
  Value<int> schoolIndex,
  Value<int> executionIndex,
  Value<int> durationIndex,
  Value<int> rangeIndex,
  Value<String> resistence,
  Value<String> targetAreaEfect,
  Value<int> rowid,
});

class $$MagicCharacterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MagicCharacterTableTable,
    MagicCharacterTableData,
    $$MagicCharacterTableTableFilterComposer,
    $$MagicCharacterTableTableOrderingComposer,
    $$MagicCharacterTableTableCreateCompanionBuilder,
    $$MagicCharacterTableTableUpdateCompanionBuilder> {
  $$MagicCharacterTableTableTableManager(
      _$AppDatabase db, $MagicCharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$MagicCharacterTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$MagicCharacterTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> magicId = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> grimoireUUid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<int> circleLevel = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> schoolIndex = const Value.absent(),
            Value<int> executionIndex = const Value.absent(),
            Value<int> durationIndex = const Value.absent(),
            Value<int> rangeIndex = const Value.absent(),
            Value<String> resistence = const Value.absent(),
            Value<String> targetAreaEfect = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MagicCharacterTableCompanion(
            magicId: magicId,
            uuid: uuid,
            grimoireUUid: grimoireUUid,
            name: name,
            desc: desc,
            circleLevel: circleLevel,
            typeIndex: typeIndex,
            schoolIndex: schoolIndex,
            executionIndex: executionIndex,
            durationIndex: durationIndex,
            rangeIndex: rangeIndex,
            resistence: resistence,
            targetAreaEfect: targetAreaEfect,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int magicId,
            required String uuid,
            required String grimoireUUid,
            required String name,
            required String desc,
            required int circleLevel,
            required int typeIndex,
            required int schoolIndex,
            required int executionIndex,
            required int durationIndex,
            required int rangeIndex,
            required String resistence,
            required String targetAreaEfect,
            Value<int> rowid = const Value.absent(),
          }) =>
              MagicCharacterTableCompanion.insert(
            magicId: magicId,
            uuid: uuid,
            grimoireUUid: grimoireUUid,
            name: name,
            desc: desc,
            circleLevel: circleLevel,
            typeIndex: typeIndex,
            schoolIndex: schoolIndex,
            executionIndex: executionIndex,
            durationIndex: durationIndex,
            rangeIndex: rangeIndex,
            resistence: resistence,
            targetAreaEfect: targetAreaEfect,
            rowid: rowid,
          ),
        ));
}

class $$MagicCharacterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MagicCharacterTableTable> {
  $$MagicCharacterTableTableFilterComposer(super.$state);
  ColumnFilters<int> get magicId => $state.composableBuilder(
      column: $state.table.magicId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get grimoireUUid => $state.composableBuilder(
      column: $state.table.grimoireUUid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get circleLevel => $state.composableBuilder(
      column: $state.table.circleLevel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get schoolIndex => $state.composableBuilder(
      column: $state.table.schoolIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get executionIndex => $state.composableBuilder(
      column: $state.table.executionIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get durationIndex => $state.composableBuilder(
      column: $state.table.durationIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get rangeIndex => $state.composableBuilder(
      column: $state.table.rangeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get resistence => $state.composableBuilder(
      column: $state.table.resistence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get targetAreaEfect => $state.composableBuilder(
      column: $state.table.targetAreaEfect,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MagicCharacterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MagicCharacterTableTable> {
  $$MagicCharacterTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get magicId => $state.composableBuilder(
      column: $state.table.magicId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get grimoireUUid => $state.composableBuilder(
      column: $state.table.grimoireUUid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get circleLevel => $state.composableBuilder(
      column: $state.table.circleLevel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get schoolIndex => $state.composableBuilder(
      column: $state.table.schoolIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get executionIndex => $state.composableBuilder(
      column: $state.table.executionIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get durationIndex => $state.composableBuilder(
      column: $state.table.durationIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get rangeIndex => $state.composableBuilder(
      column: $state.table.rangeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get resistence => $state.composableBuilder(
      column: $state.table.resistence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get targetAreaEfect => $state.composableBuilder(
      column: $state.table.targetAreaEfect,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GrimoireTableTableTableManager get grimoireTable =>
      $$GrimoireTableTableTableManager(_db, _db.grimoireTable);
  $$MagicCharacterTableTableTableManager get magicCharacterTable =>
      $$MagicCharacterTableTableTableManager(_db, _db.magicCharacterTable);
}
