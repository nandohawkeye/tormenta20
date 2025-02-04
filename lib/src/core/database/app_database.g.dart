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
  static const VerificationMeta _iconAssetMeta =
      const VerificationMeta('iconAsset');
  @override
  late final GeneratedColumn<String> iconAsset = GeneratedColumn<String>(
      'icon_asset', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorIntMeta =
      const VerificationMeta('colorInt');
  @override
  late final GeneratedColumn<int> colorInt = GeneratedColumn<int>(
      'color_int', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
      [uuid, name, desc, iconAsset, colorInt, createdAt, updatedAt];
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
    if (data.containsKey('icon_asset')) {
      context.handle(_iconAssetMeta,
          iconAsset.isAcceptableOrUnknown(data['icon_asset']!, _iconAssetMeta));
    } else if (isInserting) {
      context.missing(_iconAssetMeta);
    }
    if (data.containsKey('color_int')) {
      context.handle(_colorIntMeta,
          colorInt.isAcceptableOrUnknown(data['color_int']!, _colorIntMeta));
    } else if (isInserting) {
      context.missing(_colorIntMeta);
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
      iconAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_asset'])!,
      colorInt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_int'])!,
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
  final String iconAsset;
  final int colorInt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GrimoireTableData(
      {required this.uuid,
      required this.name,
      this.desc,
      required this.iconAsset,
      required this.colorInt,
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
    map['icon_asset'] = Variable<String>(iconAsset);
    map['color_int'] = Variable<int>(colorInt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GrimoireTableCompanion toCompanion(bool nullToAbsent) {
    return GrimoireTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      iconAsset: Value(iconAsset),
      colorInt: Value(colorInt),
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
      iconAsset: serializer.fromJson<String>(json['iconAsset']),
      colorInt: serializer.fromJson<int>(json['colorInt']),
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
      'iconAsset': serializer.toJson<String>(iconAsset),
      'colorInt': serializer.toJson<int>(colorInt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GrimoireTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> desc = const Value.absent(),
          String? iconAsset,
          int? colorInt,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GrimoireTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        desc: desc.present ? desc.value : this.desc,
        iconAsset: iconAsset ?? this.iconAsset,
        colorInt: colorInt ?? this.colorInt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GrimoireTableData copyWithCompanion(GrimoireTableCompanion data) {
    return GrimoireTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      iconAsset: data.iconAsset.present ? data.iconAsset.value : this.iconAsset,
      colorInt: data.colorInt.present ? data.colorInt.value : this.colorInt,
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
          ..write('iconAsset: $iconAsset, ')
          ..write('colorInt: $colorInt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, name, desc, iconAsset, colorInt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrimoireTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.iconAsset == this.iconAsset &&
          other.colorInt == this.colorInt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GrimoireTableCompanion extends UpdateCompanion<GrimoireTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> desc;
  final Value<String> iconAsset;
  final Value<int> colorInt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GrimoireTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.iconAsset = const Value.absent(),
    this.colorInt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GrimoireTableCompanion.insert({
    required String uuid,
    required String name,
    this.desc = const Value.absent(),
    required String iconAsset,
    required int colorInt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        iconAsset = Value(iconAsset),
        colorInt = Value(colorInt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GrimoireTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? iconAsset,
    Expression<int>? colorInt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (iconAsset != null) 'icon_asset': iconAsset,
      if (colorInt != null) 'color_int': colorInt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GrimoireTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String?>? desc,
      Value<String>? iconAsset,
      Value<int>? colorInt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return GrimoireTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      iconAsset: iconAsset ?? this.iconAsset,
      colorInt: colorInt ?? this.colorInt,
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
    if (iconAsset.present) {
      map['icon_asset'] = Variable<String>(iconAsset.value);
    }
    if (colorInt.present) {
      map['color_int'] = Variable<int>(colorInt.value);
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
          ..write('iconAsset: $iconAsset, ')
          ..write('colorInt: $colorInt, ')
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
  static const VerificationMeta _publicationMeta =
      const VerificationMeta('publication');
  @override
  late final GeneratedColumn<String> publication = GeneratedColumn<String>(
      'publication', aliasedName, false,
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
        targetAreaEfect,
        publication
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
    if (data.containsKey('publication')) {
      context.handle(
          _publicationMeta,
          publication.isAcceptableOrUnknown(
              data['publication']!, _publicationMeta));
    } else if (isInserting) {
      context.missing(_publicationMeta);
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
      publication: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publication'])!,
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
  final String publication;
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
      required this.targetAreaEfect,
      required this.publication});
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
    map['publication'] = Variable<String>(publication);
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
      publication: Value(publication),
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
      publication: serializer.fromJson<String>(json['publication']),
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
      'publication': serializer.toJson<String>(publication),
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
          String? targetAreaEfect,
          String? publication}) =>
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
        publication: publication ?? this.publication,
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
      publication:
          data.publication.present ? data.publication.value : this.publication,
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
          ..write('targetAreaEfect: $targetAreaEfect, ')
          ..write('publication: $publication')
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
      targetAreaEfect,
      publication);
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
          other.targetAreaEfect == this.targetAreaEfect &&
          other.publication == this.publication);
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
  final Value<String> publication;
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
    this.publication = const Value.absent(),
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
    required String publication,
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
        targetAreaEfect = Value(targetAreaEfect),
        publication = Value(publication);
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
    Expression<String>? publication,
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
      if (publication != null) 'publication': publication,
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
      Value<String>? publication,
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
      publication: publication ?? this.publication,
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
    if (publication.present) {
      map['publication'] = Variable<String>(publication.value);
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
          ..write('publication: $publication, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardTableTable extends BoardTable
    with TableInfo<$BoardTableTable, BoardTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _adventureNameMeta =
      const VerificationMeta('adventureName');
  @override
  late final GeneratedColumn<String> adventureName = GeneratedColumn<String>(
      'adventure_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bannerPathMeta =
      const VerificationMeta('bannerPath');
  @override
  late final GeneratedColumn<String> bannerPath = GeneratedColumn<String>(
      'banner_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
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
  static const VerificationMeta _whatsGroupLinkMeta =
      const VerificationMeta('whatsGroupLink');
  @override
  late final GeneratedColumn<String> whatsGroupLink = GeneratedColumn<String>(
      'whats_group_link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telegramGroupLinkMeta =
      const VerificationMeta('telegramGroupLink');
  @override
  late final GeneratedColumn<String> telegramGroupLink =
      GeneratedColumn<String>('telegram_group_link', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _discordServerLinkMeta =
      const VerificationMeta('discordServerLink');
  @override
  late final GeneratedColumn<String> discordServerLink =
      GeneratedColumn<String>('discord_server_link', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _driveFilesLinkMeta =
      const VerificationMeta('driveFilesLink');
  @override
  late final GeneratedColumn<String> driveFilesLink = GeneratedColumn<String>(
      'drive_files_link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        level,
        typeIndex,
        adventureName,
        bannerPath,
        desc,
        createdAt,
        updatedAt,
        whatsGroupLink,
        telegramGroupLink,
        discordServerLink,
        driveFilesLink
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_table';
  @override
  VerificationContext validateIntegrity(Insertable<BoardTableData> instance,
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
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('adventure_name')) {
      context.handle(
          _adventureNameMeta,
          adventureName.isAcceptableOrUnknown(
              data['adventure_name']!, _adventureNameMeta));
    } else if (isInserting) {
      context.missing(_adventureNameMeta);
    }
    if (data.containsKey('banner_path')) {
      context.handle(
          _bannerPathMeta,
          bannerPath.isAcceptableOrUnknown(
              data['banner_path']!, _bannerPathMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
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
    if (data.containsKey('whats_group_link')) {
      context.handle(
          _whatsGroupLinkMeta,
          whatsGroupLink.isAcceptableOrUnknown(
              data['whats_group_link']!, _whatsGroupLinkMeta));
    }
    if (data.containsKey('telegram_group_link')) {
      context.handle(
          _telegramGroupLinkMeta,
          telegramGroupLink.isAcceptableOrUnknown(
              data['telegram_group_link']!, _telegramGroupLinkMeta));
    }
    if (data.containsKey('discord_server_link')) {
      context.handle(
          _discordServerLinkMeta,
          discordServerLink.isAcceptableOrUnknown(
              data['discord_server_link']!, _discordServerLinkMeta));
    }
    if (data.containsKey('drive_files_link')) {
      context.handle(
          _driveFilesLinkMeta,
          driveFilesLink.isAcceptableOrUnknown(
              data['drive_files_link']!, _driveFilesLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      adventureName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}adventure_name'])!,
      bannerPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}banner_path']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      whatsGroupLink: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}whats_group_link']),
      telegramGroupLink: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}telegram_group_link']),
      discordServerLink: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}discord_server_link']),
      driveFilesLink: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}drive_files_link']),
    );
  }

  @override
  $BoardTableTable createAlias(String alias) {
    return $BoardTableTable(attachedDatabase, alias);
  }
}

class BoardTableData extends DataClass implements Insertable<BoardTableData> {
  final String uuid;
  final String name;
  final int level;
  final int typeIndex;
  final String adventureName;
  final String? bannerPath;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? whatsGroupLink;
  final String? telegramGroupLink;
  final String? discordServerLink;
  final String? driveFilesLink;
  const BoardTableData(
      {required this.uuid,
      required this.name,
      required this.level,
      required this.typeIndex,
      required this.adventureName,
      this.bannerPath,
      this.desc,
      required this.createdAt,
      required this.updatedAt,
      this.whatsGroupLink,
      this.telegramGroupLink,
      this.discordServerLink,
      this.driveFilesLink});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['type_index'] = Variable<int>(typeIndex);
    map['adventure_name'] = Variable<String>(adventureName);
    if (!nullToAbsent || bannerPath != null) {
      map['banner_path'] = Variable<String>(bannerPath);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || whatsGroupLink != null) {
      map['whats_group_link'] = Variable<String>(whatsGroupLink);
    }
    if (!nullToAbsent || telegramGroupLink != null) {
      map['telegram_group_link'] = Variable<String>(telegramGroupLink);
    }
    if (!nullToAbsent || discordServerLink != null) {
      map['discord_server_link'] = Variable<String>(discordServerLink);
    }
    if (!nullToAbsent || driveFilesLink != null) {
      map['drive_files_link'] = Variable<String>(driveFilesLink);
    }
    return map;
  }

  BoardTableCompanion toCompanion(bool nullToAbsent) {
    return BoardTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      level: Value(level),
      typeIndex: Value(typeIndex),
      adventureName: Value(adventureName),
      bannerPath: bannerPath == null && nullToAbsent
          ? const Value.absent()
          : Value(bannerPath),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      whatsGroupLink: whatsGroupLink == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsGroupLink),
      telegramGroupLink: telegramGroupLink == null && nullToAbsent
          ? const Value.absent()
          : Value(telegramGroupLink),
      discordServerLink: discordServerLink == null && nullToAbsent
          ? const Value.absent()
          : Value(discordServerLink),
      driveFilesLink: driveFilesLink == null && nullToAbsent
          ? const Value.absent()
          : Value(driveFilesLink),
    );
  }

  factory BoardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      adventureName: serializer.fromJson<String>(json['adventureName']),
      bannerPath: serializer.fromJson<String?>(json['bannerPath']),
      desc: serializer.fromJson<String?>(json['desc']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      whatsGroupLink: serializer.fromJson<String?>(json['whatsGroupLink']),
      telegramGroupLink:
          serializer.fromJson<String?>(json['telegramGroupLink']),
      discordServerLink:
          serializer.fromJson<String?>(json['discordServerLink']),
      driveFilesLink: serializer.fromJson<String?>(json['driveFilesLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'adventureName': serializer.toJson<String>(adventureName),
      'bannerPath': serializer.toJson<String?>(bannerPath),
      'desc': serializer.toJson<String?>(desc),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'whatsGroupLink': serializer.toJson<String?>(whatsGroupLink),
      'telegramGroupLink': serializer.toJson<String?>(telegramGroupLink),
      'discordServerLink': serializer.toJson<String?>(discordServerLink),
      'driveFilesLink': serializer.toJson<String?>(driveFilesLink),
    };
  }

  BoardTableData copyWith(
          {String? uuid,
          String? name,
          int? level,
          int? typeIndex,
          String? adventureName,
          Value<String?> bannerPath = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<String?> whatsGroupLink = const Value.absent(),
          Value<String?> telegramGroupLink = const Value.absent(),
          Value<String?> discordServerLink = const Value.absent(),
          Value<String?> driveFilesLink = const Value.absent()}) =>
      BoardTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        level: level ?? this.level,
        typeIndex: typeIndex ?? this.typeIndex,
        adventureName: adventureName ?? this.adventureName,
        bannerPath: bannerPath.present ? bannerPath.value : this.bannerPath,
        desc: desc.present ? desc.value : this.desc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        whatsGroupLink:
            whatsGroupLink.present ? whatsGroupLink.value : this.whatsGroupLink,
        telegramGroupLink: telegramGroupLink.present
            ? telegramGroupLink.value
            : this.telegramGroupLink,
        discordServerLink: discordServerLink.present
            ? discordServerLink.value
            : this.discordServerLink,
        driveFilesLink:
            driveFilesLink.present ? driveFilesLink.value : this.driveFilesLink,
      );
  BoardTableData copyWithCompanion(BoardTableCompanion data) {
    return BoardTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      adventureName: data.adventureName.present
          ? data.adventureName.value
          : this.adventureName,
      bannerPath:
          data.bannerPath.present ? data.bannerPath.value : this.bannerPath,
      desc: data.desc.present ? data.desc.value : this.desc,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      whatsGroupLink: data.whatsGroupLink.present
          ? data.whatsGroupLink.value
          : this.whatsGroupLink,
      telegramGroupLink: data.telegramGroupLink.present
          ? data.telegramGroupLink.value
          : this.telegramGroupLink,
      discordServerLink: data.discordServerLink.present
          ? data.discordServerLink.value
          : this.discordServerLink,
      driveFilesLink: data.driveFilesLink.present
          ? data.driveFilesLink.value
          : this.driveFilesLink,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('adventureName: $adventureName, ')
          ..write('bannerPath: $bannerPath, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('whatsGroupLink: $whatsGroupLink, ')
          ..write('telegramGroupLink: $telegramGroupLink, ')
          ..write('discordServerLink: $discordServerLink, ')
          ..write('driveFilesLink: $driveFilesLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      level,
      typeIndex,
      adventureName,
      bannerPath,
      desc,
      createdAt,
      updatedAt,
      whatsGroupLink,
      telegramGroupLink,
      discordServerLink,
      driveFilesLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.level == this.level &&
          other.typeIndex == this.typeIndex &&
          other.adventureName == this.adventureName &&
          other.bannerPath == this.bannerPath &&
          other.desc == this.desc &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.whatsGroupLink == this.whatsGroupLink &&
          other.telegramGroupLink == this.telegramGroupLink &&
          other.discordServerLink == this.discordServerLink &&
          other.driveFilesLink == this.driveFilesLink);
}

class BoardTableCompanion extends UpdateCompanion<BoardTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<int> level;
  final Value<int> typeIndex;
  final Value<String> adventureName;
  final Value<String?> bannerPath;
  final Value<String?> desc;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> whatsGroupLink;
  final Value<String?> telegramGroupLink;
  final Value<String?> discordServerLink;
  final Value<String?> driveFilesLink;
  final Value<int> rowid;
  const BoardTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.adventureName = const Value.absent(),
    this.bannerPath = const Value.absent(),
    this.desc = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.whatsGroupLink = const Value.absent(),
    this.telegramGroupLink = const Value.absent(),
    this.discordServerLink = const Value.absent(),
    this.driveFilesLink = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardTableCompanion.insert({
    required String uuid,
    required String name,
    required int level,
    required int typeIndex,
    required String adventureName,
    this.bannerPath = const Value.absent(),
    this.desc = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.whatsGroupLink = const Value.absent(),
    this.telegramGroupLink = const Value.absent(),
    this.discordServerLink = const Value.absent(),
    this.driveFilesLink = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        level = Value(level),
        typeIndex = Value(typeIndex),
        adventureName = Value(adventureName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BoardTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? typeIndex,
    Expression<String>? adventureName,
    Expression<String>? bannerPath,
    Expression<String>? desc,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? whatsGroupLink,
    Expression<String>? telegramGroupLink,
    Expression<String>? discordServerLink,
    Expression<String>? driveFilesLink,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (typeIndex != null) 'type_index': typeIndex,
      if (adventureName != null) 'adventure_name': adventureName,
      if (bannerPath != null) 'banner_path': bannerPath,
      if (desc != null) 'desc': desc,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (whatsGroupLink != null) 'whats_group_link': whatsGroupLink,
      if (telegramGroupLink != null) 'telegram_group_link': telegramGroupLink,
      if (discordServerLink != null) 'discord_server_link': discordServerLink,
      if (driveFilesLink != null) 'drive_files_link': driveFilesLink,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<int>? level,
      Value<int>? typeIndex,
      Value<String>? adventureName,
      Value<String?>? bannerPath,
      Value<String?>? desc,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String?>? whatsGroupLink,
      Value<String?>? telegramGroupLink,
      Value<String?>? discordServerLink,
      Value<String?>? driveFilesLink,
      Value<int>? rowid}) {
    return BoardTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      level: level ?? this.level,
      typeIndex: typeIndex ?? this.typeIndex,
      adventureName: adventureName ?? this.adventureName,
      bannerPath: bannerPath ?? this.bannerPath,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      whatsGroupLink: whatsGroupLink ?? this.whatsGroupLink,
      telegramGroupLink: telegramGroupLink ?? this.telegramGroupLink,
      discordServerLink: discordServerLink ?? this.discordServerLink,
      driveFilesLink: driveFilesLink ?? this.driveFilesLink,
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
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (adventureName.present) {
      map['adventure_name'] = Variable<String>(adventureName.value);
    }
    if (bannerPath.present) {
      map['banner_path'] = Variable<String>(bannerPath.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (whatsGroupLink.present) {
      map['whats_group_link'] = Variable<String>(whatsGroupLink.value);
    }
    if (telegramGroupLink.present) {
      map['telegram_group_link'] = Variable<String>(telegramGroupLink.value);
    }
    if (discordServerLink.present) {
      map['discord_server_link'] = Variable<String>(discordServerLink.value);
    }
    if (driveFilesLink.present) {
      map['drive_files_link'] = Variable<String>(driveFilesLink.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('adventureName: $adventureName, ')
          ..write('bannerPath: $bannerPath, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('whatsGroupLink: $whatsGroupLink, ')
          ..write('telegramGroupLink: $telegramGroupLink, ')
          ..write('discordServerLink: $discordServerLink, ')
          ..write('driveFilesLink: $driveFilesLink, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardMaterialTableTable extends BoardMaterialTable
    with TableInfo<$BoardMaterialTableTable, BoardMaterialTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardMaterialTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardUuidMeta =
      const VerificationMeta('boardUuid');
  @override
  late final GeneratedColumn<String> boardUuid = GeneratedColumn<String>(
      'board_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, typeIndex, path, boardUuid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_material_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardMaterialTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('board_uuid')) {
      context.handle(_boardUuidMeta,
          boardUuid.isAcceptableOrUnknown(data['board_uuid']!, _boardUuidMeta));
    } else if (isInserting) {
      context.missing(_boardUuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardMaterialTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardMaterialTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
    );
  }

  @override
  $BoardMaterialTableTable createAlias(String alias) {
    return $BoardMaterialTableTable(attachedDatabase, alias);
  }
}

class BoardMaterialTableData extends DataClass
    implements Insertable<BoardMaterialTableData> {
  final String uuid;
  final int typeIndex;
  final String path;
  final String boardUuid;
  const BoardMaterialTableData(
      {required this.uuid,
      required this.typeIndex,
      required this.path,
      required this.boardUuid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['type_index'] = Variable<int>(typeIndex);
    map['path'] = Variable<String>(path);
    map['board_uuid'] = Variable<String>(boardUuid);
    return map;
  }

  BoardMaterialTableCompanion toCompanion(bool nullToAbsent) {
    return BoardMaterialTableCompanion(
      uuid: Value(uuid),
      typeIndex: Value(typeIndex),
      path: Value(path),
      boardUuid: Value(boardUuid),
    );
  }

  factory BoardMaterialTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardMaterialTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      path: serializer.fromJson<String>(json['path']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'path': serializer.toJson<String>(path),
      'boardUuid': serializer.toJson<String>(boardUuid),
    };
  }

  BoardMaterialTableData copyWith(
          {String? uuid, int? typeIndex, String? path, String? boardUuid}) =>
      BoardMaterialTableData(
        uuid: uuid ?? this.uuid,
        typeIndex: typeIndex ?? this.typeIndex,
        path: path ?? this.path,
        boardUuid: boardUuid ?? this.boardUuid,
      );
  BoardMaterialTableData copyWithCompanion(BoardMaterialTableCompanion data) {
    return BoardMaterialTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      path: data.path.present ? data.path.value : this.path,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardMaterialTableData(')
          ..write('uuid: $uuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('path: $path, ')
          ..write('boardUuid: $boardUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, typeIndex, path, boardUuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardMaterialTableData &&
          other.uuid == this.uuid &&
          other.typeIndex == this.typeIndex &&
          other.path == this.path &&
          other.boardUuid == this.boardUuid);
}

class BoardMaterialTableCompanion
    extends UpdateCompanion<BoardMaterialTableData> {
  final Value<String> uuid;
  final Value<int> typeIndex;
  final Value<String> path;
  final Value<String> boardUuid;
  final Value<int> rowid;
  const BoardMaterialTableCompanion({
    this.uuid = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.path = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardMaterialTableCompanion.insert({
    required String uuid,
    required int typeIndex,
    required String path,
    required String boardUuid,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        typeIndex = Value(typeIndex),
        path = Value(path),
        boardUuid = Value(boardUuid);
  static Insertable<BoardMaterialTableData> custom({
    Expression<String>? uuid,
    Expression<int>? typeIndex,
    Expression<String>? path,
    Expression<String>? boardUuid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (typeIndex != null) 'type_index': typeIndex,
      if (path != null) 'path': path,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardMaterialTableCompanion copyWith(
      {Value<String>? uuid,
      Value<int>? typeIndex,
      Value<String>? path,
      Value<String>? boardUuid,
      Value<int>? rowid}) {
    return BoardMaterialTableCompanion(
      uuid: uuid ?? this.uuid,
      typeIndex: typeIndex ?? this.typeIndex,
      path: path ?? this.path,
      boardUuid: boardUuid ?? this.boardUuid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (boardUuid.present) {
      map['board_uuid'] = Variable<String>(boardUuid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardMaterialTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('path: $path, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardGameTableTable extends BoardGameTable
    with TableInfo<$BoardGameTableTable, BoardGameTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardGameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardUuidMeta =
      const VerificationMeta('boardUuid');
  @override
  late final GeneratedColumn<String> boardUuid = GeneratedColumn<String>(
      'board_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
      'end_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uuid, boardUuid, startedAt, endAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_game_table';
  @override
  VerificationContext validateIntegrity(Insertable<BoardGameTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('board_uuid')) {
      context.handle(_boardUuidMeta,
          boardUuid.isAcceptableOrUnknown(data['board_uuid']!, _boardUuidMeta));
    } else if (isInserting) {
      context.missing(_boardUuidMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
          _endAtMeta, endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardGameTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardGameTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_at']),
    );
  }

  @override
  $BoardGameTableTable createAlias(String alias) {
    return $BoardGameTableTable(attachedDatabase, alias);
  }
}

class BoardGameTableData extends DataClass
    implements Insertable<BoardGameTableData> {
  final String uuid;
  final String boardUuid;
  final DateTime startedAt;
  final DateTime? endAt;
  const BoardGameTableData(
      {required this.uuid,
      required this.boardUuid,
      required this.startedAt,
      this.endAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  BoardGameTableCompanion toCompanion(bool nullToAbsent) {
    return BoardGameTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      startedAt: Value(startedAt),
      endAt:
          endAt == null && nullToAbsent ? const Value.absent() : Value(endAt),
    );
  }

  factory BoardGameTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardGameTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  BoardGameTableData copyWith(
          {String? uuid,
          String? boardUuid,
          DateTime? startedAt,
          Value<DateTime?> endAt = const Value.absent()}) =>
      BoardGameTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        startedAt: startedAt ?? this.startedAt,
        endAt: endAt.present ? endAt.value : this.endAt,
      );
  BoardGameTableData copyWithCompanion(BoardGameTableCompanion data) {
    return BoardGameTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, boardUuid, startedAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardGameTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.startedAt == this.startedAt &&
          other.endAt == this.endAt);
}

class BoardGameTableCompanion extends UpdateCompanion<BoardGameTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endAt;
  final Value<int> rowid;
  const BoardGameTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardGameTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    required DateTime startedAt,
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        startedAt = Value(startedAt);
  static Insertable<BoardGameTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (startedAt != null) 'started_at': startedAt,
      if (endAt != null) 'end_at': endAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardGameTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endAt,
      Value<int>? rowid}) {
    return BoardGameTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      startedAt: startedAt ?? this.startedAt,
      endAt: endAt ?? this.endAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (boardUuid.present) {
      map['board_uuid'] = Variable<String>(boardUuid.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardGamePauseTableTable extends BoardGamePauseTable
    with TableInfo<$BoardGamePauseTableTable, BoardGamePauseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardGamePauseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardGameUuidMeta =
      const VerificationMeta('boardGameUuid');
  @override
  late final GeneratedColumn<String> boardGameUuid = GeneratedColumn<String>(
      'board_game_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
      'end_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uuid, boardGameUuid, startedAt, endAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_game_pause_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardGamePauseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('board_game_uuid')) {
      context.handle(
          _boardGameUuidMeta,
          boardGameUuid.isAcceptableOrUnknown(
              data['board_game_uuid']!, _boardGameUuidMeta));
    } else if (isInserting) {
      context.missing(_boardGameUuidMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
          _endAtMeta, endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardGamePauseTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardGamePauseTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardGameUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}board_game_uuid'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_at']),
    );
  }

  @override
  $BoardGamePauseTableTable createAlias(String alias) {
    return $BoardGamePauseTableTable(attachedDatabase, alias);
  }
}

class BoardGamePauseTableData extends DataClass
    implements Insertable<BoardGamePauseTableData> {
  final String uuid;
  final String boardGameUuid;
  final DateTime startedAt;
  final DateTime? endAt;
  const BoardGamePauseTableData(
      {required this.uuid,
      required this.boardGameUuid,
      required this.startedAt,
      this.endAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_game_uuid'] = Variable<String>(boardGameUuid);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  BoardGamePauseTableCompanion toCompanion(bool nullToAbsent) {
    return BoardGamePauseTableCompanion(
      uuid: Value(uuid),
      boardGameUuid: Value(boardGameUuid),
      startedAt: Value(startedAt),
      endAt:
          endAt == null && nullToAbsent ? const Value.absent() : Value(endAt),
    );
  }

  factory BoardGamePauseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardGamePauseTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardGameUuid: serializer.fromJson<String>(json['boardGameUuid']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'boardGameUuid': serializer.toJson<String>(boardGameUuid),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  BoardGamePauseTableData copyWith(
          {String? uuid,
          String? boardGameUuid,
          DateTime? startedAt,
          Value<DateTime?> endAt = const Value.absent()}) =>
      BoardGamePauseTableData(
        uuid: uuid ?? this.uuid,
        boardGameUuid: boardGameUuid ?? this.boardGameUuid,
        startedAt: startedAt ?? this.startedAt,
        endAt: endAt.present ? endAt.value : this.endAt,
      );
  BoardGamePauseTableData copyWithCompanion(BoardGamePauseTableCompanion data) {
    return BoardGamePauseTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardGameUuid: data.boardGameUuid.present
          ? data.boardGameUuid.value
          : this.boardGameUuid,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardGamePauseTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardGameUuid: $boardGameUuid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, boardGameUuid, startedAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardGamePauseTableData &&
          other.uuid == this.uuid &&
          other.boardGameUuid == this.boardGameUuid &&
          other.startedAt == this.startedAt &&
          other.endAt == this.endAt);
}

class BoardGamePauseTableCompanion
    extends UpdateCompanion<BoardGamePauseTableData> {
  final Value<String> uuid;
  final Value<String> boardGameUuid;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endAt;
  final Value<int> rowid;
  const BoardGamePauseTableCompanion({
    this.uuid = const Value.absent(),
    this.boardGameUuid = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardGamePauseTableCompanion.insert({
    required String uuid,
    required String boardGameUuid,
    required DateTime startedAt,
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardGameUuid = Value(boardGameUuid),
        startedAt = Value(startedAt);
  static Insertable<BoardGamePauseTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardGameUuid,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardGameUuid != null) 'board_game_uuid': boardGameUuid,
      if (startedAt != null) 'started_at': startedAt,
      if (endAt != null) 'end_at': endAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardGamePauseTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardGameUuid,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endAt,
      Value<int>? rowid}) {
    return BoardGamePauseTableCompanion(
      uuid: uuid ?? this.uuid,
      boardGameUuid: boardGameUuid ?? this.boardGameUuid,
      startedAt: startedAt ?? this.startedAt,
      endAt: endAt ?? this.endAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (boardGameUuid.present) {
      map['board_game_uuid'] = Variable<String>(boardGameUuid.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardGamePauseTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardGameUuid: $boardGameUuid, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardLinkTableTable extends BoardLinkTable
    with TableInfo<$BoardLinkTableTable, BoardLinkTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardLinkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardUuidMeta =
      const VerificationMeta('boardUuid');
  @override
  late final GeneratedColumn<String> boardUuid = GeneratedColumn<String>(
      'board_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, typeIndex, link, boardUuid, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_link_table';
  @override
  VerificationContext validateIntegrity(Insertable<BoardLinkTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('board_uuid')) {
      context.handle(_boardUuidMeta,
          boardUuid.isAcceptableOrUnknown(data['board_uuid']!, _boardUuidMeta));
    } else if (isInserting) {
      context.missing(_boardUuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardLinkTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardLinkTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $BoardLinkTableTable createAlias(String alias) {
    return $BoardLinkTableTable(attachedDatabase, alias);
  }
}

class BoardLinkTableData extends DataClass
    implements Insertable<BoardLinkTableData> {
  final String uuid;
  final int typeIndex;
  final String link;
  final String boardUuid;
  final String title;
  const BoardLinkTableData(
      {required this.uuid,
      required this.typeIndex,
      required this.link,
      required this.boardUuid,
      required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['type_index'] = Variable<int>(typeIndex);
    map['link'] = Variable<String>(link);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['title'] = Variable<String>(title);
    return map;
  }

  BoardLinkTableCompanion toCompanion(bool nullToAbsent) {
    return BoardLinkTableCompanion(
      uuid: Value(uuid),
      typeIndex: Value(typeIndex),
      link: Value(link),
      boardUuid: Value(boardUuid),
      title: Value(title),
    );
  }

  factory BoardLinkTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardLinkTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      link: serializer.fromJson<String>(json['link']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'link': serializer.toJson<String>(link),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'title': serializer.toJson<String>(title),
    };
  }

  BoardLinkTableData copyWith(
          {String? uuid,
          int? typeIndex,
          String? link,
          String? boardUuid,
          String? title}) =>
      BoardLinkTableData(
        uuid: uuid ?? this.uuid,
        typeIndex: typeIndex ?? this.typeIndex,
        link: link ?? this.link,
        boardUuid: boardUuid ?? this.boardUuid,
        title: title ?? this.title,
      );
  BoardLinkTableData copyWithCompanion(BoardLinkTableCompanion data) {
    return BoardLinkTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      link: data.link.present ? data.link.value : this.link,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardLinkTableData(')
          ..write('uuid: $uuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('link: $link, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, typeIndex, link, boardUuid, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardLinkTableData &&
          other.uuid == this.uuid &&
          other.typeIndex == this.typeIndex &&
          other.link == this.link &&
          other.boardUuid == this.boardUuid &&
          other.title == this.title);
}

class BoardLinkTableCompanion extends UpdateCompanion<BoardLinkTableData> {
  final Value<String> uuid;
  final Value<int> typeIndex;
  final Value<String> link;
  final Value<String> boardUuid;
  final Value<String> title;
  final Value<int> rowid;
  const BoardLinkTableCompanion({
    this.uuid = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.link = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardLinkTableCompanion.insert({
    required String uuid,
    required int typeIndex,
    required String link,
    required String boardUuid,
    required String title,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        typeIndex = Value(typeIndex),
        link = Value(link),
        boardUuid = Value(boardUuid),
        title = Value(title);
  static Insertable<BoardLinkTableData> custom({
    Expression<String>? uuid,
    Expression<int>? typeIndex,
    Expression<String>? link,
    Expression<String>? boardUuid,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (typeIndex != null) 'type_index': typeIndex,
      if (link != null) 'link': link,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardLinkTableCompanion copyWith(
      {Value<String>? uuid,
      Value<int>? typeIndex,
      Value<String>? link,
      Value<String>? boardUuid,
      Value<String>? title,
      Value<int>? rowid}) {
    return BoardLinkTableCompanion(
      uuid: uuid ?? this.uuid,
      typeIndex: typeIndex ?? this.typeIndex,
      link: link ?? this.link,
      boardUuid: boardUuid ?? this.boardUuid,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (boardUuid.present) {
      map['board_uuid'] = Variable<String>(boardUuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardLinkTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('link: $link, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('title: $title, ')
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
  late final $BoardTableTable boardTable = $BoardTableTable(this);
  late final $BoardMaterialTableTable boardMaterialTable =
      $BoardMaterialTableTable(this);
  late final $BoardGameTableTable boardGameTable = $BoardGameTableTable(this);
  late final $BoardGamePauseTableTable boardGamePauseTable =
      $BoardGamePauseTableTable(this);
  late final $BoardLinkTableTable boardLinkTable = $BoardLinkTableTable(this);
  late final GrimoireDAO grimoireDAO = GrimoireDAO(this as AppDatabase);
  late final BoardDAO boardDAO = BoardDAO(this as AppDatabase);
  late final MagicCharacterDAO magicCharacterDAO =
      MagicCharacterDAO(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        grimoireTable,
        magicCharacterTable,
        boardTable,
        boardMaterialTable,
        boardGameTable,
        boardGamePauseTable,
        boardLinkTable
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$GrimoireTableTableCreateCompanionBuilder = GrimoireTableCompanion
    Function({
  required String uuid,
  required String name,
  Value<String?> desc,
  required String iconAsset,
  required int colorInt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$GrimoireTableTableUpdateCompanionBuilder = GrimoireTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String?> desc,
  Value<String> iconAsset,
  Value<int> colorInt,
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
            Value<String> iconAsset = const Value.absent(),
            Value<int> colorInt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion(
            uuid: uuid,
            name: name,
            desc: desc,
            iconAsset: iconAsset,
            colorInt: colorInt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            Value<String?> desc = const Value.absent(),
            required String iconAsset,
            required int colorInt,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion.insert(
            uuid: uuid,
            name: name,
            desc: desc,
            iconAsset: iconAsset,
            colorInt: colorInt,
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

  ColumnFilters<String> get iconAsset => $state.composableBuilder(
      column: $state.table.iconAsset,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colorInt => $state.composableBuilder(
      column: $state.table.colorInt,
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

  ColumnOrderings<String> get iconAsset => $state.composableBuilder(
      column: $state.table.iconAsset,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colorInt => $state.composableBuilder(
      column: $state.table.colorInt,
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
  required String publication,
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
  Value<String> publication,
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
            Value<String> publication = const Value.absent(),
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
            publication: publication,
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
            required String publication,
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
            publication: publication,
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

  ColumnFilters<String> get publication => $state.composableBuilder(
      column: $state.table.publication,
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

  ColumnOrderings<String> get publication => $state.composableBuilder(
      column: $state.table.publication,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardTableTableCreateCompanionBuilder = BoardTableCompanion Function({
  required String uuid,
  required String name,
  required int level,
  required int typeIndex,
  required String adventureName,
  Value<String?> bannerPath,
  Value<String?> desc,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String?> whatsGroupLink,
  Value<String?> telegramGroupLink,
  Value<String?> discordServerLink,
  Value<String?> driveFilesLink,
  Value<int> rowid,
});
typedef $$BoardTableTableUpdateCompanionBuilder = BoardTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<int> level,
  Value<int> typeIndex,
  Value<String> adventureName,
  Value<String?> bannerPath,
  Value<String?> desc,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String?> whatsGroupLink,
  Value<String?> telegramGroupLink,
  Value<String?> discordServerLink,
  Value<String?> driveFilesLink,
  Value<int> rowid,
});

class $$BoardTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardTableTable,
    BoardTableData,
    $$BoardTableTableFilterComposer,
    $$BoardTableTableOrderingComposer,
    $$BoardTableTableCreateCompanionBuilder,
    $$BoardTableTableUpdateCompanionBuilder> {
  $$BoardTableTableTableManager(_$AppDatabase db, $BoardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<String> adventureName = const Value.absent(),
            Value<String?> bannerPath = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String?> whatsGroupLink = const Value.absent(),
            Value<String?> telegramGroupLink = const Value.absent(),
            Value<String?> discordServerLink = const Value.absent(),
            Value<String?> driveFilesLink = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardTableCompanion(
            uuid: uuid,
            name: name,
            level: level,
            typeIndex: typeIndex,
            adventureName: adventureName,
            bannerPath: bannerPath,
            desc: desc,
            createdAt: createdAt,
            updatedAt: updatedAt,
            whatsGroupLink: whatsGroupLink,
            telegramGroupLink: telegramGroupLink,
            discordServerLink: discordServerLink,
            driveFilesLink: driveFilesLink,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required int level,
            required int typeIndex,
            required String adventureName,
            Value<String?> bannerPath = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String?> whatsGroupLink = const Value.absent(),
            Value<String?> telegramGroupLink = const Value.absent(),
            Value<String?> discordServerLink = const Value.absent(),
            Value<String?> driveFilesLink = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardTableCompanion.insert(
            uuid: uuid,
            name: name,
            level: level,
            typeIndex: typeIndex,
            adventureName: adventureName,
            bannerPath: bannerPath,
            desc: desc,
            createdAt: createdAt,
            updatedAt: updatedAt,
            whatsGroupLink: whatsGroupLink,
            telegramGroupLink: telegramGroupLink,
            discordServerLink: discordServerLink,
            driveFilesLink: driveFilesLink,
            rowid: rowid,
          ),
        ));
}

class $$BoardTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardTableTable> {
  $$BoardTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get adventureName => $state.composableBuilder(
      column: $state.table.adventureName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bannerPath => $state.composableBuilder(
      column: $state.table.bannerPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
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

  ColumnFilters<String> get whatsGroupLink => $state.composableBuilder(
      column: $state.table.whatsGroupLink,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get telegramGroupLink => $state.composableBuilder(
      column: $state.table.telegramGroupLink,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get discordServerLink => $state.composableBuilder(
      column: $state.table.discordServerLink,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get driveFilesLink => $state.composableBuilder(
      column: $state.table.driveFilesLink,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardTableTable> {
  $$BoardTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get adventureName => $state.composableBuilder(
      column: $state.table.adventureName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bannerPath => $state.composableBuilder(
      column: $state.table.bannerPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
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

  ColumnOrderings<String> get whatsGroupLink => $state.composableBuilder(
      column: $state.table.whatsGroupLink,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get telegramGroupLink => $state.composableBuilder(
      column: $state.table.telegramGroupLink,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get discordServerLink => $state.composableBuilder(
      column: $state.table.discordServerLink,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get driveFilesLink => $state.composableBuilder(
      column: $state.table.driveFilesLink,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardMaterialTableTableCreateCompanionBuilder
    = BoardMaterialTableCompanion Function({
  required String uuid,
  required int typeIndex,
  required String path,
  required String boardUuid,
  Value<int> rowid,
});
typedef $$BoardMaterialTableTableUpdateCompanionBuilder
    = BoardMaterialTableCompanion Function({
  Value<String> uuid,
  Value<int> typeIndex,
  Value<String> path,
  Value<String> boardUuid,
  Value<int> rowid,
});

class $$BoardMaterialTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardMaterialTableTable,
    BoardMaterialTableData,
    $$BoardMaterialTableTableFilterComposer,
    $$BoardMaterialTableTableOrderingComposer,
    $$BoardMaterialTableTableCreateCompanionBuilder,
    $$BoardMaterialTableTableUpdateCompanionBuilder> {
  $$BoardMaterialTableTableTableManager(
      _$AppDatabase db, $BoardMaterialTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardMaterialTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$BoardMaterialTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardMaterialTableCompanion(
            uuid: uuid,
            typeIndex: typeIndex,
            path: path,
            boardUuid: boardUuid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required int typeIndex,
            required String path,
            required String boardUuid,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardMaterialTableCompanion.insert(
            uuid: uuid,
            typeIndex: typeIndex,
            path: path,
            boardUuid: boardUuid,
            rowid: rowid,
          ),
        ));
}

class $$BoardMaterialTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardMaterialTableTable> {
  $$BoardMaterialTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardMaterialTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardMaterialTableTable> {
  $$BoardMaterialTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardGameTableTableCreateCompanionBuilder = BoardGameTableCompanion
    Function({
  required String uuid,
  required String boardUuid,
  required DateTime startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});
typedef $$BoardGameTableTableUpdateCompanionBuilder = BoardGameTableCompanion
    Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<DateTime> startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});

class $$BoardGameTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardGameTableTable,
    BoardGameTableData,
    $$BoardGameTableTableFilterComposer,
    $$BoardGameTableTableOrderingComposer,
    $$BoardGameTableTableCreateCompanionBuilder,
    $$BoardGameTableTableUpdateCompanionBuilder> {
  $$BoardGameTableTableTableManager(
      _$AppDatabase db, $BoardGameTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardGameTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardGameTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardGameTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            required DateTime startedAt,
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardGameTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardGameTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardGameTableTable> {
  $$BoardGameTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endAt => $state.composableBuilder(
      column: $state.table.endAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardGameTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardGameTableTable> {
  $$BoardGameTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endAt => $state.composableBuilder(
      column: $state.table.endAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardGamePauseTableTableCreateCompanionBuilder
    = BoardGamePauseTableCompanion Function({
  required String uuid,
  required String boardGameUuid,
  required DateTime startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});
typedef $$BoardGamePauseTableTableUpdateCompanionBuilder
    = BoardGamePauseTableCompanion Function({
  Value<String> uuid,
  Value<String> boardGameUuid,
  Value<DateTime> startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});

class $$BoardGamePauseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardGamePauseTableTable,
    BoardGamePauseTableData,
    $$BoardGamePauseTableTableFilterComposer,
    $$BoardGamePauseTableTableOrderingComposer,
    $$BoardGamePauseTableTableCreateCompanionBuilder,
    $$BoardGamePauseTableTableUpdateCompanionBuilder> {
  $$BoardGamePauseTableTableTableManager(
      _$AppDatabase db, $BoardGamePauseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$BoardGamePauseTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BoardGamePauseTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardGameUuid = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardGamePauseTableCompanion(
            uuid: uuid,
            boardGameUuid: boardGameUuid,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardGameUuid,
            required DateTime startedAt,
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardGamePauseTableCompanion.insert(
            uuid: uuid,
            boardGameUuid: boardGameUuid,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardGamePauseTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardGamePauseTableTable> {
  $$BoardGamePauseTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardGameUuid => $state.composableBuilder(
      column: $state.table.boardGameUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endAt => $state.composableBuilder(
      column: $state.table.endAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardGamePauseTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardGamePauseTableTable> {
  $$BoardGamePauseTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardGameUuid => $state.composableBuilder(
      column: $state.table.boardGameUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startedAt => $state.composableBuilder(
      column: $state.table.startedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endAt => $state.composableBuilder(
      column: $state.table.endAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardLinkTableTableCreateCompanionBuilder = BoardLinkTableCompanion
    Function({
  required String uuid,
  required int typeIndex,
  required String link,
  required String boardUuid,
  required String title,
  Value<int> rowid,
});
typedef $$BoardLinkTableTableUpdateCompanionBuilder = BoardLinkTableCompanion
    Function({
  Value<String> uuid,
  Value<int> typeIndex,
  Value<String> link,
  Value<String> boardUuid,
  Value<String> title,
  Value<int> rowid,
});

class $$BoardLinkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardLinkTableTable,
    BoardLinkTableData,
    $$BoardLinkTableTableFilterComposer,
    $$BoardLinkTableTableOrderingComposer,
    $$BoardLinkTableTableCreateCompanionBuilder,
    $$BoardLinkTableTableUpdateCompanionBuilder> {
  $$BoardLinkTableTableTableManager(
      _$AppDatabase db, $BoardLinkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardLinkTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardLinkTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<String> link = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardLinkTableCompanion(
            uuid: uuid,
            typeIndex: typeIndex,
            link: link,
            boardUuid: boardUuid,
            title: title,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required int typeIndex,
            required String link,
            required String boardUuid,
            required String title,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardLinkTableCompanion.insert(
            uuid: uuid,
            typeIndex: typeIndex,
            link: link,
            boardUuid: boardUuid,
            title: title,
            rowid: rowid,
          ),
        ));
}

class $$BoardLinkTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardLinkTableTable> {
  $$BoardLinkTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardLinkTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardLinkTableTable> {
  $$BoardLinkTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
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
  $$BoardTableTableTableManager get boardTable =>
      $$BoardTableTableTableManager(_db, _db.boardTable);
  $$BoardMaterialTableTableTableManager get boardMaterialTable =>
      $$BoardMaterialTableTableTableManager(_db, _db.boardMaterialTable);
  $$BoardGameTableTableTableManager get boardGameTable =>
      $$BoardGameTableTableTableManager(_db, _db.boardGameTable);
  $$BoardGamePauseTableTableTableManager get boardGamePauseTable =>
      $$BoardGamePauseTableTableTableManager(_db, _db.boardGamePauseTable);
  $$BoardLinkTableTableTableManager get boardLinkTable =>
      $$BoardLinkTableTableTableManager(_db, _db.boardLinkTable);
}
