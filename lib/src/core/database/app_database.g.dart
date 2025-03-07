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
      [uuid, name, desc, iconAsset, createdAt, updatedAt];
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
  final DateTime createdAt;
  final DateTime updatedAt;
  const GrimoireTableData(
      {required this.uuid,
      required this.name,
      this.desc,
      required this.iconAsset,
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GrimoireTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> desc = const Value.absent(),
          String? iconAsset,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GrimoireTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        desc: desc.present ? desc.value : this.desc,
        iconAsset: iconAsset ?? this.iconAsset,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GrimoireTableData copyWithCompanion(GrimoireTableCompanion data) {
    return GrimoireTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      iconAsset: data.iconAsset.present ? data.iconAsset.value : this.iconAsset,
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
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, name, desc, iconAsset, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrimoireTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.iconAsset == this.iconAsset &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GrimoireTableCompanion extends UpdateCompanion<GrimoireTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> desc;
  final Value<String> iconAsset;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GrimoireTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.iconAsset = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GrimoireTableCompanion.insert({
    required String uuid,
    required String name,
    this.desc = const Value.absent(),
    required String iconAsset,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        iconAsset = Value(iconAsset),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GrimoireTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? iconAsset,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (iconAsset != null) 'icon_asset': iconAsset,
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
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return GrimoireTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      iconAsset: iconAsset ?? this.iconAsset,
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
  static const VerificationMeta _modeIndexMeta =
      const VerificationMeta('modeIndex');
  @override
  late final GeneratedColumn<int> modeIndex = GeneratedColumn<int>(
      'mode_index', aliasedName, false,
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
  static const VerificationMeta _isFavoritedMeta =
      const VerificationMeta('isFavorited');
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
      'is_favorited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorited" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        level,
        modeIndex,
        adventureName,
        bannerPath,
        desc,
        createdAt,
        updatedAt,
        whatsGroupLink,
        telegramGroupLink,
        discordServerLink,
        driveFilesLink,
        isFavorited
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
    if (data.containsKey('mode_index')) {
      context.handle(_modeIndexMeta,
          modeIndex.isAcceptableOrUnknown(data['mode_index']!, _modeIndexMeta));
    } else if (isInserting) {
      context.missing(_modeIndexMeta);
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
    if (data.containsKey('is_favorited')) {
      context.handle(
          _isFavoritedMeta,
          isFavorited.isAcceptableOrUnknown(
              data['is_favorited']!, _isFavoritedMeta));
    } else if (isInserting) {
      context.missing(_isFavoritedMeta);
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
      modeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mode_index'])!,
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
      isFavorited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorited'])!,
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
  final int modeIndex;
  final String adventureName;
  final String? bannerPath;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? whatsGroupLink;
  final String? telegramGroupLink;
  final String? discordServerLink;
  final String? driveFilesLink;
  final bool isFavorited;
  const BoardTableData(
      {required this.uuid,
      required this.name,
      required this.level,
      required this.modeIndex,
      required this.adventureName,
      this.bannerPath,
      this.desc,
      required this.createdAt,
      required this.updatedAt,
      this.whatsGroupLink,
      this.telegramGroupLink,
      this.discordServerLink,
      this.driveFilesLink,
      required this.isFavorited});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['mode_index'] = Variable<int>(modeIndex);
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
    map['is_favorited'] = Variable<bool>(isFavorited);
    return map;
  }

  BoardTableCompanion toCompanion(bool nullToAbsent) {
    return BoardTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      level: Value(level),
      modeIndex: Value(modeIndex),
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
      isFavorited: Value(isFavorited),
    );
  }

  factory BoardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      modeIndex: serializer.fromJson<int>(json['modeIndex']),
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
      isFavorited: serializer.fromJson<bool>(json['isFavorited']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'modeIndex': serializer.toJson<int>(modeIndex),
      'adventureName': serializer.toJson<String>(adventureName),
      'bannerPath': serializer.toJson<String?>(bannerPath),
      'desc': serializer.toJson<String?>(desc),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'whatsGroupLink': serializer.toJson<String?>(whatsGroupLink),
      'telegramGroupLink': serializer.toJson<String?>(telegramGroupLink),
      'discordServerLink': serializer.toJson<String?>(discordServerLink),
      'driveFilesLink': serializer.toJson<String?>(driveFilesLink),
      'isFavorited': serializer.toJson<bool>(isFavorited),
    };
  }

  BoardTableData copyWith(
          {String? uuid,
          String? name,
          int? level,
          int? modeIndex,
          String? adventureName,
          Value<String?> bannerPath = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<String?> whatsGroupLink = const Value.absent(),
          Value<String?> telegramGroupLink = const Value.absent(),
          Value<String?> discordServerLink = const Value.absent(),
          Value<String?> driveFilesLink = const Value.absent(),
          bool? isFavorited}) =>
      BoardTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        level: level ?? this.level,
        modeIndex: modeIndex ?? this.modeIndex,
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
        isFavorited: isFavorited ?? this.isFavorited,
      );
  BoardTableData copyWithCompanion(BoardTableCompanion data) {
    return BoardTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      modeIndex: data.modeIndex.present ? data.modeIndex.value : this.modeIndex,
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
      isFavorited:
          data.isFavorited.present ? data.isFavorited.value : this.isFavorited,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('modeIndex: $modeIndex, ')
          ..write('adventureName: $adventureName, ')
          ..write('bannerPath: $bannerPath, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('whatsGroupLink: $whatsGroupLink, ')
          ..write('telegramGroupLink: $telegramGroupLink, ')
          ..write('discordServerLink: $discordServerLink, ')
          ..write('driveFilesLink: $driveFilesLink, ')
          ..write('isFavorited: $isFavorited')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      level,
      modeIndex,
      adventureName,
      bannerPath,
      desc,
      createdAt,
      updatedAt,
      whatsGroupLink,
      telegramGroupLink,
      discordServerLink,
      driveFilesLink,
      isFavorited);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.level == this.level &&
          other.modeIndex == this.modeIndex &&
          other.adventureName == this.adventureName &&
          other.bannerPath == this.bannerPath &&
          other.desc == this.desc &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.whatsGroupLink == this.whatsGroupLink &&
          other.telegramGroupLink == this.telegramGroupLink &&
          other.discordServerLink == this.discordServerLink &&
          other.driveFilesLink == this.driveFilesLink &&
          other.isFavorited == this.isFavorited);
}

class BoardTableCompanion extends UpdateCompanion<BoardTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<int> level;
  final Value<int> modeIndex;
  final Value<String> adventureName;
  final Value<String?> bannerPath;
  final Value<String?> desc;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> whatsGroupLink;
  final Value<String?> telegramGroupLink;
  final Value<String?> discordServerLink;
  final Value<String?> driveFilesLink;
  final Value<bool> isFavorited;
  final Value<int> rowid;
  const BoardTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.modeIndex = const Value.absent(),
    this.adventureName = const Value.absent(),
    this.bannerPath = const Value.absent(),
    this.desc = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.whatsGroupLink = const Value.absent(),
    this.telegramGroupLink = const Value.absent(),
    this.discordServerLink = const Value.absent(),
    this.driveFilesLink = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardTableCompanion.insert({
    required String uuid,
    required String name,
    required int level,
    required int modeIndex,
    required String adventureName,
    this.bannerPath = const Value.absent(),
    this.desc = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.whatsGroupLink = const Value.absent(),
    this.telegramGroupLink = const Value.absent(),
    this.discordServerLink = const Value.absent(),
    this.driveFilesLink = const Value.absent(),
    required bool isFavorited,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        level = Value(level),
        modeIndex = Value(modeIndex),
        adventureName = Value(adventureName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        isFavorited = Value(isFavorited);
  static Insertable<BoardTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? modeIndex,
    Expression<String>? adventureName,
    Expression<String>? bannerPath,
    Expression<String>? desc,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? whatsGroupLink,
    Expression<String>? telegramGroupLink,
    Expression<String>? discordServerLink,
    Expression<String>? driveFilesLink,
    Expression<bool>? isFavorited,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (modeIndex != null) 'mode_index': modeIndex,
      if (adventureName != null) 'adventure_name': adventureName,
      if (bannerPath != null) 'banner_path': bannerPath,
      if (desc != null) 'desc': desc,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (whatsGroupLink != null) 'whats_group_link': whatsGroupLink,
      if (telegramGroupLink != null) 'telegram_group_link': telegramGroupLink,
      if (discordServerLink != null) 'discord_server_link': discordServerLink,
      if (driveFilesLink != null) 'drive_files_link': driveFilesLink,
      if (isFavorited != null) 'is_favorited': isFavorited,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<int>? level,
      Value<int>? modeIndex,
      Value<String>? adventureName,
      Value<String?>? bannerPath,
      Value<String?>? desc,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String?>? whatsGroupLink,
      Value<String?>? telegramGroupLink,
      Value<String?>? discordServerLink,
      Value<String?>? driveFilesLink,
      Value<bool>? isFavorited,
      Value<int>? rowid}) {
    return BoardTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      level: level ?? this.level,
      modeIndex: modeIndex ?? this.modeIndex,
      adventureName: adventureName ?? this.adventureName,
      bannerPath: bannerPath ?? this.bannerPath,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      whatsGroupLink: whatsGroupLink ?? this.whatsGroupLink,
      telegramGroupLink: telegramGroupLink ?? this.telegramGroupLink,
      discordServerLink: discordServerLink ?? this.discordServerLink,
      driveFilesLink: driveFilesLink ?? this.driveFilesLink,
      isFavorited: isFavorited ?? this.isFavorited,
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
    if (modeIndex.present) {
      map['mode_index'] = Variable<int>(modeIndex.value);
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
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
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
          ..write('modeIndex: $modeIndex, ')
          ..write('adventureName: $adventureName, ')
          ..write('bannerPath: $bannerPath, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('whatsGroupLink: $whatsGroupLink, ')
          ..write('telegramGroupLink: $telegramGroupLink, ')
          ..write('discordServerLink: $discordServerLink, ')
          ..write('driveFilesLink: $driveFilesLink, ')
          ..write('isFavorited: $isFavorited, ')
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

class $BoardSessionTableTable extends BoardSessionTable
    with TableInfo<$BoardSessionTableTable, BoardSessionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardSessionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _environmentIndexMeta =
      const VerificationMeta('environmentIndex');
  @override
  late final GeneratedColumn<int> environmentIndex = GeneratedColumn<int>(
      'environment_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
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
  List<GeneratedColumn> get $columns =>
      [uuid, boardUuid, environmentIndex, startedAt, endAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_session_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardSessionTableData> instance,
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
    if (data.containsKey('environment_index')) {
      context.handle(
          _environmentIndexMeta,
          environmentIndex.isAcceptableOrUnknown(
              data['environment_index']!, _environmentIndexMeta));
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
  BoardSessionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardSessionTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      environmentIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}environment_index']),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_at']),
    );
  }

  @override
  $BoardSessionTableTable createAlias(String alias) {
    return $BoardSessionTableTable(attachedDatabase, alias);
  }
}

class BoardSessionTableData extends DataClass
    implements Insertable<BoardSessionTableData> {
  final String uuid;
  final String boardUuid;
  final int? environmentIndex;
  final DateTime startedAt;
  final DateTime? endAt;
  const BoardSessionTableData(
      {required this.uuid,
      required this.boardUuid,
      this.environmentIndex,
      required this.startedAt,
      this.endAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    if (!nullToAbsent || environmentIndex != null) {
      map['environment_index'] = Variable<int>(environmentIndex);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  BoardSessionTableCompanion toCompanion(bool nullToAbsent) {
    return BoardSessionTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      environmentIndex: environmentIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(environmentIndex),
      startedAt: Value(startedAt),
      endAt:
          endAt == null && nullToAbsent ? const Value.absent() : Value(endAt),
    );
  }

  factory BoardSessionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardSessionTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      environmentIndex: serializer.fromJson<int?>(json['environmentIndex']),
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
      'environmentIndex': serializer.toJson<int?>(environmentIndex),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  BoardSessionTableData copyWith(
          {String? uuid,
          String? boardUuid,
          Value<int?> environmentIndex = const Value.absent(),
          DateTime? startedAt,
          Value<DateTime?> endAt = const Value.absent()}) =>
      BoardSessionTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        environmentIndex: environmentIndex.present
            ? environmentIndex.value
            : this.environmentIndex,
        startedAt: startedAt ?? this.startedAt,
        endAt: endAt.present ? endAt.value : this.endAt,
      );
  BoardSessionTableData copyWithCompanion(BoardSessionTableCompanion data) {
    return BoardSessionTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      environmentIndex: data.environmentIndex.present
          ? data.environmentIndex.value
          : this.environmentIndex,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardSessionTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('environmentIndex: $environmentIndex, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, boardUuid, environmentIndex, startedAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardSessionTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.environmentIndex == this.environmentIndex &&
          other.startedAt == this.startedAt &&
          other.endAt == this.endAt);
}

class BoardSessionTableCompanion
    extends UpdateCompanion<BoardSessionTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<int?> environmentIndex;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endAt;
  final Value<int> rowid;
  const BoardSessionTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.environmentIndex = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardSessionTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    this.environmentIndex = const Value.absent(),
    required DateTime startedAt,
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        startedAt = Value(startedAt);
  static Insertable<BoardSessionTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<int>? environmentIndex,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (environmentIndex != null) 'environment_index': environmentIndex,
      if (startedAt != null) 'started_at': startedAt,
      if (endAt != null) 'end_at': endAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardSessionTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<int?>? environmentIndex,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endAt,
      Value<int>? rowid}) {
    return BoardSessionTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      environmentIndex: environmentIndex ?? this.environmentIndex,
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
    if (environmentIndex.present) {
      map['environment_index'] = Variable<int>(environmentIndex.value);
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
    return (StringBuffer('BoardSessionTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('environmentIndex: $environmentIndex, ')
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
  List<GeneratedColumn> get $columns => [uuid, link, boardUuid, title];
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
  final String link;
  final String boardUuid;
  final String title;
  const BoardLinkTableData(
      {required this.uuid,
      required this.link,
      required this.boardUuid,
      required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['link'] = Variable<String>(link);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['title'] = Variable<String>(title);
    return map;
  }

  BoardLinkTableCompanion toCompanion(bool nullToAbsent) {
    return BoardLinkTableCompanion(
      uuid: Value(uuid),
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
      'link': serializer.toJson<String>(link),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'title': serializer.toJson<String>(title),
    };
  }

  BoardLinkTableData copyWith(
          {String? uuid, String? link, String? boardUuid, String? title}) =>
      BoardLinkTableData(
        uuid: uuid ?? this.uuid,
        link: link ?? this.link,
        boardUuid: boardUuid ?? this.boardUuid,
        title: title ?? this.title,
      );
  BoardLinkTableData copyWithCompanion(BoardLinkTableCompanion data) {
    return BoardLinkTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      link: data.link.present ? data.link.value : this.link,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardLinkTableData(')
          ..write('uuid: $uuid, ')
          ..write('link: $link, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, link, boardUuid, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardLinkTableData &&
          other.uuid == this.uuid &&
          other.link == this.link &&
          other.boardUuid == this.boardUuid &&
          other.title == this.title);
}

class BoardLinkTableCompanion extends UpdateCompanion<BoardLinkTableData> {
  final Value<String> uuid;
  final Value<String> link;
  final Value<String> boardUuid;
  final Value<String> title;
  final Value<int> rowid;
  const BoardLinkTableCompanion({
    this.uuid = const Value.absent(),
    this.link = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardLinkTableCompanion.insert({
    required String uuid,
    required String link,
    required String boardUuid,
    required String title,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        link = Value(link),
        boardUuid = Value(boardUuid),
        title = Value(title);
  static Insertable<BoardLinkTableData> custom({
    Expression<String>? uuid,
    Expression<String>? link,
    Expression<String>? boardUuid,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (link != null) 'link': link,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardLinkTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? link,
      Value<String>? boardUuid,
      Value<String>? title,
      Value<int>? rowid}) {
    return BoardLinkTableCompanion(
      uuid: uuid ?? this.uuid,
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
          ..write('link: $link, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardPlayerTableTable extends BoardPlayerTable
    with TableInfo<$BoardPlayerTableTable, BoardPlayerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardPlayerTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _characterNameMeta =
      const VerificationMeta('characterName');
  @override
  late final GeneratedColumn<String> characterName = GeneratedColumn<String>(
      'character_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playerNameMeta =
      const VerificationMeta('playerName');
  @override
  late final GeneratedColumn<String> playerName = GeneratedColumn<String>(
      'player_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageAssetMeta =
      const VerificationMeta('imageAsset');
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
      'image_asset', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _broodIndexMeta =
      const VerificationMeta('broodIndex');
  @override
  late final GeneratedColumn<int> broodIndex = GeneratedColumn<int>(
      'brood_index', aliasedName, false,
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
  static const VerificationMeta _lifeMeta = const VerificationMeta('life');
  @override
  late final GeneratedColumn<int> life = GeneratedColumn<int>(
      'life', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _manaMeta = const VerificationMeta('mana');
  @override
  late final GeneratedColumn<int> mana = GeneratedColumn<int>(
      'mana', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseMeta =
      const VerificationMeta('defense');
  @override
  late final GeneratedColumn<int> defense = GeneratedColumn<int>(
      'defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _initiativeMeta =
      const VerificationMeta('initiative');
  @override
  late final GeneratedColumn<int> initiative = GeneratedColumn<int>(
      'initiative', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isAliveMeta =
      const VerificationMeta('isAlive');
  @override
  late final GeneratedColumn<bool> isAlive = GeneratedColumn<bool>(
      'is_alive', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_alive" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        boardUuid,
        characterName,
        playerName,
        imagePath,
        imageAsset,
        broodIndex,
        createdAt,
        updatedAt,
        life,
        mana,
        defense,
        initiative,
        isAlive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_player_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardPlayerTableData> instance,
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
    if (data.containsKey('character_name')) {
      context.handle(
          _characterNameMeta,
          characterName.isAcceptableOrUnknown(
              data['character_name']!, _characterNameMeta));
    } else if (isInserting) {
      context.missing(_characterNameMeta);
    }
    if (data.containsKey('player_name')) {
      context.handle(
          _playerNameMeta,
          playerName.isAcceptableOrUnknown(
              data['player_name']!, _playerNameMeta));
    } else if (isInserting) {
      context.missing(_playerNameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('image_asset')) {
      context.handle(
          _imageAssetMeta,
          imageAsset.isAcceptableOrUnknown(
              data['image_asset']!, _imageAssetMeta));
    }
    if (data.containsKey('brood_index')) {
      context.handle(
          _broodIndexMeta,
          broodIndex.isAcceptableOrUnknown(
              data['brood_index']!, _broodIndexMeta));
    } else if (isInserting) {
      context.missing(_broodIndexMeta);
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
    if (data.containsKey('life')) {
      context.handle(
          _lifeMeta, life.isAcceptableOrUnknown(data['life']!, _lifeMeta));
    } else if (isInserting) {
      context.missing(_lifeMeta);
    }
    if (data.containsKey('mana')) {
      context.handle(
          _manaMeta, mana.isAcceptableOrUnknown(data['mana']!, _manaMeta));
    } else if (isInserting) {
      context.missing(_manaMeta);
    }
    if (data.containsKey('defense')) {
      context.handle(_defenseMeta,
          defense.isAcceptableOrUnknown(data['defense']!, _defenseMeta));
    } else if (isInserting) {
      context.missing(_defenseMeta);
    }
    if (data.containsKey('initiative')) {
      context.handle(
          _initiativeMeta,
          initiative.isAcceptableOrUnknown(
              data['initiative']!, _initiativeMeta));
    } else if (isInserting) {
      context.missing(_initiativeMeta);
    }
    if (data.containsKey('is_alive')) {
      context.handle(_isAliveMeta,
          isAlive.isAcceptableOrUnknown(data['is_alive']!, _isAliveMeta));
    } else if (isInserting) {
      context.missing(_isAliveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardPlayerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardPlayerTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      characterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_name'])!,
      playerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      imageAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_asset']),
      broodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brood_index'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      life: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}life'])!,
      mana: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mana'])!,
      defense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense'])!,
      initiative: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initiative'])!,
      isAlive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_alive'])!,
    );
  }

  @override
  $BoardPlayerTableTable createAlias(String alias) {
    return $BoardPlayerTableTable(attachedDatabase, alias);
  }
}

class BoardPlayerTableData extends DataClass
    implements Insertable<BoardPlayerTableData> {
  final String uuid;
  final String boardUuid;
  final String characterName;
  final String playerName;
  final String? imagePath;
  final String? imageAsset;
  final int broodIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int life;
  final int mana;
  final int defense;
  final int initiative;
  final bool isAlive;
  const BoardPlayerTableData(
      {required this.uuid,
      required this.boardUuid,
      required this.characterName,
      required this.playerName,
      this.imagePath,
      this.imageAsset,
      required this.broodIndex,
      required this.createdAt,
      required this.updatedAt,
      required this.life,
      required this.mana,
      required this.defense,
      required this.initiative,
      required this.isAlive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['character_name'] = Variable<String>(characterName);
    map['player_name'] = Variable<String>(playerName);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    map['brood_index'] = Variable<int>(broodIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['life'] = Variable<int>(life);
    map['mana'] = Variable<int>(mana);
    map['defense'] = Variable<int>(defense);
    map['initiative'] = Variable<int>(initiative);
    map['is_alive'] = Variable<bool>(isAlive);
    return map;
  }

  BoardPlayerTableCompanion toCompanion(bool nullToAbsent) {
    return BoardPlayerTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      characterName: Value(characterName),
      playerName: Value(playerName),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      broodIndex: Value(broodIndex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      life: Value(life),
      mana: Value(mana),
      defense: Value(defense),
      initiative: Value(initiative),
      isAlive: Value(isAlive),
    );
  }

  factory BoardPlayerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardPlayerTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      characterName: serializer.fromJson<String>(json['characterName']),
      playerName: serializer.fromJson<String>(json['playerName']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      broodIndex: serializer.fromJson<int>(json['broodIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      life: serializer.fromJson<int>(json['life']),
      mana: serializer.fromJson<int>(json['mana']),
      defense: serializer.fromJson<int>(json['defense']),
      initiative: serializer.fromJson<int>(json['initiative']),
      isAlive: serializer.fromJson<bool>(json['isAlive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'characterName': serializer.toJson<String>(characterName),
      'playerName': serializer.toJson<String>(playerName),
      'imagePath': serializer.toJson<String?>(imagePath),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'broodIndex': serializer.toJson<int>(broodIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'life': serializer.toJson<int>(life),
      'mana': serializer.toJson<int>(mana),
      'defense': serializer.toJson<int>(defense),
      'initiative': serializer.toJson<int>(initiative),
      'isAlive': serializer.toJson<bool>(isAlive),
    };
  }

  BoardPlayerTableData copyWith(
          {String? uuid,
          String? boardUuid,
          String? characterName,
          String? playerName,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> imageAsset = const Value.absent(),
          int? broodIndex,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? life,
          int? mana,
          int? defense,
          int? initiative,
          bool? isAlive}) =>
      BoardPlayerTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        characterName: characterName ?? this.characterName,
        playerName: playerName ?? this.playerName,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
        broodIndex: broodIndex ?? this.broodIndex,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        life: life ?? this.life,
        mana: mana ?? this.mana,
        defense: defense ?? this.defense,
        initiative: initiative ?? this.initiative,
        isAlive: isAlive ?? this.isAlive,
      );
  BoardPlayerTableData copyWithCompanion(BoardPlayerTableCompanion data) {
    return BoardPlayerTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      characterName: data.characterName.present
          ? data.characterName.value
          : this.characterName,
      playerName:
          data.playerName.present ? data.playerName.value : this.playerName,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageAsset:
          data.imageAsset.present ? data.imageAsset.value : this.imageAsset,
      broodIndex:
          data.broodIndex.present ? data.broodIndex.value : this.broodIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      life: data.life.present ? data.life.value : this.life,
      mana: data.mana.present ? data.mana.value : this.mana,
      defense: data.defense.present ? data.defense.value : this.defense,
      initiative:
          data.initiative.present ? data.initiative.value : this.initiative,
      isAlive: data.isAlive.present ? data.isAlive.value : this.isAlive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardPlayerTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('characterName: $characterName, ')
          ..write('playerName: $playerName, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('defense: $defense, ')
          ..write('initiative: $initiative, ')
          ..write('isAlive: $isAlive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      boardUuid,
      characterName,
      playerName,
      imagePath,
      imageAsset,
      broodIndex,
      createdAt,
      updatedAt,
      life,
      mana,
      defense,
      initiative,
      isAlive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardPlayerTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.characterName == this.characterName &&
          other.playerName == this.playerName &&
          other.imagePath == this.imagePath &&
          other.imageAsset == this.imageAsset &&
          other.broodIndex == this.broodIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.life == this.life &&
          other.mana == this.mana &&
          other.defense == this.defense &&
          other.initiative == this.initiative &&
          other.isAlive == this.isAlive);
}

class BoardPlayerTableCompanion extends UpdateCompanion<BoardPlayerTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<String> characterName;
  final Value<String> playerName;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<int> broodIndex;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> life;
  final Value<int> mana;
  final Value<int> defense;
  final Value<int> initiative;
  final Value<bool> isAlive;
  final Value<int> rowid;
  const BoardPlayerTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.characterName = const Value.absent(),
    this.playerName = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.broodIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.life = const Value.absent(),
    this.mana = const Value.absent(),
    this.defense = const Value.absent(),
    this.initiative = const Value.absent(),
    this.isAlive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardPlayerTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    required String characterName,
    required String playerName,
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    required int broodIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int life,
    required int mana,
    required int defense,
    required int initiative,
    required bool isAlive,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        characterName = Value(characterName),
        playerName = Value(playerName),
        broodIndex = Value(broodIndex),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        life = Value(life),
        mana = Value(mana),
        defense = Value(defense),
        initiative = Value(initiative),
        isAlive = Value(isAlive);
  static Insertable<BoardPlayerTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<String>? characterName,
    Expression<String>? playerName,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<int>? broodIndex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? life,
    Expression<int>? mana,
    Expression<int>? defense,
    Expression<int>? initiative,
    Expression<bool>? isAlive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (characterName != null) 'character_name': characterName,
      if (playerName != null) 'player_name': playerName,
      if (imagePath != null) 'image_path': imagePath,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (broodIndex != null) 'brood_index': broodIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (life != null) 'life': life,
      if (mana != null) 'mana': mana,
      if (defense != null) 'defense': defense,
      if (initiative != null) 'initiative': initiative,
      if (isAlive != null) 'is_alive': isAlive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardPlayerTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<String>? characterName,
      Value<String>? playerName,
      Value<String?>? imagePath,
      Value<String?>? imageAsset,
      Value<int>? broodIndex,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? life,
      Value<int>? mana,
      Value<int>? defense,
      Value<int>? initiative,
      Value<bool>? isAlive,
      Value<int>? rowid}) {
    return BoardPlayerTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      characterName: characterName ?? this.characterName,
      playerName: playerName ?? this.playerName,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      broodIndex: broodIndex ?? this.broodIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      life: life ?? this.life,
      mana: mana ?? this.mana,
      defense: defense ?? this.defense,
      initiative: initiative ?? this.initiative,
      isAlive: isAlive ?? this.isAlive,
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
    if (characterName.present) {
      map['character_name'] = Variable<String>(characterName.value);
    }
    if (playerName.present) {
      map['player_name'] = Variable<String>(playerName.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (broodIndex.present) {
      map['brood_index'] = Variable<int>(broodIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (mana.present) {
      map['mana'] = Variable<int>(mana.value);
    }
    if (defense.present) {
      map['defense'] = Variable<int>(defense.value);
    }
    if (initiative.present) {
      map['initiative'] = Variable<int>(initiative.value);
    }
    if (isAlive.present) {
      map['is_alive'] = Variable<bool>(isAlive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardPlayerTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('characterName: $characterName, ')
          ..write('playerName: $playerName, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('defense: $defense, ')
          ..write('initiative: $initiative, ')
          ..write('isAlive: $isAlive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardCharacterTableTable extends BoardCharacterTable
    with TableInfo<$BoardCharacterTableTable, BoardCharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardCharacterTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _characterNameMeta =
      const VerificationMeta('characterName');
  @override
  late final GeneratedColumn<String> characterName = GeneratedColumn<String>(
      'character_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playerNameMeta =
      const VerificationMeta('playerName');
  @override
  late final GeneratedColumn<String> playerName = GeneratedColumn<String>(
      'player_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageAssetMeta =
      const VerificationMeta('imageAsset');
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
      'image_asset', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _broodIndexMeta =
      const VerificationMeta('broodIndex');
  @override
  late final GeneratedColumn<int> broodIndex = GeneratedColumn<int>(
      'brood_index', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [
        uuid,
        boardUuid,
        characterName,
        playerName,
        imagePath,
        imageAsset,
        broodIndex,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_character_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardCharacterTableData> instance,
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
    if (data.containsKey('character_name')) {
      context.handle(
          _characterNameMeta,
          characterName.isAcceptableOrUnknown(
              data['character_name']!, _characterNameMeta));
    } else if (isInserting) {
      context.missing(_characterNameMeta);
    }
    if (data.containsKey('player_name')) {
      context.handle(
          _playerNameMeta,
          playerName.isAcceptableOrUnknown(
              data['player_name']!, _playerNameMeta));
    } else if (isInserting) {
      context.missing(_playerNameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('image_asset')) {
      context.handle(
          _imageAssetMeta,
          imageAsset.isAcceptableOrUnknown(
              data['image_asset']!, _imageAssetMeta));
    }
    if (data.containsKey('brood_index')) {
      context.handle(
          _broodIndexMeta,
          broodIndex.isAcceptableOrUnknown(
              data['brood_index']!, _broodIndexMeta));
    } else if (isInserting) {
      context.missing(_broodIndexMeta);
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
  BoardCharacterTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardCharacterTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      characterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_name'])!,
      playerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      imageAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_asset']),
      broodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brood_index'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BoardCharacterTableTable createAlias(String alias) {
    return $BoardCharacterTableTable(attachedDatabase, alias);
  }
}

class BoardCharacterTableData extends DataClass
    implements Insertable<BoardCharacterTableData> {
  final String uuid;
  final String boardUuid;
  final String characterName;
  final String playerName;
  final String? imagePath;
  final String? imageAsset;
  final int broodIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BoardCharacterTableData(
      {required this.uuid,
      required this.boardUuid,
      required this.characterName,
      required this.playerName,
      this.imagePath,
      this.imageAsset,
      required this.broodIndex,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['character_name'] = Variable<String>(characterName);
    map['player_name'] = Variable<String>(playerName);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    map['brood_index'] = Variable<int>(broodIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BoardCharacterTableCompanion toCompanion(bool nullToAbsent) {
    return BoardCharacterTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      characterName: Value(characterName),
      playerName: Value(playerName),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      broodIndex: Value(broodIndex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BoardCharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardCharacterTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      characterName: serializer.fromJson<String>(json['characterName']),
      playerName: serializer.fromJson<String>(json['playerName']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      broodIndex: serializer.fromJson<int>(json['broodIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'characterName': serializer.toJson<String>(characterName),
      'playerName': serializer.toJson<String>(playerName),
      'imagePath': serializer.toJson<String?>(imagePath),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'broodIndex': serializer.toJson<int>(broodIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BoardCharacterTableData copyWith(
          {String? uuid,
          String? boardUuid,
          String? characterName,
          String? playerName,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> imageAsset = const Value.absent(),
          int? broodIndex,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BoardCharacterTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        characterName: characterName ?? this.characterName,
        playerName: playerName ?? this.playerName,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
        broodIndex: broodIndex ?? this.broodIndex,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BoardCharacterTableData copyWithCompanion(BoardCharacterTableCompanion data) {
    return BoardCharacterTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      characterName: data.characterName.present
          ? data.characterName.value
          : this.characterName,
      playerName:
          data.playerName.present ? data.playerName.value : this.playerName,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageAsset:
          data.imageAsset.present ? data.imageAsset.value : this.imageAsset,
      broodIndex:
          data.broodIndex.present ? data.broodIndex.value : this.broodIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardCharacterTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('characterName: $characterName, ')
          ..write('playerName: $playerName, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, boardUuid, characterName, playerName,
      imagePath, imageAsset, broodIndex, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardCharacterTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.characterName == this.characterName &&
          other.playerName == this.playerName &&
          other.imagePath == this.imagePath &&
          other.imageAsset == this.imageAsset &&
          other.broodIndex == this.broodIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BoardCharacterTableCompanion
    extends UpdateCompanion<BoardCharacterTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<String> characterName;
  final Value<String> playerName;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<int> broodIndex;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BoardCharacterTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.characterName = const Value.absent(),
    this.playerName = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.broodIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardCharacterTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    required String characterName,
    required String playerName,
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    required int broodIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        characterName = Value(characterName),
        playerName = Value(playerName),
        broodIndex = Value(broodIndex),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BoardCharacterTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<String>? characterName,
    Expression<String>? playerName,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<int>? broodIndex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (characterName != null) 'character_name': characterName,
      if (playerName != null) 'player_name': playerName,
      if (imagePath != null) 'image_path': imagePath,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (broodIndex != null) 'brood_index': broodIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardCharacterTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<String>? characterName,
      Value<String>? playerName,
      Value<String?>? imagePath,
      Value<String?>? imageAsset,
      Value<int>? broodIndex,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BoardCharacterTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      characterName: characterName ?? this.characterName,
      playerName: playerName ?? this.playerName,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      broodIndex: broodIndex ?? this.broodIndex,
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
    if (boardUuid.present) {
      map['board_uuid'] = Variable<String>(boardUuid.value);
    }
    if (characterName.present) {
      map['character_name'] = Variable<String>(characterName.value);
    }
    if (playerName.present) {
      map['player_name'] = Variable<String>(playerName.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (broodIndex.present) {
      map['brood_index'] = Variable<int>(broodIndex.value);
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
    return (StringBuffer('BoardCharacterTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('characterName: $characterName, ')
          ..write('playerName: $playerName, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardNoteTableTable extends BoardNoteTable
    with TableInfo<$BoardNoteTableTable, BoardNoteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardNoteTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavoritedMeta =
      const VerificationMeta('isFavorited');
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
      'is_favorited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorited" IN (0, 1))'));
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
      [uuid, boardUuid, note, isFavorited, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_note_table';
  @override
  VerificationContext validateIntegrity(Insertable<BoardNoteTableData> instance,
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
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('is_favorited')) {
      context.handle(
          _isFavoritedMeta,
          isFavorited.isAcceptableOrUnknown(
              data['is_favorited']!, _isFavoritedMeta));
    } else if (isInserting) {
      context.missing(_isFavoritedMeta);
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
  BoardNoteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardNoteTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      isFavorited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorited'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BoardNoteTableTable createAlias(String alias) {
    return $BoardNoteTableTable(attachedDatabase, alias);
  }
}

class BoardNoteTableData extends DataClass
    implements Insertable<BoardNoteTableData> {
  final String uuid;
  final String boardUuid;
  final String note;
  final bool isFavorited;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BoardNoteTableData(
      {required this.uuid,
      required this.boardUuid,
      required this.note,
      required this.isFavorited,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['note'] = Variable<String>(note);
    map['is_favorited'] = Variable<bool>(isFavorited);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BoardNoteTableCompanion toCompanion(bool nullToAbsent) {
    return BoardNoteTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      note: Value(note),
      isFavorited: Value(isFavorited),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BoardNoteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardNoteTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      note: serializer.fromJson<String>(json['note']),
      isFavorited: serializer.fromJson<bool>(json['isFavorited']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'boardUuid': serializer.toJson<String>(boardUuid),
      'note': serializer.toJson<String>(note),
      'isFavorited': serializer.toJson<bool>(isFavorited),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BoardNoteTableData copyWith(
          {String? uuid,
          String? boardUuid,
          String? note,
          bool? isFavorited,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BoardNoteTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        note: note ?? this.note,
        isFavorited: isFavorited ?? this.isFavorited,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BoardNoteTableData copyWithCompanion(BoardNoteTableCompanion data) {
    return BoardNoteTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      note: data.note.present ? data.note.value : this.note,
      isFavorited:
          data.isFavorited.present ? data.isFavorited.value : this.isFavorited,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardNoteTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('note: $note, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, boardUuid, note, isFavorited, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardNoteTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.note == this.note &&
          other.isFavorited == this.isFavorited &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BoardNoteTableCompanion extends UpdateCompanion<BoardNoteTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<String> note;
  final Value<bool> isFavorited;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BoardNoteTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.note = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardNoteTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    required String note,
    required bool isFavorited,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        note = Value(note),
        isFavorited = Value(isFavorited),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BoardNoteTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<String>? note,
    Expression<bool>? isFavorited,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (note != null) 'note': note,
      if (isFavorited != null) 'is_favorited': isFavorited,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardNoteTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<String>? note,
      Value<bool>? isFavorited,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BoardNoteTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      note: note ?? this.note,
      isFavorited: isFavorited ?? this.isFavorited,
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
    if (boardUuid.present) {
      map['board_uuid'] = Variable<String>(boardUuid.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
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
    return (StringBuffer('BoardNoteTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('note: $note, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardCombatTableTable extends BoardCombatTable
    with TableInfo<$BoardCombatTableTable, BoardCombatTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardCombatTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sessionUuidMeta =
      const VerificationMeta('sessionUuid');
  @override
  late final GeneratedColumn<String> sessionUuid = GeneratedColumn<String>(
      'session_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _turnMeta = const VerificationMeta('turn');
  @override
  late final GeneratedColumn<int> turn = GeneratedColumn<int>(
      'turn', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns =>
      [uuid, boardUuid, sessionUuid, turn, startedAt, endAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_combat_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardCombatTableData> instance,
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
    if (data.containsKey('session_uuid')) {
      context.handle(
          _sessionUuidMeta,
          sessionUuid.isAcceptableOrUnknown(
              data['session_uuid']!, _sessionUuidMeta));
    } else if (isInserting) {
      context.missing(_sessionUuidMeta);
    }
    if (data.containsKey('turn')) {
      context.handle(
          _turnMeta, turn.isAcceptableOrUnknown(data['turn']!, _turnMeta));
    } else if (isInserting) {
      context.missing(_turnMeta);
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
  BoardCombatTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardCombatTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
      sessionUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_uuid'])!,
      turn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}turn'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_at']),
    );
  }

  @override
  $BoardCombatTableTable createAlias(String alias) {
    return $BoardCombatTableTable(attachedDatabase, alias);
  }
}

class BoardCombatTableData extends DataClass
    implements Insertable<BoardCombatTableData> {
  final String uuid;
  final String boardUuid;
  final String sessionUuid;
  final int turn;
  final DateTime startedAt;
  final DateTime? endAt;
  const BoardCombatTableData(
      {required this.uuid,
      required this.boardUuid,
      required this.sessionUuid,
      required this.turn,
      required this.startedAt,
      this.endAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    map['session_uuid'] = Variable<String>(sessionUuid);
    map['turn'] = Variable<int>(turn);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  BoardCombatTableCompanion toCompanion(bool nullToAbsent) {
    return BoardCombatTableCompanion(
      uuid: Value(uuid),
      boardUuid: Value(boardUuid),
      sessionUuid: Value(sessionUuid),
      turn: Value(turn),
      startedAt: Value(startedAt),
      endAt:
          endAt == null && nullToAbsent ? const Value.absent() : Value(endAt),
    );
  }

  factory BoardCombatTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardCombatTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
      sessionUuid: serializer.fromJson<String>(json['sessionUuid']),
      turn: serializer.fromJson<int>(json['turn']),
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
      'sessionUuid': serializer.toJson<String>(sessionUuid),
      'turn': serializer.toJson<int>(turn),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  BoardCombatTableData copyWith(
          {String? uuid,
          String? boardUuid,
          String? sessionUuid,
          int? turn,
          DateTime? startedAt,
          Value<DateTime?> endAt = const Value.absent()}) =>
      BoardCombatTableData(
        uuid: uuid ?? this.uuid,
        boardUuid: boardUuid ?? this.boardUuid,
        sessionUuid: sessionUuid ?? this.sessionUuid,
        turn: turn ?? this.turn,
        startedAt: startedAt ?? this.startedAt,
        endAt: endAt.present ? endAt.value : this.endAt,
      );
  BoardCombatTableData copyWithCompanion(BoardCombatTableCompanion data) {
    return BoardCombatTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
      sessionUuid:
          data.sessionUuid.present ? data.sessionUuid.value : this.sessionUuid,
      turn: data.turn.present ? data.turn.value : this.turn,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardCombatTableData(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('sessionUuid: $sessionUuid, ')
          ..write('turn: $turn, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, boardUuid, sessionUuid, turn, startedAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardCombatTableData &&
          other.uuid == this.uuid &&
          other.boardUuid == this.boardUuid &&
          other.sessionUuid == this.sessionUuid &&
          other.turn == this.turn &&
          other.startedAt == this.startedAt &&
          other.endAt == this.endAt);
}

class BoardCombatTableCompanion extends UpdateCompanion<BoardCombatTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<String> sessionUuid;
  final Value<int> turn;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endAt;
  final Value<int> rowid;
  const BoardCombatTableCompanion({
    this.uuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.sessionUuid = const Value.absent(),
    this.turn = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardCombatTableCompanion.insert({
    required String uuid,
    required String boardUuid,
    required String sessionUuid,
    required int turn,
    required DateTime startedAt,
    this.endAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        boardUuid = Value(boardUuid),
        sessionUuid = Value(sessionUuid),
        turn = Value(turn),
        startedAt = Value(startedAt);
  static Insertable<BoardCombatTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<String>? sessionUuid,
    Expression<int>? turn,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (sessionUuid != null) 'session_uuid': sessionUuid,
      if (turn != null) 'turn': turn,
      if (startedAt != null) 'started_at': startedAt,
      if (endAt != null) 'end_at': endAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardCombatTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? boardUuid,
      Value<String>? sessionUuid,
      Value<int>? turn,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endAt,
      Value<int>? rowid}) {
    return BoardCombatTableCompanion(
      uuid: uuid ?? this.uuid,
      boardUuid: boardUuid ?? this.boardUuid,
      sessionUuid: sessionUuid ?? this.sessionUuid,
      turn: turn ?? this.turn,
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
    if (sessionUuid.present) {
      map['session_uuid'] = Variable<String>(sessionUuid.value);
    }
    if (turn.present) {
      map['turn'] = Variable<int>(turn.value);
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
    return (StringBuffer('BoardCombatTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('sessionUuid: $sessionUuid, ')
          ..write('turn: $turn, ')
          ..write('startedAt: $startedAt, ')
          ..write('endAt: $endAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BoardClasseCharacterTableTable extends BoardClasseCharacterTable
    with
        TableInfo<$BoardClasseCharacterTableTable,
            BoardClasseCharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardClasseCharacterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playerUuidMeta =
      const VerificationMeta('playerUuid');
  @override
  late final GeneratedColumn<String> playerUuid = GeneratedColumn<String>(
      'player_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, playerUuid, typeIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_classe_character_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BoardClasseCharacterTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('player_uuid')) {
      context.handle(
          _playerUuidMeta,
          playerUuid.isAcceptableOrUnknown(
              data['player_uuid']!, _playerUuidMeta));
    } else if (isInserting) {
      context.missing(_playerUuidMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BoardClasseCharacterTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardClasseCharacterTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      playerUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_uuid'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $BoardClasseCharacterTableTable createAlias(String alias) {
    return $BoardClasseCharacterTableTable(attachedDatabase, alias);
  }
}

class BoardClasseCharacterTableData extends DataClass
    implements Insertable<BoardClasseCharacterTableData> {
  final String uuid;
  final String playerUuid;
  final int typeIndex;
  const BoardClasseCharacterTableData(
      {required this.uuid, required this.playerUuid, required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['player_uuid'] = Variable<String>(playerUuid);
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  BoardClasseCharacterTableCompanion toCompanion(bool nullToAbsent) {
    return BoardClasseCharacterTableCompanion(
      uuid: Value(uuid),
      playerUuid: Value(playerUuid),
      typeIndex: Value(typeIndex),
    );
  }

  factory BoardClasseCharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardClasseCharacterTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      playerUuid: serializer.fromJson<String>(json['playerUuid']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'playerUuid': serializer.toJson<String>(playerUuid),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  BoardClasseCharacterTableData copyWith(
          {String? uuid, String? playerUuid, int? typeIndex}) =>
      BoardClasseCharacterTableData(
        uuid: uuid ?? this.uuid,
        playerUuid: playerUuid ?? this.playerUuid,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  BoardClasseCharacterTableData copyWithCompanion(
      BoardClasseCharacterTableCompanion data) {
    return BoardClasseCharacterTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      playerUuid:
          data.playerUuid.present ? data.playerUuid.value : this.playerUuid,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardClasseCharacterTableData(')
          ..write('uuid: $uuid, ')
          ..write('playerUuid: $playerUuid, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, playerUuid, typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardClasseCharacterTableData &&
          other.uuid == this.uuid &&
          other.playerUuid == this.playerUuid &&
          other.typeIndex == this.typeIndex);
}

class BoardClasseCharacterTableCompanion
    extends UpdateCompanion<BoardClasseCharacterTableData> {
  final Value<String> uuid;
  final Value<String> playerUuid;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const BoardClasseCharacterTableCompanion({
    this.uuid = const Value.absent(),
    this.playerUuid = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BoardClasseCharacterTableCompanion.insert({
    required String uuid,
    required String playerUuid,
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        playerUuid = Value(playerUuid),
        typeIndex = Value(typeIndex);
  static Insertable<BoardClasseCharacterTableData> custom({
    Expression<String>? uuid,
    Expression<String>? playerUuid,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (playerUuid != null) 'player_uuid': playerUuid,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BoardClasseCharacterTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? playerUuid,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return BoardClasseCharacterTableCompanion(
      uuid: uuid ?? this.uuid,
      playerUuid: playerUuid ?? this.playerUuid,
      typeIndex: typeIndex ?? this.typeIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (playerUuid.present) {
      map['player_uuid'] = Variable<String>(playerUuid.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardClasseCharacterTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('playerUuid: $playerUuid, ')
          ..write('typeIndex: $typeIndex, ')
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
  late final $BoardSessionTableTable boardSessionTable =
      $BoardSessionTableTable(this);
  late final $BoardLinkTableTable boardLinkTable = $BoardLinkTableTable(this);
  late final $BoardPlayerTableTable boardPlayerTable =
      $BoardPlayerTableTable(this);
  late final $BoardCharacterTableTable boardCharacterTable =
      $BoardCharacterTableTable(this);
  late final $BoardNoteTableTable boardNoteTable = $BoardNoteTableTable(this);
  late final $BoardCombatTableTable boardCombatTable =
      $BoardCombatTableTable(this);
  late final $BoardClasseCharacterTableTable boardClasseCharacterTable =
      $BoardClasseCharacterTableTable(this);
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
        boardSessionTable,
        boardLinkTable,
        boardPlayerTable,
        boardCharacterTable,
        boardNoteTable,
        boardCombatTable,
        boardClasseCharacterTable
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
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion(
            uuid: uuid,
            name: name,
            desc: desc,
            iconAsset: iconAsset,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            Value<String?> desc = const Value.absent(),
            required String iconAsset,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              GrimoireTableCompanion.insert(
            uuid: uuid,
            name: name,
            desc: desc,
            iconAsset: iconAsset,
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
  required int modeIndex,
  required String adventureName,
  Value<String?> bannerPath,
  Value<String?> desc,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String?> whatsGroupLink,
  Value<String?> telegramGroupLink,
  Value<String?> discordServerLink,
  Value<String?> driveFilesLink,
  required bool isFavorited,
  Value<int> rowid,
});
typedef $$BoardTableTableUpdateCompanionBuilder = BoardTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<int> level,
  Value<int> modeIndex,
  Value<String> adventureName,
  Value<String?> bannerPath,
  Value<String?> desc,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String?> whatsGroupLink,
  Value<String?> telegramGroupLink,
  Value<String?> discordServerLink,
  Value<String?> driveFilesLink,
  Value<bool> isFavorited,
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
            Value<int> modeIndex = const Value.absent(),
            Value<String> adventureName = const Value.absent(),
            Value<String?> bannerPath = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String?> whatsGroupLink = const Value.absent(),
            Value<String?> telegramGroupLink = const Value.absent(),
            Value<String?> discordServerLink = const Value.absent(),
            Value<String?> driveFilesLink = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardTableCompanion(
            uuid: uuid,
            name: name,
            level: level,
            modeIndex: modeIndex,
            adventureName: adventureName,
            bannerPath: bannerPath,
            desc: desc,
            createdAt: createdAt,
            updatedAt: updatedAt,
            whatsGroupLink: whatsGroupLink,
            telegramGroupLink: telegramGroupLink,
            discordServerLink: discordServerLink,
            driveFilesLink: driveFilesLink,
            isFavorited: isFavorited,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required int level,
            required int modeIndex,
            required String adventureName,
            Value<String?> bannerPath = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String?> whatsGroupLink = const Value.absent(),
            Value<String?> telegramGroupLink = const Value.absent(),
            Value<String?> discordServerLink = const Value.absent(),
            Value<String?> driveFilesLink = const Value.absent(),
            required bool isFavorited,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardTableCompanion.insert(
            uuid: uuid,
            name: name,
            level: level,
            modeIndex: modeIndex,
            adventureName: adventureName,
            bannerPath: bannerPath,
            desc: desc,
            createdAt: createdAt,
            updatedAt: updatedAt,
            whatsGroupLink: whatsGroupLink,
            telegramGroupLink: telegramGroupLink,
            discordServerLink: discordServerLink,
            driveFilesLink: driveFilesLink,
            isFavorited: isFavorited,
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

  ColumnFilters<int> get modeIndex => $state.composableBuilder(
      column: $state.table.modeIndex,
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

  ColumnFilters<bool> get isFavorited => $state.composableBuilder(
      column: $state.table.isFavorited,
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

  ColumnOrderings<int> get modeIndex => $state.composableBuilder(
      column: $state.table.modeIndex,
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

  ColumnOrderings<bool> get isFavorited => $state.composableBuilder(
      column: $state.table.isFavorited,
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

typedef $$BoardSessionTableTableCreateCompanionBuilder
    = BoardSessionTableCompanion Function({
  required String uuid,
  required String boardUuid,
  Value<int?> environmentIndex,
  required DateTime startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});
typedef $$BoardSessionTableTableUpdateCompanionBuilder
    = BoardSessionTableCompanion Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<int?> environmentIndex,
  Value<DateTime> startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});

class $$BoardSessionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardSessionTableTable,
    BoardSessionTableData,
    $$BoardSessionTableTableFilterComposer,
    $$BoardSessionTableTableOrderingComposer,
    $$BoardSessionTableTableCreateCompanionBuilder,
    $$BoardSessionTableTableUpdateCompanionBuilder> {
  $$BoardSessionTableTableTableManager(
      _$AppDatabase db, $BoardSessionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardSessionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$BoardSessionTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<int?> environmentIndex = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardSessionTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            environmentIndex: environmentIndex,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            Value<int?> environmentIndex = const Value.absent(),
            required DateTime startedAt,
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardSessionTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            environmentIndex: environmentIndex,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardSessionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardSessionTableTable> {
  $$BoardSessionTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get environmentIndex => $state.composableBuilder(
      column: $state.table.environmentIndex,
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

class $$BoardSessionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardSessionTableTable> {
  $$BoardSessionTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get environmentIndex => $state.composableBuilder(
      column: $state.table.environmentIndex,
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
  required String link,
  required String boardUuid,
  required String title,
  Value<int> rowid,
});
typedef $$BoardLinkTableTableUpdateCompanionBuilder = BoardLinkTableCompanion
    Function({
  Value<String> uuid,
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
            Value<String> link = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardLinkTableCompanion(
            uuid: uuid,
            link: link,
            boardUuid: boardUuid,
            title: title,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String link,
            required String boardUuid,
            required String title,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardLinkTableCompanion.insert(
            uuid: uuid,
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

typedef $$BoardPlayerTableTableCreateCompanionBuilder
    = BoardPlayerTableCompanion Function({
  required String uuid,
  required String boardUuid,
  required String characterName,
  required String playerName,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  required int broodIndex,
  required DateTime createdAt,
  required DateTime updatedAt,
  required int life,
  required int mana,
  required int defense,
  required int initiative,
  required bool isAlive,
  Value<int> rowid,
});
typedef $$BoardPlayerTableTableUpdateCompanionBuilder
    = BoardPlayerTableCompanion Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<String> characterName,
  Value<String> playerName,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<int> broodIndex,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> life,
  Value<int> mana,
  Value<int> defense,
  Value<int> initiative,
  Value<bool> isAlive,
  Value<int> rowid,
});

class $$BoardPlayerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardPlayerTableTable,
    BoardPlayerTableData,
    $$BoardPlayerTableTableFilterComposer,
    $$BoardPlayerTableTableOrderingComposer,
    $$BoardPlayerTableTableCreateCompanionBuilder,
    $$BoardPlayerTableTableUpdateCompanionBuilder> {
  $$BoardPlayerTableTableTableManager(
      _$AppDatabase db, $BoardPlayerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardPlayerTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardPlayerTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> characterName = const Value.absent(),
            Value<String> playerName = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<int> broodIndex = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> life = const Value.absent(),
            Value<int> mana = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> initiative = const Value.absent(),
            Value<bool> isAlive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardPlayerTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            characterName: characterName,
            playerName: playerName,
            imagePath: imagePath,
            imageAsset: imageAsset,
            broodIndex: broodIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            life: life,
            mana: mana,
            defense: defense,
            initiative: initiative,
            isAlive: isAlive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            required String characterName,
            required String playerName,
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            required int broodIndex,
            required DateTime createdAt,
            required DateTime updatedAt,
            required int life,
            required int mana,
            required int defense,
            required int initiative,
            required bool isAlive,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardPlayerTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            characterName: characterName,
            playerName: playerName,
            imagePath: imagePath,
            imageAsset: imageAsset,
            broodIndex: broodIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            life: life,
            mana: mana,
            defense: defense,
            initiative: initiative,
            isAlive: isAlive,
            rowid: rowid,
          ),
        ));
}

class $$BoardPlayerTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardPlayerTableTable> {
  $$BoardPlayerTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get playerName => $state.composableBuilder(
      column: $state.table.playerName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageAsset => $state.composableBuilder(
      column: $state.table.imageAsset,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
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

  ColumnFilters<int> get life => $state.composableBuilder(
      column: $state.table.life,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mana => $state.composableBuilder(
      column: $state.table.mana,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAlive => $state.composableBuilder(
      column: $state.table.isAlive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardPlayerTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardPlayerTableTable> {
  $$BoardPlayerTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get playerName => $state.composableBuilder(
      column: $state.table.playerName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageAsset => $state.composableBuilder(
      column: $state.table.imageAsset,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
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

  ColumnOrderings<int> get life => $state.composableBuilder(
      column: $state.table.life,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mana => $state.composableBuilder(
      column: $state.table.mana,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAlive => $state.composableBuilder(
      column: $state.table.isAlive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardCharacterTableTableCreateCompanionBuilder
    = BoardCharacterTableCompanion Function({
  required String uuid,
  required String boardUuid,
  required String characterName,
  required String playerName,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  required int broodIndex,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BoardCharacterTableTableUpdateCompanionBuilder
    = BoardCharacterTableCompanion Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<String> characterName,
  Value<String> playerName,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<int> broodIndex,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BoardCharacterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardCharacterTableTable,
    BoardCharacterTableData,
    $$BoardCharacterTableTableFilterComposer,
    $$BoardCharacterTableTableOrderingComposer,
    $$BoardCharacterTableTableCreateCompanionBuilder,
    $$BoardCharacterTableTableUpdateCompanionBuilder> {
  $$BoardCharacterTableTableTableManager(
      _$AppDatabase db, $BoardCharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$BoardCharacterTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BoardCharacterTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> characterName = const Value.absent(),
            Value<String> playerName = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<int> broodIndex = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardCharacterTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            characterName: characterName,
            playerName: playerName,
            imagePath: imagePath,
            imageAsset: imageAsset,
            broodIndex: broodIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            required String characterName,
            required String playerName,
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            required int broodIndex,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardCharacterTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            characterName: characterName,
            playerName: playerName,
            imagePath: imagePath,
            imageAsset: imageAsset,
            broodIndex: broodIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardCharacterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardCharacterTableTable> {
  $$BoardCharacterTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get playerName => $state.composableBuilder(
      column: $state.table.playerName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageAsset => $state.composableBuilder(
      column: $state.table.imageAsset,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
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

class $$BoardCharacterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardCharacterTableTable> {
  $$BoardCharacterTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get playerName => $state.composableBuilder(
      column: $state.table.playerName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageAsset => $state.composableBuilder(
      column: $state.table.imageAsset,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
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

typedef $$BoardNoteTableTableCreateCompanionBuilder = BoardNoteTableCompanion
    Function({
  required String uuid,
  required String boardUuid,
  required String note,
  required bool isFavorited,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BoardNoteTableTableUpdateCompanionBuilder = BoardNoteTableCompanion
    Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<String> note,
  Value<bool> isFavorited,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BoardNoteTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardNoteTableTable,
    BoardNoteTableData,
    $$BoardNoteTableTableFilterComposer,
    $$BoardNoteTableTableOrderingComposer,
    $$BoardNoteTableTableCreateCompanionBuilder,
    $$BoardNoteTableTableUpdateCompanionBuilder> {
  $$BoardNoteTableTableTableManager(
      _$AppDatabase db, $BoardNoteTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardNoteTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardNoteTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardNoteTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            note: note,
            isFavorited: isFavorited,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            required String note,
            required bool isFavorited,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardNoteTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            note: note,
            isFavorited: isFavorited,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardNoteTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardNoteTableTable> {
  $$BoardNoteTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFavorited => $state.composableBuilder(
      column: $state.table.isFavorited,
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

class $$BoardNoteTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardNoteTableTable> {
  $$BoardNoteTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFavorited => $state.composableBuilder(
      column: $state.table.isFavorited,
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

typedef $$BoardCombatTableTableCreateCompanionBuilder
    = BoardCombatTableCompanion Function({
  required String uuid,
  required String boardUuid,
  required String sessionUuid,
  required int turn,
  required DateTime startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});
typedef $$BoardCombatTableTableUpdateCompanionBuilder
    = BoardCombatTableCompanion Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<String> sessionUuid,
  Value<int> turn,
  Value<DateTime> startedAt,
  Value<DateTime?> endAt,
  Value<int> rowid,
});

class $$BoardCombatTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardCombatTableTable,
    BoardCombatTableData,
    $$BoardCombatTableTableFilterComposer,
    $$BoardCombatTableTableOrderingComposer,
    $$BoardCombatTableTableCreateCompanionBuilder,
    $$BoardCombatTableTableUpdateCompanionBuilder> {
  $$BoardCombatTableTableTableManager(
      _$AppDatabase db, $BoardCombatTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BoardCombatTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BoardCombatTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<String> sessionUuid = const Value.absent(),
            Value<int> turn = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardCombatTableCompanion(
            uuid: uuid,
            boardUuid: boardUuid,
            sessionUuid: sessionUuid,
            turn: turn,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String boardUuid,
            required String sessionUuid,
            required int turn,
            required DateTime startedAt,
            Value<DateTime?> endAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardCombatTableCompanion.insert(
            uuid: uuid,
            boardUuid: boardUuid,
            sessionUuid: sessionUuid,
            turn: turn,
            startedAt: startedAt,
            endAt: endAt,
            rowid: rowid,
          ),
        ));
}

class $$BoardCombatTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardCombatTableTable> {
  $$BoardCombatTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sessionUuid => $state.composableBuilder(
      column: $state.table.sessionUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get turn => $state.composableBuilder(
      column: $state.table.turn,
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

class $$BoardCombatTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardCombatTableTable> {
  $$BoardCombatTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sessionUuid => $state.composableBuilder(
      column: $state.table.sessionUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get turn => $state.composableBuilder(
      column: $state.table.turn,
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

typedef $$BoardClasseCharacterTableTableCreateCompanionBuilder
    = BoardClasseCharacterTableCompanion Function({
  required String uuid,
  required String playerUuid,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$BoardClasseCharacterTableTableUpdateCompanionBuilder
    = BoardClasseCharacterTableCompanion Function({
  Value<String> uuid,
  Value<String> playerUuid,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$BoardClasseCharacterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BoardClasseCharacterTableTable,
    BoardClasseCharacterTableData,
    $$BoardClasseCharacterTableTableFilterComposer,
    $$BoardClasseCharacterTableTableOrderingComposer,
    $$BoardClasseCharacterTableTableCreateCompanionBuilder,
    $$BoardClasseCharacterTableTableUpdateCompanionBuilder> {
  $$BoardClasseCharacterTableTableTableManager(
      _$AppDatabase db, $BoardClasseCharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$BoardClasseCharacterTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BoardClasseCharacterTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> playerUuid = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardClasseCharacterTableCompanion(
            uuid: uuid,
            playerUuid: playerUuid,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String playerUuid,
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              BoardClasseCharacterTableCompanion.insert(
            uuid: uuid,
            playerUuid: playerUuid,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$BoardClasseCharacterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BoardClasseCharacterTableTable> {
  $$BoardClasseCharacterTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get playerUuid => $state.composableBuilder(
      column: $state.table.playerUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BoardClasseCharacterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BoardClasseCharacterTableTable> {
  $$BoardClasseCharacterTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get playerUuid => $state.composableBuilder(
      column: $state.table.playerUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
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
  $$BoardSessionTableTableTableManager get boardSessionTable =>
      $$BoardSessionTableTableTableManager(_db, _db.boardSessionTable);
  $$BoardLinkTableTableTableManager get boardLinkTable =>
      $$BoardLinkTableTableTableManager(_db, _db.boardLinkTable);
  $$BoardPlayerTableTableTableManager get boardPlayerTable =>
      $$BoardPlayerTableTableTableManager(_db, _db.boardPlayerTable);
  $$BoardCharacterTableTableTableManager get boardCharacterTable =>
      $$BoardCharacterTableTableTableManager(_db, _db.boardCharacterTable);
  $$BoardNoteTableTableTableManager get boardNoteTable =>
      $$BoardNoteTableTableTableManager(_db, _db.boardNoteTable);
  $$BoardCombatTableTableTableManager get boardCombatTable =>
      $$BoardCombatTableTableTableManager(_db, _db.boardCombatTable);
  $$BoardClasseCharacterTableTableTableManager get boardClasseCharacterTable =>
      $$BoardClasseCharacterTableTableTableManager(
          _db, _db.boardClasseCharacterTable);
}
