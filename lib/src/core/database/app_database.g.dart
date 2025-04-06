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
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
  final int createdAt;
  final int updatedAt;
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
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  GrimoireTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> desc = const Value.absent(),
          String? iconAsset,
          int? createdAt,
          int? updatedAt}) =>
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
  final Value<int> createdAt;
  final Value<int> updatedAt;
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
    required int createdAt,
    required int updatedAt,
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
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
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
      Value<int>? createdAt,
      Value<int>? updatedAt,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
  static const VerificationMeta _pmMeta = const VerificationMeta('pm');
  @override
  late final GeneratedColumn<int> pm = GeneratedColumn<int>(
      'pm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cdMeta = const VerificationMeta('cd');
  @override
  late final GeneratedColumn<int> cd = GeneratedColumn<int>(
      'cd', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mediumDamageValueMeta =
      const VerificationMeta('mediumDamageValue');
  @override
  late final GeneratedColumn<int> mediumDamageValue = GeneratedColumn<int>(
      'medium_damage_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _damageDicesMeta =
      const VerificationMeta('damageDices');
  @override
  late final GeneratedColumn<String> damageDices = GeneratedColumn<String>(
      'damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDamageDicesMeta =
      const VerificationMeta('extraDamageDices');
  @override
  late final GeneratedColumn<String> extraDamageDices = GeneratedColumn<String>(
      'extra_damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
        publication,
        pm,
        cd,
        mediumDamageValue,
        damageDices,
        extraDamageDices
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
    if (data.containsKey('pm')) {
      context.handle(_pmMeta, pm.isAcceptableOrUnknown(data['pm']!, _pmMeta));
    }
    if (data.containsKey('cd')) {
      context.handle(_cdMeta, cd.isAcceptableOrUnknown(data['cd']!, _cdMeta));
    }
    if (data.containsKey('medium_damage_value')) {
      context.handle(
          _mediumDamageValueMeta,
          mediumDamageValue.isAcceptableOrUnknown(
              data['medium_damage_value']!, _mediumDamageValueMeta));
    }
    if (data.containsKey('damage_dices')) {
      context.handle(
          _damageDicesMeta,
          damageDices.isAcceptableOrUnknown(
              data['damage_dices']!, _damageDicesMeta));
    }
    if (data.containsKey('extra_damage_dices')) {
      context.handle(
          _extraDamageDicesMeta,
          extraDamageDices.isAcceptableOrUnknown(
              data['extra_damage_dices']!, _extraDamageDicesMeta));
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
      pm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pm']),
      cd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cd']),
      mediumDamageValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medium_damage_value']),
      damageDices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_dices']),
      extraDamageDices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_damage_dices']),
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
  final int? pm;
  final int? cd;
  final int? mediumDamageValue;
  final String? damageDices;
  final String? extraDamageDices;
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
      required this.publication,
      this.pm,
      this.cd,
      this.mediumDamageValue,
      this.damageDices,
      this.extraDamageDices});
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
    if (!nullToAbsent || pm != null) {
      map['pm'] = Variable<int>(pm);
    }
    if (!nullToAbsent || cd != null) {
      map['cd'] = Variable<int>(cd);
    }
    if (!nullToAbsent || mediumDamageValue != null) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue);
    }
    if (!nullToAbsent || damageDices != null) {
      map['damage_dices'] = Variable<String>(damageDices);
    }
    if (!nullToAbsent || extraDamageDices != null) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices);
    }
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
      pm: pm == null && nullToAbsent ? const Value.absent() : Value(pm),
      cd: cd == null && nullToAbsent ? const Value.absent() : Value(cd),
      mediumDamageValue: mediumDamageValue == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumDamageValue),
      damageDices: damageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(damageDices),
      extraDamageDices: extraDamageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(extraDamageDices),
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
      pm: serializer.fromJson<int?>(json['pm']),
      cd: serializer.fromJson<int?>(json['cd']),
      mediumDamageValue: serializer.fromJson<int?>(json['mediumDamageValue']),
      damageDices: serializer.fromJson<String?>(json['damageDices']),
      extraDamageDices: serializer.fromJson<String?>(json['extraDamageDices']),
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
      'pm': serializer.toJson<int?>(pm),
      'cd': serializer.toJson<int?>(cd),
      'mediumDamageValue': serializer.toJson<int?>(mediumDamageValue),
      'damageDices': serializer.toJson<String?>(damageDices),
      'extraDamageDices': serializer.toJson<String?>(extraDamageDices),
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
          String? publication,
          Value<int?> pm = const Value.absent(),
          Value<int?> cd = const Value.absent(),
          Value<int?> mediumDamageValue = const Value.absent(),
          Value<String?> damageDices = const Value.absent(),
          Value<String?> extraDamageDices = const Value.absent()}) =>
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
        pm: pm.present ? pm.value : this.pm,
        cd: cd.present ? cd.value : this.cd,
        mediumDamageValue: mediumDamageValue.present
            ? mediumDamageValue.value
            : this.mediumDamageValue,
        damageDices: damageDices.present ? damageDices.value : this.damageDices,
        extraDamageDices: extraDamageDices.present
            ? extraDamageDices.value
            : this.extraDamageDices,
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
      pm: data.pm.present ? data.pm.value : this.pm,
      cd: data.cd.present ? data.cd.value : this.cd,
      mediumDamageValue: data.mediumDamageValue.present
          ? data.mediumDamageValue.value
          : this.mediumDamageValue,
      damageDices:
          data.damageDices.present ? data.damageDices.value : this.damageDices,
      extraDamageDices: data.extraDamageDices.present
          ? data.extraDamageDices.value
          : this.extraDamageDices,
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
          ..write('publication: $publication, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices')
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
      publication,
      pm,
      cd,
      mediumDamageValue,
      damageDices,
      extraDamageDices);
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
          other.publication == this.publication &&
          other.pm == this.pm &&
          other.cd == this.cd &&
          other.mediumDamageValue == this.mediumDamageValue &&
          other.damageDices == this.damageDices &&
          other.extraDamageDices == this.extraDamageDices);
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
  final Value<int?> pm;
  final Value<int?> cd;
  final Value<int?> mediumDamageValue;
  final Value<String?> damageDices;
  final Value<String?> extraDamageDices;
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
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
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
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
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
    Expression<int>? pm,
    Expression<int>? cd,
    Expression<int>? mediumDamageValue,
    Expression<String>? damageDices,
    Expression<String>? extraDamageDices,
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
      if (pm != null) 'pm': pm,
      if (cd != null) 'cd': cd,
      if (mediumDamageValue != null) 'medium_damage_value': mediumDamageValue,
      if (damageDices != null) 'damage_dices': damageDices,
      if (extraDamageDices != null) 'extra_damage_dices': extraDamageDices,
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
      Value<int?>? pm,
      Value<int?>? cd,
      Value<int?>? mediumDamageValue,
      Value<String?>? damageDices,
      Value<String?>? extraDamageDices,
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
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
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
    if (pm.present) {
      map['pm'] = Variable<int>(pm.value);
    }
    if (cd.present) {
      map['cd'] = Variable<int>(cd.value);
    }
    if (mediumDamageValue.present) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue.value);
    }
    if (damageDices.present) {
      map['damage_dices'] = Variable<String>(damageDices.value);
    }
    if (extraDamageDices.present) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices.value);
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
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
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
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
  final int createdAt;
  final int updatedAt;
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
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
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
          int? createdAt,
          int? updatedAt,
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
  final Value<int> createdAt;
  final Value<int> updatedAt;
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
    required int createdAt,
    required int updatedAt,
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
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
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
      Value<int>? createdAt,
      Value<int>? updatedAt,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _classeIndexesMeta =
      const VerificationMeta('classeIndexes');
  @override
  late final GeneratedColumn<String> classeIndexes = GeneratedColumn<String>(
      'classe_indexes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
        isAlive,
        classeIndexes
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
    if (data.containsKey('classe_indexes')) {
      context.handle(
          _classeIndexesMeta,
          classeIndexes.isAcceptableOrUnknown(
              data['classe_indexes']!, _classeIndexesMeta));
    } else if (isInserting) {
      context.missing(_classeIndexesMeta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
      classeIndexes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}classe_indexes'])!,
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
  final int createdAt;
  final int updatedAt;
  final int life;
  final int mana;
  final int defense;
  final int initiative;
  final bool isAlive;
  final String classeIndexes;
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
      required this.isAlive,
      required this.classeIndexes});
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
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['life'] = Variable<int>(life);
    map['mana'] = Variable<int>(mana);
    map['defense'] = Variable<int>(defense);
    map['initiative'] = Variable<int>(initiative);
    map['is_alive'] = Variable<bool>(isAlive);
    map['classe_indexes'] = Variable<String>(classeIndexes);
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
      classeIndexes: Value(classeIndexes),
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      life: serializer.fromJson<int>(json['life']),
      mana: serializer.fromJson<int>(json['mana']),
      defense: serializer.fromJson<int>(json['defense']),
      initiative: serializer.fromJson<int>(json['initiative']),
      isAlive: serializer.fromJson<bool>(json['isAlive']),
      classeIndexes: serializer.fromJson<String>(json['classeIndexes']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'life': serializer.toJson<int>(life),
      'mana': serializer.toJson<int>(mana),
      'defense': serializer.toJson<int>(defense),
      'initiative': serializer.toJson<int>(initiative),
      'isAlive': serializer.toJson<bool>(isAlive),
      'classeIndexes': serializer.toJson<String>(classeIndexes),
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
          int? createdAt,
          int? updatedAt,
          int? life,
          int? mana,
          int? defense,
          int? initiative,
          bool? isAlive,
          String? classeIndexes}) =>
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
        classeIndexes: classeIndexes ?? this.classeIndexes,
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
      classeIndexes: data.classeIndexes.present
          ? data.classeIndexes.value
          : this.classeIndexes,
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
          ..write('isAlive: $isAlive, ')
          ..write('classeIndexes: $classeIndexes')
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
      isAlive,
      classeIndexes);
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
          other.isAlive == this.isAlive &&
          other.classeIndexes == this.classeIndexes);
}

class BoardPlayerTableCompanion extends UpdateCompanion<BoardPlayerTableData> {
  final Value<String> uuid;
  final Value<String> boardUuid;
  final Value<String> characterName;
  final Value<String> playerName;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<int> broodIndex;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> life;
  final Value<int> mana;
  final Value<int> defense;
  final Value<int> initiative;
  final Value<bool> isAlive;
  final Value<String> classeIndexes;
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
    this.classeIndexes = const Value.absent(),
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
    required int createdAt,
    required int updatedAt,
    required int life,
    required int mana,
    required int defense,
    required int initiative,
    required bool isAlive,
    required String classeIndexes,
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
        isAlive = Value(isAlive),
        classeIndexes = Value(classeIndexes);
  static Insertable<BoardPlayerTableData> custom({
    Expression<String>? uuid,
    Expression<String>? boardUuid,
    Expression<String>? characterName,
    Expression<String>? playerName,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<int>? broodIndex,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? life,
    Expression<int>? mana,
    Expression<int>? defense,
    Expression<int>? initiative,
    Expression<bool>? isAlive,
    Expression<String>? classeIndexes,
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
      if (classeIndexes != null) 'classe_indexes': classeIndexes,
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
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? life,
      Value<int>? mana,
      Value<int>? defense,
      Value<int>? initiative,
      Value<bool>? isAlive,
      Value<String>? classeIndexes,
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
      classeIndexes: classeIndexes ?? this.classeIndexes,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
    if (classeIndexes.present) {
      map['classe_indexes'] = Variable<String>(classeIndexes.value);
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
          ..write('classeIndexes: $classeIndexes, ')
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
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
  final int createdAt;
  final int updatedAt;
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
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  BoardNoteTableData copyWith(
          {String? uuid,
          String? boardUuid,
          String? note,
          bool? isFavorited,
          int? createdAt,
          int? updatedAt}) =>
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
  final Value<int> createdAt;
  final Value<int> updatedAt;
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
    required int createdAt,
    required int updatedAt,
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
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
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
      Value<int>? createdAt,
      Value<int>? updatedAt,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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

class $MenaceTableTable extends MenaceTable
    with TableInfo<$MenaceTableTable, MenaceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenaceTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _displacementMeta =
      const VerificationMeta('displacement');
  @override
  late final GeneratedColumn<String> displacement = GeneratedColumn<String>(
      'displacement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _casterInfosMeta =
      const VerificationMeta('casterInfos');
  @override
  late final GeneratedColumn<String> casterInfos = GeneratedColumn<String>(
      'caster_infos', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraInfosMeta =
      const VerificationMeta('extraInfos');
  @override
  late final GeneratedColumn<String> extraInfos = GeneratedColumn<String>(
      'extra_infos', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sensesMeta = const VerificationMeta('senses');
  @override
  late final GeneratedColumn<String> senses = GeneratedColumn<String>(
      'senses', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ndMeta = const VerificationMeta('nd');
  @override
  late final GeneratedColumn<String> nd = GeneratedColumn<String>(
      'nd', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _divinityIdMeta =
      const VerificationMeta('divinityId');
  @override
  late final GeneratedColumn<int> divinityId = GeneratedColumn<int>(
      'divinity_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _initiativeMeta =
      const VerificationMeta('initiative');
  @override
  late final GeneratedColumn<int> initiative = GeneratedColumn<int>(
      'initiative', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _perceptionMeta =
      const VerificationMeta('perception');
  @override
  late final GeneratedColumn<int> perception = GeneratedColumn<int>(
      'perception', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseMeta =
      const VerificationMeta('defense');
  @override
  late final GeneratedColumn<int> defense = GeneratedColumn<int>(
      'defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _fortResistenceMeta =
      const VerificationMeta('fortResistence');
  @override
  late final GeneratedColumn<int> fortResistence = GeneratedColumn<int>(
      'fort_resistence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refResistenceMeta =
      const VerificationMeta('refResistence');
  @override
  late final GeneratedColumn<int> refResistence = GeneratedColumn<int>(
      'ref_resistence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _vonResistenceMeta =
      const VerificationMeta('vonResistence');
  @override
  late final GeneratedColumn<int> vonResistence = GeneratedColumn<int>(
      'von_resistence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityMeta =
      const VerificationMeta('dexterity');
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
      'dexterity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionMeta =
      const VerificationMeta('constitution');
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
      'constitution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
      'intelligence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
      'wisdom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaMeta =
      const VerificationMeta('charisma');
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
      'charisma', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creatureSizeIndexMeta =
      const VerificationMeta('creatureSizeIndex');
  @override
  late final GeneratedColumn<int> creatureSizeIndex = GeneratedColumn<int>(
      'creature_size_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _combateRoleIndexMeta =
      const VerificationMeta('combateRoleIndex');
  @override
  late final GeneratedColumn<int> combateRoleIndex = GeneratedColumn<int>(
      'combate_role_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _treasureTypeIndexMeta =
      const VerificationMeta('treasureTypeIndex');
  @override
  late final GeneratedColumn<int> treasureTypeIndex = GeneratedColumn<int>(
      'treasure_type_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        casterInfos,
        desc,
        extraInfos,
        senses,
        nd,
        divinityId,
        initiative,
        perception,
        defense,
        life,
        mana,
        fortResistence,
        refResistence,
        vonResistence,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        typeIndex,
        creatureSizeIndex,
        combateRoleIndex,
        treasureTypeIndex,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menace_table';
  @override
  VerificationContext validateIntegrity(Insertable<MenaceTableData> instance,
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
    if (data.containsKey('displacement')) {
      context.handle(
          _displacementMeta,
          displacement.isAcceptableOrUnknown(
              data['displacement']!, _displacementMeta));
    }
    if (data.containsKey('caster_infos')) {
      context.handle(
          _casterInfosMeta,
          casterInfos.isAcceptableOrUnknown(
              data['caster_infos']!, _casterInfosMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('extra_infos')) {
      context.handle(
          _extraInfosMeta,
          extraInfos.isAcceptableOrUnknown(
              data['extra_infos']!, _extraInfosMeta));
    }
    if (data.containsKey('senses')) {
      context.handle(_sensesMeta,
          senses.isAcceptableOrUnknown(data['senses']!, _sensesMeta));
    }
    if (data.containsKey('nd')) {
      context.handle(_ndMeta, nd.isAcceptableOrUnknown(data['nd']!, _ndMeta));
    } else if (isInserting) {
      context.missing(_ndMeta);
    }
    if (data.containsKey('divinity_id')) {
      context.handle(
          _divinityIdMeta,
          divinityId.isAcceptableOrUnknown(
              data['divinity_id']!, _divinityIdMeta));
    }
    if (data.containsKey('initiative')) {
      context.handle(
          _initiativeMeta,
          initiative.isAcceptableOrUnknown(
              data['initiative']!, _initiativeMeta));
    } else if (isInserting) {
      context.missing(_initiativeMeta);
    }
    if (data.containsKey('perception')) {
      context.handle(
          _perceptionMeta,
          perception.isAcceptableOrUnknown(
              data['perception']!, _perceptionMeta));
    } else if (isInserting) {
      context.missing(_perceptionMeta);
    }
    if (data.containsKey('defense')) {
      context.handle(_defenseMeta,
          defense.isAcceptableOrUnknown(data['defense']!, _defenseMeta));
    } else if (isInserting) {
      context.missing(_defenseMeta);
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
    if (data.containsKey('fort_resistence')) {
      context.handle(
          _fortResistenceMeta,
          fortResistence.isAcceptableOrUnknown(
              data['fort_resistence']!, _fortResistenceMeta));
    } else if (isInserting) {
      context.missing(_fortResistenceMeta);
    }
    if (data.containsKey('ref_resistence')) {
      context.handle(
          _refResistenceMeta,
          refResistence.isAcceptableOrUnknown(
              data['ref_resistence']!, _refResistenceMeta));
    } else if (isInserting) {
      context.missing(_refResistenceMeta);
    }
    if (data.containsKey('von_resistence')) {
      context.handle(
          _vonResistenceMeta,
          vonResistence.isAcceptableOrUnknown(
              data['von_resistence']!, _vonResistenceMeta));
    } else if (isInserting) {
      context.missing(_vonResistenceMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('dexterity')) {
      context.handle(_dexterityMeta,
          dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta));
    } else if (isInserting) {
      context.missing(_dexterityMeta);
    }
    if (data.containsKey('constitution')) {
      context.handle(
          _constitutionMeta,
          constitution.isAcceptableOrUnknown(
              data['constitution']!, _constitutionMeta));
    } else if (isInserting) {
      context.missing(_constitutionMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(_wisdomMeta,
          wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta));
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(_charismaMeta,
          charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta));
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('creature_size_index')) {
      context.handle(
          _creatureSizeIndexMeta,
          creatureSizeIndex.isAcceptableOrUnknown(
              data['creature_size_index']!, _creatureSizeIndexMeta));
    } else if (isInserting) {
      context.missing(_creatureSizeIndexMeta);
    }
    if (data.containsKey('combate_role_index')) {
      context.handle(
          _combateRoleIndexMeta,
          combateRoleIndex.isAcceptableOrUnknown(
              data['combate_role_index']!, _combateRoleIndexMeta));
    } else if (isInserting) {
      context.missing(_combateRoleIndexMeta);
    }
    if (data.containsKey('treasure_type_index')) {
      context.handle(
          _treasureTypeIndexMeta,
          treasureTypeIndex.isAcceptableOrUnknown(
              data['treasure_type_index']!, _treasureTypeIndexMeta));
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
  MenaceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenaceTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      imageAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_asset']),
      displacement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}displacement']),
      casterInfos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}caster_infos']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      extraInfos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extra_infos']),
      senses: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}senses']),
      nd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nd'])!,
      divinityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}divinity_id']),
      initiative: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initiative'])!,
      perception: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}perception'])!,
      defense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense'])!,
      life: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}life'])!,
      mana: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mana'])!,
      fortResistence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fort_resistence'])!,
      refResistence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_resistence'])!,
      vonResistence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}von_resistence'])!,
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength'])!,
      dexterity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity'])!,
      constitution: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution'])!,
      intelligence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence'])!,
      wisdom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom'])!,
      charisma: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      creatureSizeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}creature_size_index'])!,
      combateRoleIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}combate_role_index'])!,
      treasureTypeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}treasure_type_index']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MenaceTableTable createAlias(String alias) {
    return $MenaceTableTable(attachedDatabase, alias);
  }
}

class MenaceTableData extends DataClass implements Insertable<MenaceTableData> {
  final String uuid;
  final String name;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final String? casterInfos;
  final String? desc;
  final String? extraInfos;
  final String? senses;
  final String nd;
  final int? divinityId;
  final int initiative;
  final int perception;
  final int defense;
  final int life;
  final int mana;
  final int fortResistence;
  final int refResistence;
  final int vonResistence;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int typeIndex;
  final int creatureSizeIndex;
  final int combateRoleIndex;
  final int? treasureTypeIndex;
  final int createdAt;
  final int updatedAt;
  const MenaceTableData(
      {required this.uuid,
      required this.name,
      this.imagePath,
      this.imageAsset,
      this.displacement,
      this.casterInfos,
      this.desc,
      this.extraInfos,
      this.senses,
      required this.nd,
      this.divinityId,
      required this.initiative,
      required this.perception,
      required this.defense,
      required this.life,
      required this.mana,
      required this.fortResistence,
      required this.refResistence,
      required this.vonResistence,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma,
      required this.typeIndex,
      required this.creatureSizeIndex,
      required this.combateRoleIndex,
      this.treasureTypeIndex,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    if (!nullToAbsent || displacement != null) {
      map['displacement'] = Variable<String>(displacement);
    }
    if (!nullToAbsent || casterInfos != null) {
      map['caster_infos'] = Variable<String>(casterInfos);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    if (!nullToAbsent || extraInfos != null) {
      map['extra_infos'] = Variable<String>(extraInfos);
    }
    if (!nullToAbsent || senses != null) {
      map['senses'] = Variable<String>(senses);
    }
    map['nd'] = Variable<String>(nd);
    if (!nullToAbsent || divinityId != null) {
      map['divinity_id'] = Variable<int>(divinityId);
    }
    map['initiative'] = Variable<int>(initiative);
    map['perception'] = Variable<int>(perception);
    map['defense'] = Variable<int>(defense);
    map['life'] = Variable<int>(life);
    map['mana'] = Variable<int>(mana);
    map['fort_resistence'] = Variable<int>(fortResistence);
    map['ref_resistence'] = Variable<int>(refResistence);
    map['von_resistence'] = Variable<int>(vonResistence);
    map['strength'] = Variable<int>(strength);
    map['dexterity'] = Variable<int>(dexterity);
    map['constitution'] = Variable<int>(constitution);
    map['intelligence'] = Variable<int>(intelligence);
    map['wisdom'] = Variable<int>(wisdom);
    map['charisma'] = Variable<int>(charisma);
    map['type_index'] = Variable<int>(typeIndex);
    map['creature_size_index'] = Variable<int>(creatureSizeIndex);
    map['combate_role_index'] = Variable<int>(combateRoleIndex);
    if (!nullToAbsent || treasureTypeIndex != null) {
      map['treasure_type_index'] = Variable<int>(treasureTypeIndex);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  MenaceTableCompanion toCompanion(bool nullToAbsent) {
    return MenaceTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      displacement: displacement == null && nullToAbsent
          ? const Value.absent()
          : Value(displacement),
      casterInfos: casterInfos == null && nullToAbsent
          ? const Value.absent()
          : Value(casterInfos),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      extraInfos: extraInfos == null && nullToAbsent
          ? const Value.absent()
          : Value(extraInfos),
      senses:
          senses == null && nullToAbsent ? const Value.absent() : Value(senses),
      nd: Value(nd),
      divinityId: divinityId == null && nullToAbsent
          ? const Value.absent()
          : Value(divinityId),
      initiative: Value(initiative),
      perception: Value(perception),
      defense: Value(defense),
      life: Value(life),
      mana: Value(mana),
      fortResistence: Value(fortResistence),
      refResistence: Value(refResistence),
      vonResistence: Value(vonResistence),
      strength: Value(strength),
      dexterity: Value(dexterity),
      constitution: Value(constitution),
      intelligence: Value(intelligence),
      wisdom: Value(wisdom),
      charisma: Value(charisma),
      typeIndex: Value(typeIndex),
      creatureSizeIndex: Value(creatureSizeIndex),
      combateRoleIndex: Value(combateRoleIndex),
      treasureTypeIndex: treasureTypeIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(treasureTypeIndex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MenaceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenaceTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      displacement: serializer.fromJson<String?>(json['displacement']),
      casterInfos: serializer.fromJson<String?>(json['casterInfos']),
      desc: serializer.fromJson<String?>(json['desc']),
      extraInfos: serializer.fromJson<String?>(json['extraInfos']),
      senses: serializer.fromJson<String?>(json['senses']),
      nd: serializer.fromJson<String>(json['nd']),
      divinityId: serializer.fromJson<int?>(json['divinityId']),
      initiative: serializer.fromJson<int>(json['initiative']),
      perception: serializer.fromJson<int>(json['perception']),
      defense: serializer.fromJson<int>(json['defense']),
      life: serializer.fromJson<int>(json['life']),
      mana: serializer.fromJson<int>(json['mana']),
      fortResistence: serializer.fromJson<int>(json['fortResistence']),
      refResistence: serializer.fromJson<int>(json['refResistence']),
      vonResistence: serializer.fromJson<int>(json['vonResistence']),
      strength: serializer.fromJson<int>(json['strength']),
      dexterity: serializer.fromJson<int>(json['dexterity']),
      constitution: serializer.fromJson<int>(json['constitution']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      charisma: serializer.fromJson<int>(json['charisma']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      creatureSizeIndex: serializer.fromJson<int>(json['creatureSizeIndex']),
      combateRoleIndex: serializer.fromJson<int>(json['combateRoleIndex']),
      treasureTypeIndex: serializer.fromJson<int?>(json['treasureTypeIndex']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'displacement': serializer.toJson<String?>(displacement),
      'casterInfos': serializer.toJson<String?>(casterInfos),
      'desc': serializer.toJson<String?>(desc),
      'extraInfos': serializer.toJson<String?>(extraInfos),
      'senses': serializer.toJson<String?>(senses),
      'nd': serializer.toJson<String>(nd),
      'divinityId': serializer.toJson<int?>(divinityId),
      'initiative': serializer.toJson<int>(initiative),
      'perception': serializer.toJson<int>(perception),
      'defense': serializer.toJson<int>(defense),
      'life': serializer.toJson<int>(life),
      'mana': serializer.toJson<int>(mana),
      'fortResistence': serializer.toJson<int>(fortResistence),
      'refResistence': serializer.toJson<int>(refResistence),
      'vonResistence': serializer.toJson<int>(vonResistence),
      'strength': serializer.toJson<int>(strength),
      'dexterity': serializer.toJson<int>(dexterity),
      'constitution': serializer.toJson<int>(constitution),
      'intelligence': serializer.toJson<int>(intelligence),
      'wisdom': serializer.toJson<int>(wisdom),
      'charisma': serializer.toJson<int>(charisma),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'creatureSizeIndex': serializer.toJson<int>(creatureSizeIndex),
      'combateRoleIndex': serializer.toJson<int>(combateRoleIndex),
      'treasureTypeIndex': serializer.toJson<int?>(treasureTypeIndex),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  MenaceTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> imageAsset = const Value.absent(),
          Value<String?> displacement = const Value.absent(),
          Value<String?> casterInfos = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          Value<String?> extraInfos = const Value.absent(),
          Value<String?> senses = const Value.absent(),
          String? nd,
          Value<int?> divinityId = const Value.absent(),
          int? initiative,
          int? perception,
          int? defense,
          int? life,
          int? mana,
          int? fortResistence,
          int? refResistence,
          int? vonResistence,
          int? strength,
          int? dexterity,
          int? constitution,
          int? intelligence,
          int? wisdom,
          int? charisma,
          int? typeIndex,
          int? creatureSizeIndex,
          int? combateRoleIndex,
          Value<int?> treasureTypeIndex = const Value.absent(),
          int? createdAt,
          int? updatedAt}) =>
      MenaceTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
        displacement:
            displacement.present ? displacement.value : this.displacement,
        casterInfos: casterInfos.present ? casterInfos.value : this.casterInfos,
        desc: desc.present ? desc.value : this.desc,
        extraInfos: extraInfos.present ? extraInfos.value : this.extraInfos,
        senses: senses.present ? senses.value : this.senses,
        nd: nd ?? this.nd,
        divinityId: divinityId.present ? divinityId.value : this.divinityId,
        initiative: initiative ?? this.initiative,
        perception: perception ?? this.perception,
        defense: defense ?? this.defense,
        life: life ?? this.life,
        mana: mana ?? this.mana,
        fortResistence: fortResistence ?? this.fortResistence,
        refResistence: refResistence ?? this.refResistence,
        vonResistence: vonResistence ?? this.vonResistence,
        strength: strength ?? this.strength,
        dexterity: dexterity ?? this.dexterity,
        constitution: constitution ?? this.constitution,
        intelligence: intelligence ?? this.intelligence,
        wisdom: wisdom ?? this.wisdom,
        charisma: charisma ?? this.charisma,
        typeIndex: typeIndex ?? this.typeIndex,
        creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
        combateRoleIndex: combateRoleIndex ?? this.combateRoleIndex,
        treasureTypeIndex: treasureTypeIndex.present
            ? treasureTypeIndex.value
            : this.treasureTypeIndex,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MenaceTableData copyWithCompanion(MenaceTableCompanion data) {
    return MenaceTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageAsset:
          data.imageAsset.present ? data.imageAsset.value : this.imageAsset,
      displacement: data.displacement.present
          ? data.displacement.value
          : this.displacement,
      casterInfos:
          data.casterInfos.present ? data.casterInfos.value : this.casterInfos,
      desc: data.desc.present ? data.desc.value : this.desc,
      extraInfos:
          data.extraInfos.present ? data.extraInfos.value : this.extraInfos,
      senses: data.senses.present ? data.senses.value : this.senses,
      nd: data.nd.present ? data.nd.value : this.nd,
      divinityId:
          data.divinityId.present ? data.divinityId.value : this.divinityId,
      initiative:
          data.initiative.present ? data.initiative.value : this.initiative,
      perception:
          data.perception.present ? data.perception.value : this.perception,
      defense: data.defense.present ? data.defense.value : this.defense,
      life: data.life.present ? data.life.value : this.life,
      mana: data.mana.present ? data.mana.value : this.mana,
      fortResistence: data.fortResistence.present
          ? data.fortResistence.value
          : this.fortResistence,
      refResistence: data.refResistence.present
          ? data.refResistence.value
          : this.refResistence,
      vonResistence: data.vonResistence.present
          ? data.vonResistence.value
          : this.vonResistence,
      strength: data.strength.present ? data.strength.value : this.strength,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      creatureSizeIndex: data.creatureSizeIndex.present
          ? data.creatureSizeIndex.value
          : this.creatureSizeIndex,
      combateRoleIndex: data.combateRoleIndex.present
          ? data.combateRoleIndex.value
          : this.combateRoleIndex,
      treasureTypeIndex: data.treasureTypeIndex.present
          ? data.treasureTypeIndex.value
          : this.treasureTypeIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenaceTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('casterInfos: $casterInfos, ')
          ..write('desc: $desc, ')
          ..write('extraInfos: $extraInfos, ')
          ..write('senses: $senses, ')
          ..write('nd: $nd, ')
          ..write('divinityId: $divinityId, ')
          ..write('initiative: $initiative, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('fortResistence: $fortResistence, ')
          ..write('refResistence: $refResistence, ')
          ..write('vonResistence: $vonResistence, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('combateRoleIndex: $combateRoleIndex, ')
          ..write('treasureTypeIndex: $treasureTypeIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        uuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        casterInfos,
        desc,
        extraInfos,
        senses,
        nd,
        divinityId,
        initiative,
        perception,
        defense,
        life,
        mana,
        fortResistence,
        refResistence,
        vonResistence,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        typeIndex,
        creatureSizeIndex,
        combateRoleIndex,
        treasureTypeIndex,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenaceTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.imageAsset == this.imageAsset &&
          other.displacement == this.displacement &&
          other.casterInfos == this.casterInfos &&
          other.desc == this.desc &&
          other.extraInfos == this.extraInfos &&
          other.senses == this.senses &&
          other.nd == this.nd &&
          other.divinityId == this.divinityId &&
          other.initiative == this.initiative &&
          other.perception == this.perception &&
          other.defense == this.defense &&
          other.life == this.life &&
          other.mana == this.mana &&
          other.fortResistence == this.fortResistence &&
          other.refResistence == this.refResistence &&
          other.vonResistence == this.vonResistence &&
          other.strength == this.strength &&
          other.dexterity == this.dexterity &&
          other.constitution == this.constitution &&
          other.intelligence == this.intelligence &&
          other.wisdom == this.wisdom &&
          other.charisma == this.charisma &&
          other.typeIndex == this.typeIndex &&
          other.creatureSizeIndex == this.creatureSizeIndex &&
          other.combateRoleIndex == this.combateRoleIndex &&
          other.treasureTypeIndex == this.treasureTypeIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MenaceTableCompanion extends UpdateCompanion<MenaceTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<String?> displacement;
  final Value<String?> casterInfos;
  final Value<String?> desc;
  final Value<String?> extraInfos;
  final Value<String?> senses;
  final Value<String> nd;
  final Value<int?> divinityId;
  final Value<int> initiative;
  final Value<int> perception;
  final Value<int> defense;
  final Value<int> life;
  final Value<int> mana;
  final Value<int> fortResistence;
  final Value<int> refResistence;
  final Value<int> vonResistence;
  final Value<int> strength;
  final Value<int> dexterity;
  final Value<int> constitution;
  final Value<int> intelligence;
  final Value<int> wisdom;
  final Value<int> charisma;
  final Value<int> typeIndex;
  final Value<int> creatureSizeIndex;
  final Value<int> combateRoleIndex;
  final Value<int?> treasureTypeIndex;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const MenaceTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.casterInfos = const Value.absent(),
    this.desc = const Value.absent(),
    this.extraInfos = const Value.absent(),
    this.senses = const Value.absent(),
    this.nd = const Value.absent(),
    this.divinityId = const Value.absent(),
    this.initiative = const Value.absent(),
    this.perception = const Value.absent(),
    this.defense = const Value.absent(),
    this.life = const Value.absent(),
    this.mana = const Value.absent(),
    this.fortResistence = const Value.absent(),
    this.refResistence = const Value.absent(),
    this.vonResistence = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.creatureSizeIndex = const Value.absent(),
    this.combateRoleIndex = const Value.absent(),
    this.treasureTypeIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenaceTableCompanion.insert({
    required String uuid,
    required String name,
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.casterInfos = const Value.absent(),
    this.desc = const Value.absent(),
    this.extraInfos = const Value.absent(),
    this.senses = const Value.absent(),
    required String nd,
    this.divinityId = const Value.absent(),
    required int initiative,
    required int perception,
    required int defense,
    required int life,
    required int mana,
    required int fortResistence,
    required int refResistence,
    required int vonResistence,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
    required int typeIndex,
    required int creatureSizeIndex,
    required int combateRoleIndex,
    this.treasureTypeIndex = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        nd = Value(nd),
        initiative = Value(initiative),
        perception = Value(perception),
        defense = Value(defense),
        life = Value(life),
        mana = Value(mana),
        fortResistence = Value(fortResistence),
        refResistence = Value(refResistence),
        vonResistence = Value(vonResistence),
        strength = Value(strength),
        dexterity = Value(dexterity),
        constitution = Value(constitution),
        intelligence = Value(intelligence),
        wisdom = Value(wisdom),
        charisma = Value(charisma),
        typeIndex = Value(typeIndex),
        creatureSizeIndex = Value(creatureSizeIndex),
        combateRoleIndex = Value(combateRoleIndex),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MenaceTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<String>? displacement,
    Expression<String>? casterInfos,
    Expression<String>? desc,
    Expression<String>? extraInfos,
    Expression<String>? senses,
    Expression<String>? nd,
    Expression<int>? divinityId,
    Expression<int>? initiative,
    Expression<int>? perception,
    Expression<int>? defense,
    Expression<int>? life,
    Expression<int>? mana,
    Expression<int>? fortResistence,
    Expression<int>? refResistence,
    Expression<int>? vonResistence,
    Expression<int>? strength,
    Expression<int>? dexterity,
    Expression<int>? constitution,
    Expression<int>? intelligence,
    Expression<int>? wisdom,
    Expression<int>? charisma,
    Expression<int>? typeIndex,
    Expression<int>? creatureSizeIndex,
    Expression<int>? combateRoleIndex,
    Expression<int>? treasureTypeIndex,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (displacement != null) 'displacement': displacement,
      if (casterInfos != null) 'caster_infos': casterInfos,
      if (desc != null) 'desc': desc,
      if (extraInfos != null) 'extra_infos': extraInfos,
      if (senses != null) 'senses': senses,
      if (nd != null) 'nd': nd,
      if (divinityId != null) 'divinity_id': divinityId,
      if (initiative != null) 'initiative': initiative,
      if (perception != null) 'perception': perception,
      if (defense != null) 'defense': defense,
      if (life != null) 'life': life,
      if (mana != null) 'mana': mana,
      if (fortResistence != null) 'fort_resistence': fortResistence,
      if (refResistence != null) 'ref_resistence': refResistence,
      if (vonResistence != null) 'von_resistence': vonResistence,
      if (strength != null) 'strength': strength,
      if (dexterity != null) 'dexterity': dexterity,
      if (constitution != null) 'constitution': constitution,
      if (intelligence != null) 'intelligence': intelligence,
      if (wisdom != null) 'wisdom': wisdom,
      if (charisma != null) 'charisma': charisma,
      if (typeIndex != null) 'type_index': typeIndex,
      if (creatureSizeIndex != null) 'creature_size_index': creatureSizeIndex,
      if (combateRoleIndex != null) 'combate_role_index': combateRoleIndex,
      if (treasureTypeIndex != null) 'treasure_type_index': treasureTypeIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenaceTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String?>? imagePath,
      Value<String?>? imageAsset,
      Value<String?>? displacement,
      Value<String?>? casterInfos,
      Value<String?>? desc,
      Value<String?>? extraInfos,
      Value<String?>? senses,
      Value<String>? nd,
      Value<int?>? divinityId,
      Value<int>? initiative,
      Value<int>? perception,
      Value<int>? defense,
      Value<int>? life,
      Value<int>? mana,
      Value<int>? fortResistence,
      Value<int>? refResistence,
      Value<int>? vonResistence,
      Value<int>? strength,
      Value<int>? dexterity,
      Value<int>? constitution,
      Value<int>? intelligence,
      Value<int>? wisdom,
      Value<int>? charisma,
      Value<int>? typeIndex,
      Value<int>? creatureSizeIndex,
      Value<int>? combateRoleIndex,
      Value<int?>? treasureTypeIndex,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return MenaceTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      displacement: displacement ?? this.displacement,
      casterInfos: casterInfos ?? this.casterInfos,
      desc: desc ?? this.desc,
      extraInfos: extraInfos ?? this.extraInfos,
      senses: senses ?? this.senses,
      nd: nd ?? this.nd,
      divinityId: divinityId ?? this.divinityId,
      initiative: initiative ?? this.initiative,
      perception: perception ?? this.perception,
      defense: defense ?? this.defense,
      life: life ?? this.life,
      mana: mana ?? this.mana,
      fortResistence: fortResistence ?? this.fortResistence,
      refResistence: refResistence ?? this.refResistence,
      vonResistence: vonResistence ?? this.vonResistence,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      typeIndex: typeIndex ?? this.typeIndex,
      creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
      combateRoleIndex: combateRoleIndex ?? this.combateRoleIndex,
      treasureTypeIndex: treasureTypeIndex ?? this.treasureTypeIndex,
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
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (displacement.present) {
      map['displacement'] = Variable<String>(displacement.value);
    }
    if (casterInfos.present) {
      map['caster_infos'] = Variable<String>(casterInfos.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (extraInfos.present) {
      map['extra_infos'] = Variable<String>(extraInfos.value);
    }
    if (senses.present) {
      map['senses'] = Variable<String>(senses.value);
    }
    if (nd.present) {
      map['nd'] = Variable<String>(nd.value);
    }
    if (divinityId.present) {
      map['divinity_id'] = Variable<int>(divinityId.value);
    }
    if (initiative.present) {
      map['initiative'] = Variable<int>(initiative.value);
    }
    if (perception.present) {
      map['perception'] = Variable<int>(perception.value);
    }
    if (defense.present) {
      map['defense'] = Variable<int>(defense.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (mana.present) {
      map['mana'] = Variable<int>(mana.value);
    }
    if (fortResistence.present) {
      map['fort_resistence'] = Variable<int>(fortResistence.value);
    }
    if (refResistence.present) {
      map['ref_resistence'] = Variable<int>(refResistence.value);
    }
    if (vonResistence.present) {
      map['von_resistence'] = Variable<int>(vonResistence.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (creatureSizeIndex.present) {
      map['creature_size_index'] = Variable<int>(creatureSizeIndex.value);
    }
    if (combateRoleIndex.present) {
      map['combate_role_index'] = Variable<int>(combateRoleIndex.value);
    }
    if (treasureTypeIndex.present) {
      map['treasure_type_index'] = Variable<int>(treasureTypeIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenaceTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('casterInfos: $casterInfos, ')
          ..write('desc: $desc, ')
          ..write('extraInfos: $extraInfos, ')
          ..write('senses: $senses, ')
          ..write('nd: $nd, ')
          ..write('divinityId: $divinityId, ')
          ..write('initiative: $initiative, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('fortResistence: $fortResistence, ')
          ..write('refResistence: $refResistence, ')
          ..write('vonResistence: $vonResistence, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('combateRoleIndex: $combateRoleIndex, ')
          ..write('treasureTypeIndex: $treasureTypeIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdventureBackpackTableTable extends AdventureBackpackTable
    with TableInfo<$AdventureBackpackTableTable, AdventureBackpackTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdventureBackpackTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
      'suffix', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uuid, name, parentUuid, suffix, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adventure_backpack_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AdventureBackpackTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('suffix')) {
      context.handle(_suffixMeta,
          suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  AdventureBackpackTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdventureBackpackTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      suffix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suffix']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $AdventureBackpackTableTable createAlias(String alias) {
    return $AdventureBackpackTableTable(attachedDatabase, alias);
  }
}

class AdventureBackpackTableData extends DataClass
    implements Insertable<AdventureBackpackTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? suffix;
  final double? price;
  const AdventureBackpackTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.suffix,
      this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  AdventureBackpackTableCompanion toCompanion(bool nullToAbsent) {
    return AdventureBackpackTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      suffix:
          suffix == null && nullToAbsent ? const Value.absent() : Value(suffix),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory AdventureBackpackTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdventureBackpackTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'suffix': serializer.toJson<String?>(suffix),
      'price': serializer.toJson<double?>(price),
    };
  }

  AdventureBackpackTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> suffix = const Value.absent(),
          Value<double?> price = const Value.absent()}) =>
      AdventureBackpackTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        suffix: suffix.present ? suffix.value : this.suffix,
        price: price.present ? price.value : this.price,
      );
  AdventureBackpackTableData copyWithCompanion(
      AdventureBackpackTableCompanion data) {
    return AdventureBackpackTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdventureBackpackTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('suffix: $suffix, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, parentUuid, suffix, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdventureBackpackTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.suffix == this.suffix &&
          other.price == this.price);
}

class AdventureBackpackTableCompanion
    extends UpdateCompanion<AdventureBackpackTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> suffix;
  final Value<double?> price;
  final Value<int> rowid;
  const AdventureBackpackTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.suffix = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdventureBackpackTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.suffix = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid);
  static Insertable<AdventureBackpackTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? suffix,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (suffix != null) 'suffix': suffix,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdventureBackpackTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? suffix,
      Value<double?>? price,
      Value<int>? rowid}) {
    return AdventureBackpackTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      suffix: suffix ?? this.suffix,
      price: price ?? this.price,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdventureBackpackTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('suffix: $suffix, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EquipmentTableTable extends EquipmentTable
    with TableInfo<$EquipmentTableTable, EquipmentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, name, parentUuid, storedIn, improvements, specialMaterialIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_table';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  EquipmentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
    );
  }

  @override
  $EquipmentTableTable createAlias(String alias) {
    return $EquipmentTableTable(attachedDatabase, alias);
  }
}

class EquipmentTableData extends DataClass
    implements Insertable<EquipmentTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? storedIn;
  final String? improvements;
  final int? specialMaterialIndex;
  const EquipmentTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.storedIn,
      this.improvements,
      this.specialMaterialIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    return map;
  }

  EquipmentTableCompanion toCompanion(bool nullToAbsent) {
    return EquipmentTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
    );
  }

  factory EquipmentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
    };
  }

  EquipmentTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent()}) =>
      EquipmentTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
      );
  EquipmentTableData copyWithCompanion(EquipmentTableCompanion data) {
    return EquipmentTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid, name, parentUuid, storedIn, improvements, specialMaterialIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex);
}

class EquipmentTableCompanion extends UpdateCompanion<EquipmentTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<int> rowid;
  const EquipmentTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EquipmentTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid);
  static Insertable<EquipmentTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EquipmentTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<int>? rowid}) {
    return EquipmentTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AmmunitionTableTable extends AmmunitionTable
    with TableInfo<$AmmunitionTableTable, AmmunitionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AmmunitionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        quantity,
        storedIn,
        price,
        desc,
        improvements,
        specialMaterialIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ammunition_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AmmunitionTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  AmmunitionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AmmunitionTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
    );
  }

  @override
  $AmmunitionTableTable createAlias(String alias) {
    return $AmmunitionTableTable(attachedDatabase, alias);
  }
}

class AmmunitionTableData extends DataClass
    implements Insertable<AmmunitionTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final int quantity;
  final String? storedIn;
  final double? price;
  final String? desc;
  final String? improvements;
  final int? specialMaterialIndex;
  const AmmunitionTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      required this.quantity,
      this.storedIn,
      this.price,
      this.desc,
      this.improvements,
      this.specialMaterialIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    return map;
  }

  AmmunitionTableCompanion toCompanion(bool nullToAbsent) {
    return AmmunitionTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      quantity: Value(quantity),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
    );
  }

  factory AmmunitionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AmmunitionTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      quantity: serializer.fromJson<int>(json['quantity']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      price: serializer.fromJson<double?>(json['price']),
      desc: serializer.fromJson<String?>(json['desc']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'quantity': serializer.toJson<int>(quantity),
      'storedIn': serializer.toJson<String?>(storedIn),
      'price': serializer.toJson<double?>(price),
      'desc': serializer.toJson<String?>(desc),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
    };
  }

  AmmunitionTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          int? quantity,
          Value<String?> storedIn = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent()}) =>
      AmmunitionTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        quantity: quantity ?? this.quantity,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        price: price.present ? price.value : this.price,
        desc: desc.present ? desc.value : this.desc,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
      );
  AmmunitionTableData copyWithCompanion(AmmunitionTableCompanion data) {
    return AmmunitionTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      price: data.price.present ? data.price.value : this.price,
      desc: data.desc.present ? data.desc.value : this.desc,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AmmunitionTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('quantity: $quantity, ')
          ..write('storedIn: $storedIn, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, parentUuid, quantity, storedIn,
      price, desc, improvements, specialMaterialIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AmmunitionTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.quantity == this.quantity &&
          other.storedIn == this.storedIn &&
          other.price == this.price &&
          other.desc == this.desc &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex);
}

class AmmunitionTableCompanion extends UpdateCompanion<AmmunitionTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<int> quantity;
  final Value<String?> storedIn;
  final Value<double?> price;
  final Value<String?> desc;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<int> rowid;
  const AmmunitionTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.quantity = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AmmunitionTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    required int quantity,
    this.storedIn = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        quantity = Value(quantity);
  static Insertable<AmmunitionTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<int>? quantity,
    Expression<String>? storedIn,
    Expression<double>? price,
    Expression<String>? desc,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (quantity != null) 'quantity': quantity,
      if (storedIn != null) 'stored_in': storedIn,
      if (price != null) 'price': price,
      if (desc != null) 'desc': desc,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AmmunitionTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<int>? quantity,
      Value<String?>? storedIn,
      Value<double?>? price,
      Value<String?>? desc,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<int>? rowid}) {
    return AmmunitionTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      quantity: quantity ?? this.quantity,
      storedIn: storedIn ?? this.storedIn,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AmmunitionTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('quantity: $quantity, ')
          ..write('storedIn: $storedIn, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArmorTableTable extends ArmorTable
    with TableInfo<$ArmorTableTable, ArmorTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArmorTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ocupedSpaceMeta =
      const VerificationMeta('ocupedSpace');
  @override
  late final GeneratedColumn<double> ocupedSpace = GeneratedColumn<double>(
      'ocuped_space', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseBonusMeta =
      const VerificationMeta('defenseBonus');
  @override
  late final GeneratedColumn<int> defenseBonus = GeneratedColumn<int>(
      'defense_bonus', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _penaltyMeta =
      const VerificationMeta('penalty');
  @override
  late final GeneratedColumn<int> penalty = GeneratedColumn<int>(
      'penalty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inUseMeta = const VerificationMeta('inUse');
  @override
  late final GeneratedColumn<bool> inUse = GeneratedColumn<bool>(
      'in_use', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_use" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        storedIn,
        improvements,
        specialMaterialIndex,
        price,
        desc,
        ocupedSpace,
        typeIndex,
        defenseBonus,
        penalty,
        inUse
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'armor_table';
  @override
  VerificationContext validateIntegrity(Insertable<ArmorTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('ocuped_space')) {
      context.handle(
          _ocupedSpaceMeta,
          ocupedSpace.isAcceptableOrUnknown(
              data['ocuped_space']!, _ocupedSpaceMeta));
    } else if (isInserting) {
      context.missing(_ocupedSpaceMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('defense_bonus')) {
      context.handle(
          _defenseBonusMeta,
          defenseBonus.isAcceptableOrUnknown(
              data['defense_bonus']!, _defenseBonusMeta));
    } else if (isInserting) {
      context.missing(_defenseBonusMeta);
    }
    if (data.containsKey('penalty')) {
      context.handle(_penaltyMeta,
          penalty.isAcceptableOrUnknown(data['penalty']!, _penaltyMeta));
    } else if (isInserting) {
      context.missing(_penaltyMeta);
    }
    if (data.containsKey('in_use')) {
      context.handle(
          _inUseMeta, inUse.isAcceptableOrUnknown(data['in_use']!, _inUseMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ArmorTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArmorTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      ocupedSpace: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ocuped_space'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      defenseBonus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense_bonus'])!,
      penalty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}penalty'])!,
      inUse: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_use'])!,
    );
  }

  @override
  $ArmorTableTable createAlias(String alias) {
    return $ArmorTableTable(attachedDatabase, alias);
  }
}

class ArmorTableData extends DataClass implements Insertable<ArmorTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? storedIn;
  final String? improvements;
  final int? specialMaterialIndex;
  final double? price;
  final String? desc;
  final double ocupedSpace;
  final int typeIndex;
  final int defenseBonus;
  final int penalty;
  final bool inUse;
  const ArmorTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.storedIn,
      this.improvements,
      this.specialMaterialIndex,
      this.price,
      this.desc,
      required this.ocupedSpace,
      required this.typeIndex,
      required this.defenseBonus,
      required this.penalty,
      required this.inUse});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    map['ocuped_space'] = Variable<double>(ocupedSpace);
    map['type_index'] = Variable<int>(typeIndex);
    map['defense_bonus'] = Variable<int>(defenseBonus);
    map['penalty'] = Variable<int>(penalty);
    map['in_use'] = Variable<bool>(inUse);
    return map;
  }

  ArmorTableCompanion toCompanion(bool nullToAbsent) {
    return ArmorTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      ocupedSpace: Value(ocupedSpace),
      typeIndex: Value(typeIndex),
      defenseBonus: Value(defenseBonus),
      penalty: Value(penalty),
      inUse: Value(inUse),
    );
  }

  factory ArmorTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArmorTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
      price: serializer.fromJson<double?>(json['price']),
      desc: serializer.fromJson<String?>(json['desc']),
      ocupedSpace: serializer.fromJson<double>(json['ocupedSpace']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      defenseBonus: serializer.fromJson<int>(json['defenseBonus']),
      penalty: serializer.fromJson<int>(json['penalty']),
      inUse: serializer.fromJson<bool>(json['inUse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
      'price': serializer.toJson<double?>(price),
      'desc': serializer.toJson<String?>(desc),
      'ocupedSpace': serializer.toJson<double>(ocupedSpace),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'defenseBonus': serializer.toJson<int>(defenseBonus),
      'penalty': serializer.toJson<int>(penalty),
      'inUse': serializer.toJson<bool>(inUse),
    };
  }

  ArmorTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          double? ocupedSpace,
          int? typeIndex,
          int? defenseBonus,
          int? penalty,
          bool? inUse}) =>
      ArmorTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
        price: price.present ? price.value : this.price,
        desc: desc.present ? desc.value : this.desc,
        ocupedSpace: ocupedSpace ?? this.ocupedSpace,
        typeIndex: typeIndex ?? this.typeIndex,
        defenseBonus: defenseBonus ?? this.defenseBonus,
        penalty: penalty ?? this.penalty,
        inUse: inUse ?? this.inUse,
      );
  ArmorTableData copyWithCompanion(ArmorTableCompanion data) {
    return ArmorTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
      price: data.price.present ? data.price.value : this.price,
      desc: data.desc.present ? data.desc.value : this.desc,
      ocupedSpace:
          data.ocupedSpace.present ? data.ocupedSpace.value : this.ocupedSpace,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      defenseBonus: data.defenseBonus.present
          ? data.defenseBonus.value
          : this.defenseBonus,
      penalty: data.penalty.present ? data.penalty.value : this.penalty,
      inUse: data.inUse.present ? data.inUse.value : this.inUse,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArmorTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('defenseBonus: $defenseBonus, ')
          ..write('penalty: $penalty, ')
          ..write('inUse: $inUse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      parentUuid,
      storedIn,
      improvements,
      specialMaterialIndex,
      price,
      desc,
      ocupedSpace,
      typeIndex,
      defenseBonus,
      penalty,
      inUse);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArmorTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex &&
          other.price == this.price &&
          other.desc == this.desc &&
          other.ocupedSpace == this.ocupedSpace &&
          other.typeIndex == this.typeIndex &&
          other.defenseBonus == this.defenseBonus &&
          other.penalty == this.penalty &&
          other.inUse == this.inUse);
}

class ArmorTableCompanion extends UpdateCompanion<ArmorTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<double?> price;
  final Value<String?> desc;
  final Value<double> ocupedSpace;
  final Value<int> typeIndex;
  final Value<int> defenseBonus;
  final Value<int> penalty;
  final Value<bool> inUse;
  final Value<int> rowid;
  const ArmorTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.ocupedSpace = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.defenseBonus = const Value.absent(),
    this.penalty = const Value.absent(),
    this.inUse = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArmorTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    required double ocupedSpace,
    required int typeIndex,
    required int defenseBonus,
    required int penalty,
    this.inUse = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        ocupedSpace = Value(ocupedSpace),
        typeIndex = Value(typeIndex),
        defenseBonus = Value(defenseBonus),
        penalty = Value(penalty);
  static Insertable<ArmorTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<double>? price,
    Expression<String>? desc,
    Expression<double>? ocupedSpace,
    Expression<int>? typeIndex,
    Expression<int>? defenseBonus,
    Expression<int>? penalty,
    Expression<bool>? inUse,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (price != null) 'price': price,
      if (desc != null) 'desc': desc,
      if (ocupedSpace != null) 'ocuped_space': ocupedSpace,
      if (typeIndex != null) 'type_index': typeIndex,
      if (defenseBonus != null) 'defense_bonus': defenseBonus,
      if (penalty != null) 'penalty': penalty,
      if (inUse != null) 'in_use': inUse,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArmorTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<double?>? price,
      Value<String?>? desc,
      Value<double>? ocupedSpace,
      Value<int>? typeIndex,
      Value<int>? defenseBonus,
      Value<int>? penalty,
      Value<bool>? inUse,
      Value<int>? rowid}) {
    return ArmorTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      ocupedSpace: ocupedSpace ?? this.ocupedSpace,
      typeIndex: typeIndex ?? this.typeIndex,
      defenseBonus: defenseBonus ?? this.defenseBonus,
      penalty: penalty ?? this.penalty,
      inUse: inUse ?? this.inUse,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (ocupedSpace.present) {
      map['ocuped_space'] = Variable<double>(ocupedSpace.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (defenseBonus.present) {
      map['defense_bonus'] = Variable<int>(defenseBonus.value);
    }
    if (penalty.present) {
      map['penalty'] = Variable<int>(penalty.value);
    }
    if (inUse.present) {
      map['in_use'] = Variable<bool>(inUse.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmorTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('defenseBonus: $defenseBonus, ')
          ..write('penalty: $penalty, ')
          ..write('inUse: $inUse, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackpackTableTable extends BackpackTable
    with TableInfo<$BackpackTableTable, BackpackTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackpackTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
      'suffix', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uuid, name, parentUuid, suffix, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backpack_table';
  @override
  VerificationContext validateIntegrity(Insertable<BackpackTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('suffix')) {
      context.handle(_suffixMeta,
          suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  BackpackTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackpackTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      suffix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suffix']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $BackpackTableTable createAlias(String alias) {
    return $BackpackTableTable(attachedDatabase, alias);
  }
}

class BackpackTableData extends DataClass
    implements Insertable<BackpackTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? suffix;
  final double? price;
  const BackpackTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.suffix,
      this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  BackpackTableCompanion toCompanion(bool nullToAbsent) {
    return BackpackTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      suffix:
          suffix == null && nullToAbsent ? const Value.absent() : Value(suffix),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory BackpackTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackpackTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'suffix': serializer.toJson<String?>(suffix),
      'price': serializer.toJson<double?>(price),
    };
  }

  BackpackTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> suffix = const Value.absent(),
          Value<double?> price = const Value.absent()}) =>
      BackpackTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        suffix: suffix.present ? suffix.value : this.suffix,
        price: price.present ? price.value : this.price,
      );
  BackpackTableData copyWithCompanion(BackpackTableCompanion data) {
    return BackpackTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackpackTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('suffix: $suffix, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, parentUuid, suffix, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackpackTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.suffix == this.suffix &&
          other.price == this.price);
}

class BackpackTableCompanion extends UpdateCompanion<BackpackTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> suffix;
  final Value<double?> price;
  final Value<int> rowid;
  const BackpackTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.suffix = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackpackTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.suffix = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid);
  static Insertable<BackpackTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? suffix,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (suffix != null) 'suffix': suffix,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackpackTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? suffix,
      Value<double?>? price,
      Value<int>? rowid}) {
    return BackpackTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      suffix: suffix ?? this.suffix,
      price: price ?? this.price,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackpackTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('suffix: $suffix, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeneralItemTableTable extends GeneralItemTable
    with TableInfo<$GeneralItemTableTable, GeneralItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneralItemTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ocupedSpaceMeta =
      const VerificationMeta('ocupedSpace');
  @override
  late final GeneratedColumn<double> ocupedSpace = GeneratedColumn<double>(
      'ocuped_space', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        storedIn,
        improvements,
        specialMaterialIndex,
        price,
        desc,
        ocupedSpace,
        typeIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'general_item_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GeneralItemTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('ocuped_space')) {
      context.handle(
          _ocupedSpaceMeta,
          ocupedSpace.isAcceptableOrUnknown(
              data['ocuped_space']!, _ocupedSpaceMeta));
    } else if (isInserting) {
      context.missing(_ocupedSpaceMeta);
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
  GeneralItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneralItemTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      ocupedSpace: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ocuped_space'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $GeneralItemTableTable createAlias(String alias) {
    return $GeneralItemTableTable(attachedDatabase, alias);
  }
}

class GeneralItemTableData extends DataClass
    implements Insertable<GeneralItemTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? storedIn;
  final String? improvements;
  final int? specialMaterialIndex;
  final double? price;
  final String? desc;
  final double ocupedSpace;
  final int typeIndex;
  const GeneralItemTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.storedIn,
      this.improvements,
      this.specialMaterialIndex,
      this.price,
      this.desc,
      required this.ocupedSpace,
      required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    map['ocuped_space'] = Variable<double>(ocupedSpace);
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  GeneralItemTableCompanion toCompanion(bool nullToAbsent) {
    return GeneralItemTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      ocupedSpace: Value(ocupedSpace),
      typeIndex: Value(typeIndex),
    );
  }

  factory GeneralItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneralItemTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
      price: serializer.fromJson<double?>(json['price']),
      desc: serializer.fromJson<String?>(json['desc']),
      ocupedSpace: serializer.fromJson<double>(json['ocupedSpace']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
      'price': serializer.toJson<double?>(price),
      'desc': serializer.toJson<String?>(desc),
      'ocupedSpace': serializer.toJson<double>(ocupedSpace),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  GeneralItemTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          double? ocupedSpace,
          int? typeIndex}) =>
      GeneralItemTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
        price: price.present ? price.value : this.price,
        desc: desc.present ? desc.value : this.desc,
        ocupedSpace: ocupedSpace ?? this.ocupedSpace,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  GeneralItemTableData copyWithCompanion(GeneralItemTableCompanion data) {
    return GeneralItemTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
      price: data.price.present ? data.price.value : this.price,
      desc: data.desc.present ? data.desc.value : this.desc,
      ocupedSpace:
          data.ocupedSpace.present ? data.ocupedSpace.value : this.ocupedSpace,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneralItemTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, parentUuid, storedIn,
      improvements, specialMaterialIndex, price, desc, ocupedSpace, typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneralItemTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex &&
          other.price == this.price &&
          other.desc == this.desc &&
          other.ocupedSpace == this.ocupedSpace &&
          other.typeIndex == this.typeIndex);
}

class GeneralItemTableCompanion extends UpdateCompanion<GeneralItemTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<double?> price;
  final Value<String?> desc;
  final Value<double> ocupedSpace;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const GeneralItemTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.ocupedSpace = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeneralItemTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    required double ocupedSpace,
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        ocupedSpace = Value(ocupedSpace),
        typeIndex = Value(typeIndex);
  static Insertable<GeneralItemTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<double>? price,
    Expression<String>? desc,
    Expression<double>? ocupedSpace,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (price != null) 'price': price,
      if (desc != null) 'desc': desc,
      if (ocupedSpace != null) 'ocuped_space': ocupedSpace,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeneralItemTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<double?>? price,
      Value<String?>? desc,
      Value<double>? ocupedSpace,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return GeneralItemTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      ocupedSpace: ocupedSpace ?? this.ocupedSpace,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (ocupedSpace.present) {
      map['ocuped_space'] = Variable<double>(ocupedSpace.value);
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
    return (StringBuffer('GeneralItemTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeneralSkillTableTable extends GeneralSkillTable
    with TableInfo<$GeneralSkillTableTable, GeneralSkillTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneralSkillTableTable(this.attachedDatabase, [this._alias]);
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
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, name, desc, parentUuid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'general_skill_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GeneralSkillTableData> instance,
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
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  GeneralSkillTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneralSkillTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
    );
  }

  @override
  $GeneralSkillTableTable createAlias(String alias) {
    return $GeneralSkillTableTable(attachedDatabase, alias);
  }
}

class GeneralSkillTableData extends DataClass
    implements Insertable<GeneralSkillTableData> {
  final String uuid;
  final String name;
  final String desc;
  final String parentUuid;
  const GeneralSkillTableData(
      {required this.uuid,
      required this.name,
      required this.desc,
      required this.parentUuid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['parent_uuid'] = Variable<String>(parentUuid);
    return map;
  }

  GeneralSkillTableCompanion toCompanion(bool nullToAbsent) {
    return GeneralSkillTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      desc: Value(desc),
      parentUuid: Value(parentUuid),
    );
  }

  factory GeneralSkillTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneralSkillTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'parentUuid': serializer.toJson<String>(parentUuid),
    };
  }

  GeneralSkillTableData copyWith(
          {String? uuid, String? name, String? desc, String? parentUuid}) =>
      GeneralSkillTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        parentUuid: parentUuid ?? this.parentUuid,
      );
  GeneralSkillTableData copyWithCompanion(GeneralSkillTableCompanion data) {
    return GeneralSkillTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneralSkillTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('parentUuid: $parentUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, desc, parentUuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneralSkillTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.parentUuid == this.parentUuid);
}

class GeneralSkillTableCompanion
    extends UpdateCompanion<GeneralSkillTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> desc;
  final Value<String> parentUuid;
  final Value<int> rowid;
  const GeneralSkillTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeneralSkillTableCompanion.insert({
    required String uuid,
    required String name,
    required String desc,
    required String parentUuid,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        desc = Value(desc),
        parentUuid = Value(parentUuid);
  static Insertable<GeneralSkillTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? parentUuid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeneralSkillTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? desc,
      Value<String>? parentUuid,
      Value<int>? rowid}) {
    return GeneralSkillTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      parentUuid: parentUuid ?? this.parentUuid,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneralSkillTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MagicMenaceTableTable extends MagicMenaceTable
    with TableInfo<$MagicMenaceTableTable, MagicMenaceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MagicMenaceTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _resumedDescMeta =
      const VerificationMeta('resumedDesc');
  @override
  late final GeneratedColumn<String> resumedDesc = GeneratedColumn<String>(
      'resumed_desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _menaceUuidMeta =
      const VerificationMeta('menaceUuid');
  @override
  late final GeneratedColumn<String> menaceUuid = GeneratedColumn<String>(
      'menace_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _magicBaseIdMeta =
      const VerificationMeta('magicBaseId');
  @override
  late final GeneratedColumn<int> magicBaseId = GeneratedColumn<int>(
      'magic_base_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pmMeta = const VerificationMeta('pm');
  @override
  late final GeneratedColumn<int> pm = GeneratedColumn<int>(
      'pm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cdMeta = const VerificationMeta('cd');
  @override
  late final GeneratedColumn<int> cd = GeneratedColumn<int>(
      'cd', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mediumDamageValueMeta =
      const VerificationMeta('mediumDamageValue');
  @override
  late final GeneratedColumn<int> mediumDamageValue = GeneratedColumn<int>(
      'medium_damage_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _damageDicesMeta =
      const VerificationMeta('damageDices');
  @override
  late final GeneratedColumn<String> damageDices = GeneratedColumn<String>(
      'damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDamageDicesMeta =
      const VerificationMeta('extraDamageDices');
  @override
  late final GeneratedColumn<String> extraDamageDices = GeneratedColumn<String>(
      'extra_damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        resumedDesc,
        menaceUuid,
        magicBaseId,
        pm,
        cd,
        mediumDamageValue,
        damageDices,
        extraDamageDices
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'magic_menace_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MagicMenaceTableData> instance,
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
    if (data.containsKey('resumed_desc')) {
      context.handle(
          _resumedDescMeta,
          resumedDesc.isAcceptableOrUnknown(
              data['resumed_desc']!, _resumedDescMeta));
    } else if (isInserting) {
      context.missing(_resumedDescMeta);
    }
    if (data.containsKey('menace_uuid')) {
      context.handle(
          _menaceUuidMeta,
          menaceUuid.isAcceptableOrUnknown(
              data['menace_uuid']!, _menaceUuidMeta));
    } else if (isInserting) {
      context.missing(_menaceUuidMeta);
    }
    if (data.containsKey('magic_base_id')) {
      context.handle(
          _magicBaseIdMeta,
          magicBaseId.isAcceptableOrUnknown(
              data['magic_base_id']!, _magicBaseIdMeta));
    } else if (isInserting) {
      context.missing(_magicBaseIdMeta);
    }
    if (data.containsKey('pm')) {
      context.handle(_pmMeta, pm.isAcceptableOrUnknown(data['pm']!, _pmMeta));
    }
    if (data.containsKey('cd')) {
      context.handle(_cdMeta, cd.isAcceptableOrUnknown(data['cd']!, _cdMeta));
    }
    if (data.containsKey('medium_damage_value')) {
      context.handle(
          _mediumDamageValueMeta,
          mediumDamageValue.isAcceptableOrUnknown(
              data['medium_damage_value']!, _mediumDamageValueMeta));
    }
    if (data.containsKey('damage_dices')) {
      context.handle(
          _damageDicesMeta,
          damageDices.isAcceptableOrUnknown(
              data['damage_dices']!, _damageDicesMeta));
    }
    if (data.containsKey('extra_damage_dices')) {
      context.handle(
          _extraDamageDicesMeta,
          extraDamageDices.isAcceptableOrUnknown(
              data['extra_damage_dices']!, _extraDamageDicesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  MagicMenaceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MagicMenaceTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      resumedDesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resumed_desc'])!,
      menaceUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}menace_uuid'])!,
      magicBaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_base_id'])!,
      pm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pm']),
      cd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cd']),
      mediumDamageValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medium_damage_value']),
      damageDices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_dices']),
      extraDamageDices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_damage_dices']),
    );
  }

  @override
  $MagicMenaceTableTable createAlias(String alias) {
    return $MagicMenaceTableTable(attachedDatabase, alias);
  }
}

class MagicMenaceTableData extends DataClass
    implements Insertable<MagicMenaceTableData> {
  final String uuid;
  final String name;
  final String resumedDesc;
  final String menaceUuid;
  final int magicBaseId;
  final int? pm;
  final int? cd;
  final int? mediumDamageValue;
  final String? damageDices;
  final String? extraDamageDices;
  const MagicMenaceTableData(
      {required this.uuid,
      required this.name,
      required this.resumedDesc,
      required this.menaceUuid,
      required this.magicBaseId,
      this.pm,
      this.cd,
      this.mediumDamageValue,
      this.damageDices,
      this.extraDamageDices});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['resumed_desc'] = Variable<String>(resumedDesc);
    map['menace_uuid'] = Variable<String>(menaceUuid);
    map['magic_base_id'] = Variable<int>(magicBaseId);
    if (!nullToAbsent || pm != null) {
      map['pm'] = Variable<int>(pm);
    }
    if (!nullToAbsent || cd != null) {
      map['cd'] = Variable<int>(cd);
    }
    if (!nullToAbsent || mediumDamageValue != null) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue);
    }
    if (!nullToAbsent || damageDices != null) {
      map['damage_dices'] = Variable<String>(damageDices);
    }
    if (!nullToAbsent || extraDamageDices != null) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices);
    }
    return map;
  }

  MagicMenaceTableCompanion toCompanion(bool nullToAbsent) {
    return MagicMenaceTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      resumedDesc: Value(resumedDesc),
      menaceUuid: Value(menaceUuid),
      magicBaseId: Value(magicBaseId),
      pm: pm == null && nullToAbsent ? const Value.absent() : Value(pm),
      cd: cd == null && nullToAbsent ? const Value.absent() : Value(cd),
      mediumDamageValue: mediumDamageValue == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumDamageValue),
      damageDices: damageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(damageDices),
      extraDamageDices: extraDamageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(extraDamageDices),
    );
  }

  factory MagicMenaceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MagicMenaceTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      resumedDesc: serializer.fromJson<String>(json['resumedDesc']),
      menaceUuid: serializer.fromJson<String>(json['menaceUuid']),
      magicBaseId: serializer.fromJson<int>(json['magicBaseId']),
      pm: serializer.fromJson<int?>(json['pm']),
      cd: serializer.fromJson<int?>(json['cd']),
      mediumDamageValue: serializer.fromJson<int?>(json['mediumDamageValue']),
      damageDices: serializer.fromJson<String?>(json['damageDices']),
      extraDamageDices: serializer.fromJson<String?>(json['extraDamageDices']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'resumedDesc': serializer.toJson<String>(resumedDesc),
      'menaceUuid': serializer.toJson<String>(menaceUuid),
      'magicBaseId': serializer.toJson<int>(magicBaseId),
      'pm': serializer.toJson<int?>(pm),
      'cd': serializer.toJson<int?>(cd),
      'mediumDamageValue': serializer.toJson<int?>(mediumDamageValue),
      'damageDices': serializer.toJson<String?>(damageDices),
      'extraDamageDices': serializer.toJson<String?>(extraDamageDices),
    };
  }

  MagicMenaceTableData copyWith(
          {String? uuid,
          String? name,
          String? resumedDesc,
          String? menaceUuid,
          int? magicBaseId,
          Value<int?> pm = const Value.absent(),
          Value<int?> cd = const Value.absent(),
          Value<int?> mediumDamageValue = const Value.absent(),
          Value<String?> damageDices = const Value.absent(),
          Value<String?> extraDamageDices = const Value.absent()}) =>
      MagicMenaceTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        resumedDesc: resumedDesc ?? this.resumedDesc,
        menaceUuid: menaceUuid ?? this.menaceUuid,
        magicBaseId: magicBaseId ?? this.magicBaseId,
        pm: pm.present ? pm.value : this.pm,
        cd: cd.present ? cd.value : this.cd,
        mediumDamageValue: mediumDamageValue.present
            ? mediumDamageValue.value
            : this.mediumDamageValue,
        damageDices: damageDices.present ? damageDices.value : this.damageDices,
        extraDamageDices: extraDamageDices.present
            ? extraDamageDices.value
            : this.extraDamageDices,
      );
  MagicMenaceTableData copyWithCompanion(MagicMenaceTableCompanion data) {
    return MagicMenaceTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      resumedDesc:
          data.resumedDesc.present ? data.resumedDesc.value : this.resumedDesc,
      menaceUuid:
          data.menaceUuid.present ? data.menaceUuid.value : this.menaceUuid,
      magicBaseId:
          data.magicBaseId.present ? data.magicBaseId.value : this.magicBaseId,
      pm: data.pm.present ? data.pm.value : this.pm,
      cd: data.cd.present ? data.cd.value : this.cd,
      mediumDamageValue: data.mediumDamageValue.present
          ? data.mediumDamageValue.value
          : this.mediumDamageValue,
      damageDices:
          data.damageDices.present ? data.damageDices.value : this.damageDices,
      extraDamageDices: data.extraDamageDices.present
          ? data.extraDamageDices.value
          : this.extraDamageDices,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MagicMenaceTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('resumedDesc: $resumedDesc, ')
          ..write('menaceUuid: $menaceUuid, ')
          ..write('magicBaseId: $magicBaseId, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, resumedDesc, menaceUuid,
      magicBaseId, pm, cd, mediumDamageValue, damageDices, extraDamageDices);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MagicMenaceTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.resumedDesc == this.resumedDesc &&
          other.menaceUuid == this.menaceUuid &&
          other.magicBaseId == this.magicBaseId &&
          other.pm == this.pm &&
          other.cd == this.cd &&
          other.mediumDamageValue == this.mediumDamageValue &&
          other.damageDices == this.damageDices &&
          other.extraDamageDices == this.extraDamageDices);
}

class MagicMenaceTableCompanion extends UpdateCompanion<MagicMenaceTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> resumedDesc;
  final Value<String> menaceUuid;
  final Value<int> magicBaseId;
  final Value<int?> pm;
  final Value<int?> cd;
  final Value<int?> mediumDamageValue;
  final Value<String?> damageDices;
  final Value<String?> extraDamageDices;
  final Value<int> rowid;
  const MagicMenaceTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.resumedDesc = const Value.absent(),
    this.menaceUuid = const Value.absent(),
    this.magicBaseId = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MagicMenaceTableCompanion.insert({
    required String uuid,
    required String name,
    required String resumedDesc,
    required String menaceUuid,
    required int magicBaseId,
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        resumedDesc = Value(resumedDesc),
        menaceUuid = Value(menaceUuid),
        magicBaseId = Value(magicBaseId);
  static Insertable<MagicMenaceTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? resumedDesc,
    Expression<String>? menaceUuid,
    Expression<int>? magicBaseId,
    Expression<int>? pm,
    Expression<int>? cd,
    Expression<int>? mediumDamageValue,
    Expression<String>? damageDices,
    Expression<String>? extraDamageDices,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (resumedDesc != null) 'resumed_desc': resumedDesc,
      if (menaceUuid != null) 'menace_uuid': menaceUuid,
      if (magicBaseId != null) 'magic_base_id': magicBaseId,
      if (pm != null) 'pm': pm,
      if (cd != null) 'cd': cd,
      if (mediumDamageValue != null) 'medium_damage_value': mediumDamageValue,
      if (damageDices != null) 'damage_dices': damageDices,
      if (extraDamageDices != null) 'extra_damage_dices': extraDamageDices,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MagicMenaceTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? resumedDesc,
      Value<String>? menaceUuid,
      Value<int>? magicBaseId,
      Value<int?>? pm,
      Value<int?>? cd,
      Value<int?>? mediumDamageValue,
      Value<String?>? damageDices,
      Value<String?>? extraDamageDices,
      Value<int>? rowid}) {
    return MagicMenaceTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      resumedDesc: resumedDesc ?? this.resumedDesc,
      menaceUuid: menaceUuid ?? this.menaceUuid,
      magicBaseId: magicBaseId ?? this.magicBaseId,
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
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
    if (resumedDesc.present) {
      map['resumed_desc'] = Variable<String>(resumedDesc.value);
    }
    if (menaceUuid.present) {
      map['menace_uuid'] = Variable<String>(menaceUuid.value);
    }
    if (magicBaseId.present) {
      map['magic_base_id'] = Variable<int>(magicBaseId.value);
    }
    if (pm.present) {
      map['pm'] = Variable<int>(pm.value);
    }
    if (cd.present) {
      map['cd'] = Variable<int>(cd.value);
    }
    if (mediumDamageValue.present) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue.value);
    }
    if (damageDices.present) {
      map['damage_dices'] = Variable<String>(damageDices.value);
    }
    if (extraDamageDices.present) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MagicMenaceTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('resumedDesc: $resumedDesc, ')
          ..write('menaceUuid: $menaceUuid, ')
          ..write('magicBaseId: $magicBaseId, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SaddlebagTableTable extends SaddlebagTable
    with TableInfo<$SaddlebagTableTable, SaddlebagTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaddlebagTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uuid, name, parentUuid, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saddlebag_table';
  @override
  VerificationContext validateIntegrity(Insertable<SaddlebagTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  SaddlebagTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaddlebagTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $SaddlebagTableTable createAlias(String alias) {
    return $SaddlebagTableTable(attachedDatabase, alias);
  }
}

class SaddlebagTableData extends DataClass
    implements Insertable<SaddlebagTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final double? price;
  const SaddlebagTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  SaddlebagTableCompanion toCompanion(bool nullToAbsent) {
    return SaddlebagTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory SaddlebagTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaddlebagTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'price': serializer.toJson<double?>(price),
    };
  }

  SaddlebagTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<double?> price = const Value.absent()}) =>
      SaddlebagTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        price: price.present ? price.value : this.price,
      );
  SaddlebagTableData copyWithCompanion(SaddlebagTableCompanion data) {
    return SaddlebagTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaddlebagTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, parentUuid, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaddlebagTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.price == this.price);
}

class SaddlebagTableCompanion extends UpdateCompanion<SaddlebagTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<double?> price;
  final Value<int> rowid;
  const SaddlebagTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SaddlebagTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid);
  static Insertable<SaddlebagTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SaddlebagTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<double?>? price,
      Value<int>? rowid}) {
    return SaddlebagTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      price: price ?? this.price,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaddlebagTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShieldTableTable extends ShieldTable
    with TableInfo<$ShieldTableTable, ShieldTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShieldTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ocupedSpaceMeta =
      const VerificationMeta('ocupedSpace');
  @override
  late final GeneratedColumn<double> ocupedSpace = GeneratedColumn<double>(
      'ocuped_space', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseBonusMeta =
      const VerificationMeta('defenseBonus');
  @override
  late final GeneratedColumn<int> defenseBonus = GeneratedColumn<int>(
      'defense_bonus', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _penaltyMeta =
      const VerificationMeta('penalty');
  @override
  late final GeneratedColumn<int> penalty = GeneratedColumn<int>(
      'penalty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inUseMeta = const VerificationMeta('inUse');
  @override
  late final GeneratedColumn<bool> inUse = GeneratedColumn<bool>(
      'in_use', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_use" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        storedIn,
        improvements,
        specialMaterialIndex,
        price,
        desc,
        ocupedSpace,
        typeIndex,
        defenseBonus,
        penalty,
        inUse
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shield_table';
  @override
  VerificationContext validateIntegrity(Insertable<ShieldTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('ocuped_space')) {
      context.handle(
          _ocupedSpaceMeta,
          ocupedSpace.isAcceptableOrUnknown(
              data['ocuped_space']!, _ocupedSpaceMeta));
    } else if (isInserting) {
      context.missing(_ocupedSpaceMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('defense_bonus')) {
      context.handle(
          _defenseBonusMeta,
          defenseBonus.isAcceptableOrUnknown(
              data['defense_bonus']!, _defenseBonusMeta));
    } else if (isInserting) {
      context.missing(_defenseBonusMeta);
    }
    if (data.containsKey('penalty')) {
      context.handle(_penaltyMeta,
          penalty.isAcceptableOrUnknown(data['penalty']!, _penaltyMeta));
    } else if (isInserting) {
      context.missing(_penaltyMeta);
    }
    if (data.containsKey('in_use')) {
      context.handle(
          _inUseMeta, inUse.isAcceptableOrUnknown(data['in_use']!, _inUseMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ShieldTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShieldTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      ocupedSpace: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ocuped_space'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      defenseBonus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense_bonus'])!,
      penalty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}penalty'])!,
      inUse: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_use'])!,
    );
  }

  @override
  $ShieldTableTable createAlias(String alias) {
    return $ShieldTableTable(attachedDatabase, alias);
  }
}

class ShieldTableData extends DataClass implements Insertable<ShieldTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? storedIn;
  final String? improvements;
  final int? specialMaterialIndex;
  final double? price;
  final String? desc;
  final double ocupedSpace;
  final int typeIndex;
  final int defenseBonus;
  final int penalty;
  final bool inUse;
  const ShieldTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.storedIn,
      this.improvements,
      this.specialMaterialIndex,
      this.price,
      this.desc,
      required this.ocupedSpace,
      required this.typeIndex,
      required this.defenseBonus,
      required this.penalty,
      required this.inUse});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    map['ocuped_space'] = Variable<double>(ocupedSpace);
    map['type_index'] = Variable<int>(typeIndex);
    map['defense_bonus'] = Variable<int>(defenseBonus);
    map['penalty'] = Variable<int>(penalty);
    map['in_use'] = Variable<bool>(inUse);
    return map;
  }

  ShieldTableCompanion toCompanion(bool nullToAbsent) {
    return ShieldTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      ocupedSpace: Value(ocupedSpace),
      typeIndex: Value(typeIndex),
      defenseBonus: Value(defenseBonus),
      penalty: Value(penalty),
      inUse: Value(inUse),
    );
  }

  factory ShieldTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShieldTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
      price: serializer.fromJson<double?>(json['price']),
      desc: serializer.fromJson<String?>(json['desc']),
      ocupedSpace: serializer.fromJson<double>(json['ocupedSpace']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      defenseBonus: serializer.fromJson<int>(json['defenseBonus']),
      penalty: serializer.fromJson<int>(json['penalty']),
      inUse: serializer.fromJson<bool>(json['inUse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
      'price': serializer.toJson<double?>(price),
      'desc': serializer.toJson<String?>(desc),
      'ocupedSpace': serializer.toJson<double>(ocupedSpace),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'defenseBonus': serializer.toJson<int>(defenseBonus),
      'penalty': serializer.toJson<int>(penalty),
      'inUse': serializer.toJson<bool>(inUse),
    };
  }

  ShieldTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          double? ocupedSpace,
          int? typeIndex,
          int? defenseBonus,
          int? penalty,
          bool? inUse}) =>
      ShieldTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
        price: price.present ? price.value : this.price,
        desc: desc.present ? desc.value : this.desc,
        ocupedSpace: ocupedSpace ?? this.ocupedSpace,
        typeIndex: typeIndex ?? this.typeIndex,
        defenseBonus: defenseBonus ?? this.defenseBonus,
        penalty: penalty ?? this.penalty,
        inUse: inUse ?? this.inUse,
      );
  ShieldTableData copyWithCompanion(ShieldTableCompanion data) {
    return ShieldTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
      price: data.price.present ? data.price.value : this.price,
      desc: data.desc.present ? data.desc.value : this.desc,
      ocupedSpace:
          data.ocupedSpace.present ? data.ocupedSpace.value : this.ocupedSpace,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      defenseBonus: data.defenseBonus.present
          ? data.defenseBonus.value
          : this.defenseBonus,
      penalty: data.penalty.present ? data.penalty.value : this.penalty,
      inUse: data.inUse.present ? data.inUse.value : this.inUse,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShieldTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('defenseBonus: $defenseBonus, ')
          ..write('penalty: $penalty, ')
          ..write('inUse: $inUse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      parentUuid,
      storedIn,
      improvements,
      specialMaterialIndex,
      price,
      desc,
      ocupedSpace,
      typeIndex,
      defenseBonus,
      penalty,
      inUse);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShieldTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex &&
          other.price == this.price &&
          other.desc == this.desc &&
          other.ocupedSpace == this.ocupedSpace &&
          other.typeIndex == this.typeIndex &&
          other.defenseBonus == this.defenseBonus &&
          other.penalty == this.penalty &&
          other.inUse == this.inUse);
}

class ShieldTableCompanion extends UpdateCompanion<ShieldTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<double?> price;
  final Value<String?> desc;
  final Value<double> ocupedSpace;
  final Value<int> typeIndex;
  final Value<int> defenseBonus;
  final Value<int> penalty;
  final Value<bool> inUse;
  final Value<int> rowid;
  const ShieldTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.ocupedSpace = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.defenseBonus = const Value.absent(),
    this.penalty = const Value.absent(),
    this.inUse = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShieldTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    required double ocupedSpace,
    required int typeIndex,
    required int defenseBonus,
    required int penalty,
    this.inUse = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        ocupedSpace = Value(ocupedSpace),
        typeIndex = Value(typeIndex),
        defenseBonus = Value(defenseBonus),
        penalty = Value(penalty);
  static Insertable<ShieldTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<double>? price,
    Expression<String>? desc,
    Expression<double>? ocupedSpace,
    Expression<int>? typeIndex,
    Expression<int>? defenseBonus,
    Expression<int>? penalty,
    Expression<bool>? inUse,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (price != null) 'price': price,
      if (desc != null) 'desc': desc,
      if (ocupedSpace != null) 'ocuped_space': ocupedSpace,
      if (typeIndex != null) 'type_index': typeIndex,
      if (defenseBonus != null) 'defense_bonus': defenseBonus,
      if (penalty != null) 'penalty': penalty,
      if (inUse != null) 'in_use': inUse,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShieldTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<double?>? price,
      Value<String?>? desc,
      Value<double>? ocupedSpace,
      Value<int>? typeIndex,
      Value<int>? defenseBonus,
      Value<int>? penalty,
      Value<bool>? inUse,
      Value<int>? rowid}) {
    return ShieldTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      ocupedSpace: ocupedSpace ?? this.ocupedSpace,
      typeIndex: typeIndex ?? this.typeIndex,
      defenseBonus: defenseBonus ?? this.defenseBonus,
      penalty: penalty ?? this.penalty,
      inUse: inUse ?? this.inUse,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (ocupedSpace.present) {
      map['ocuped_space'] = Variable<double>(ocupedSpace.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (defenseBonus.present) {
      map['defense_bonus'] = Variable<int>(defenseBonus.value);
    }
    if (penalty.present) {
      map['penalty'] = Variable<int>(penalty.value);
    }
    if (inUse.present) {
      map['in_use'] = Variable<bool>(inUse.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShieldTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('defenseBonus: $defenseBonus, ')
          ..write('penalty: $penalty, ')
          ..write('inUse: $inUse, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TibarsTableTable extends TibarsTable
    with TableInfo<$TibarsTableTable, TibarsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TibarsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _goldMeta = const VerificationMeta('gold');
  @override
  late final GeneratedColumn<int> gold = GeneratedColumn<int>(
      'gold', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _silverMeta = const VerificationMeta('silver');
  @override
  late final GeneratedColumn<int> silver = GeneratedColumn<int>(
      'silver', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bronzeMeta = const VerificationMeta('bronze');
  @override
  late final GeneratedColumn<int> bronze = GeneratedColumn<int>(
      'bronze', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, parentUuid, storedIn, gold, silver, bronze];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tibars_table';
  @override
  VerificationContext validateIntegrity(Insertable<TibarsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('gold')) {
      context.handle(
          _goldMeta, gold.isAcceptableOrUnknown(data['gold']!, _goldMeta));
    } else if (isInserting) {
      context.missing(_goldMeta);
    }
    if (data.containsKey('silver')) {
      context.handle(_silverMeta,
          silver.isAcceptableOrUnknown(data['silver']!, _silverMeta));
    } else if (isInserting) {
      context.missing(_silverMeta);
    }
    if (data.containsKey('bronze')) {
      context.handle(_bronzeMeta,
          bronze.isAcceptableOrUnknown(data['bronze']!, _bronzeMeta));
    } else if (isInserting) {
      context.missing(_bronzeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  TibarsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TibarsTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      gold: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gold'])!,
      silver: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}silver'])!,
      bronze: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bronze'])!,
    );
  }

  @override
  $TibarsTableTable createAlias(String alias) {
    return $TibarsTableTable(attachedDatabase, alias);
  }
}

class TibarsTableData extends DataClass implements Insertable<TibarsTableData> {
  final String uuid;
  final String parentUuid;
  final String? storedIn;
  final int gold;
  final int silver;
  final int bronze;
  const TibarsTableData(
      {required this.uuid,
      required this.parentUuid,
      this.storedIn,
      required this.gold,
      required this.silver,
      required this.bronze});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    map['gold'] = Variable<int>(gold);
    map['silver'] = Variable<int>(silver);
    map['bronze'] = Variable<int>(bronze);
    return map;
  }

  TibarsTableCompanion toCompanion(bool nullToAbsent) {
    return TibarsTableCompanion(
      uuid: Value(uuid),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      gold: Value(gold),
      silver: Value(silver),
      bronze: Value(bronze),
    );
  }

  factory TibarsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TibarsTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      gold: serializer.fromJson<int>(json['gold']),
      silver: serializer.fromJson<int>(json['silver']),
      bronze: serializer.fromJson<int>(json['bronze']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'gold': serializer.toJson<int>(gold),
      'silver': serializer.toJson<int>(silver),
      'bronze': serializer.toJson<int>(bronze),
    };
  }

  TibarsTableData copyWith(
          {String? uuid,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          int? gold,
          int? silver,
          int? bronze}) =>
      TibarsTableData(
        uuid: uuid ?? this.uuid,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        gold: gold ?? this.gold,
        silver: silver ?? this.silver,
        bronze: bronze ?? this.bronze,
      );
  TibarsTableData copyWithCompanion(TibarsTableCompanion data) {
    return TibarsTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      gold: data.gold.present ? data.gold.value : this.gold,
      silver: data.silver.present ? data.silver.value : this.silver,
      bronze: data.bronze.present ? data.bronze.value : this.bronze,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TibarsTableData(')
          ..write('uuid: $uuid, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('gold: $gold, ')
          ..write('silver: $silver, ')
          ..write('bronze: $bronze')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, parentUuid, storedIn, gold, silver, bronze);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TibarsTableData &&
          other.uuid == this.uuid &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.gold == this.gold &&
          other.silver == this.silver &&
          other.bronze == this.bronze);
}

class TibarsTableCompanion extends UpdateCompanion<TibarsTableData> {
  final Value<String> uuid;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<int> gold;
  final Value<int> silver;
  final Value<int> bronze;
  final Value<int> rowid;
  const TibarsTableCompanion({
    this.uuid = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.gold = const Value.absent(),
    this.silver = const Value.absent(),
    this.bronze = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TibarsTableCompanion.insert({
    required String uuid,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    required int gold,
    required int silver,
    required int bronze,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        parentUuid = Value(parentUuid),
        gold = Value(gold),
        silver = Value(silver),
        bronze = Value(bronze);
  static Insertable<TibarsTableData> custom({
    Expression<String>? uuid,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<int>? gold,
    Expression<int>? silver,
    Expression<int>? bronze,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (gold != null) 'gold': gold,
      if (silver != null) 'silver': silver,
      if (bronze != null) 'bronze': bronze,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TibarsTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<int>? gold,
      Value<int>? silver,
      Value<int>? bronze,
      Value<int>? rowid}) {
    return TibarsTableCompanion(
      uuid: uuid ?? this.uuid,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      gold: gold ?? this.gold,
      silver: silver ?? this.silver,
      bronze: bronze ?? this.bronze,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (gold.present) {
      map['gold'] = Variable<int>(gold.value);
    }
    if (silver.present) {
      map['silver'] = Variable<int>(silver.value);
    }
    if (bronze.present) {
      map['bronze'] = Variable<int>(bronze.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TibarsTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('gold: $gold, ')
          ..write('silver: $silver, ')
          ..write('bronze: $bronze, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeaponTableTable extends WeaponTable
    with TableInfo<$WeaponTableTable, WeaponTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeaponTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storedInMeta =
      const VerificationMeta('storedIn');
  @override
  late final GeneratedColumn<String> storedIn = GeneratedColumn<String>(
      'stored_in', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementsMeta =
      const VerificationMeta('improvements');
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
      'improvements', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialMaterialIndexMeta =
      const VerificationMeta('specialMaterialIndex');
  @override
  late final GeneratedColumn<int> specialMaterialIndex = GeneratedColumn<int>(
      'special_material_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ocupedSpaceMeta =
      const VerificationMeta('ocupedSpace');
  @override
  late final GeneratedColumn<double> ocupedSpace = GeneratedColumn<double>(
      'ocuped_space', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _wieldableIndexMeta =
      const VerificationMeta('wieldableIndex');
  @override
  late final GeneratedColumn<int> wieldableIndex = GeneratedColumn<int>(
      'wieldable_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purposeIndexMeta =
      const VerificationMeta('purposeIndex');
  @override
  late final GeneratedColumn<int> purposeIndex = GeneratedColumn<int>(
      'purpose_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proficiencyIndexMeta =
      const VerificationMeta('proficiencyIndex');
  @override
  late final GeneratedColumn<int> proficiencyIndex = GeneratedColumn<int>(
      'proficiency_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rangeIndexMeta =
      const VerificationMeta('rangeIndex');
  @override
  late final GeneratedColumn<int> rangeIndex = GeneratedColumn<int>(
      'range_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _criticalMeta =
      const VerificationMeta('critical');
  @override
  late final GeneratedColumn<int> critical = GeneratedColumn<int>(
      'critical', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _criticalMultiplierMeta =
      const VerificationMeta('criticalMultiplier');
  @override
  late final GeneratedColumn<int> criticalMultiplier = GeneratedColumn<int>(
      'critical_multiplier', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
      'steps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dicesMeta = const VerificationMeta('dices');
  @override
  late final GeneratedColumn<String> dices = GeneratedColumn<String>(
      'dices', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _skillIndexesMeta =
      const VerificationMeta('skillIndexes');
  @override
  late final GeneratedColumn<String> skillIndexes = GeneratedColumn<String>(
      'skill_indexes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isNaturalMeta =
      const VerificationMeta('isNatural');
  @override
  late final GeneratedColumn<bool> isNatural = GeneratedColumn<bool>(
      'is_natural', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_natural" IN (0, 1))'));
  static const VerificationMeta _isUnarmedMeta =
      const VerificationMeta('isUnarmed');
  @override
  late final GeneratedColumn<bool> isUnarmed = GeneratedColumn<bool>(
      'is_unarmed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_unarmed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        storedIn,
        improvements,
        specialMaterialIndex,
        price,
        desc,
        ocupedSpace,
        wieldableIndex,
        purposeIndex,
        proficiencyIndex,
        typeIndex,
        rangeIndex,
        critical,
        criticalMultiplier,
        steps,
        dices,
        skillIndexes,
        isNatural,
        isUnarmed
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapon_table';
  @override
  VerificationContext validateIntegrity(Insertable<WeaponTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('stored_in')) {
      context.handle(_storedInMeta,
          storedIn.isAcceptableOrUnknown(data['stored_in']!, _storedInMeta));
    }
    if (data.containsKey('improvements')) {
      context.handle(
          _improvementsMeta,
          improvements.isAcceptableOrUnknown(
              data['improvements']!, _improvementsMeta));
    }
    if (data.containsKey('special_material_index')) {
      context.handle(
          _specialMaterialIndexMeta,
          specialMaterialIndex.isAcceptableOrUnknown(
              data['special_material_index']!, _specialMaterialIndexMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('ocuped_space')) {
      context.handle(
          _ocupedSpaceMeta,
          ocupedSpace.isAcceptableOrUnknown(
              data['ocuped_space']!, _ocupedSpaceMeta));
    } else if (isInserting) {
      context.missing(_ocupedSpaceMeta);
    }
    if (data.containsKey('wieldable_index')) {
      context.handle(
          _wieldableIndexMeta,
          wieldableIndex.isAcceptableOrUnknown(
              data['wieldable_index']!, _wieldableIndexMeta));
    } else if (isInserting) {
      context.missing(_wieldableIndexMeta);
    }
    if (data.containsKey('purpose_index')) {
      context.handle(
          _purposeIndexMeta,
          purposeIndex.isAcceptableOrUnknown(
              data['purpose_index']!, _purposeIndexMeta));
    } else if (isInserting) {
      context.missing(_purposeIndexMeta);
    }
    if (data.containsKey('proficiency_index')) {
      context.handle(
          _proficiencyIndexMeta,
          proficiencyIndex.isAcceptableOrUnknown(
              data['proficiency_index']!, _proficiencyIndexMeta));
    } else if (isInserting) {
      context.missing(_proficiencyIndexMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('range_index')) {
      context.handle(
          _rangeIndexMeta,
          rangeIndex.isAcceptableOrUnknown(
              data['range_index']!, _rangeIndexMeta));
    } else if (isInserting) {
      context.missing(_rangeIndexMeta);
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical']!, _criticalMeta));
    } else if (isInserting) {
      context.missing(_criticalMeta);
    }
    if (data.containsKey('critical_multiplier')) {
      context.handle(
          _criticalMultiplierMeta,
          criticalMultiplier.isAcceptableOrUnknown(
              data['critical_multiplier']!, _criticalMultiplierMeta));
    } else if (isInserting) {
      context.missing(_criticalMultiplierMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
          _stepsMeta, steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta));
    }
    if (data.containsKey('dices')) {
      context.handle(
          _dicesMeta, dices.isAcceptableOrUnknown(data['dices']!, _dicesMeta));
    } else if (isInserting) {
      context.missing(_dicesMeta);
    }
    if (data.containsKey('skill_indexes')) {
      context.handle(
          _skillIndexesMeta,
          skillIndexes.isAcceptableOrUnknown(
              data['skill_indexes']!, _skillIndexesMeta));
    }
    if (data.containsKey('is_natural')) {
      context.handle(_isNaturalMeta,
          isNatural.isAcceptableOrUnknown(data['is_natural']!, _isNaturalMeta));
    } else if (isInserting) {
      context.missing(_isNaturalMeta);
    }
    if (data.containsKey('is_unarmed')) {
      context.handle(_isUnarmedMeta,
          isUnarmed.isAcceptableOrUnknown(data['is_unarmed']!, _isUnarmedMeta));
    } else if (isInserting) {
      context.missing(_isUnarmedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  WeaponTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeaponTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      storedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stored_in']),
      improvements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvements']),
      specialMaterialIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}special_material_index']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
      ocupedSpace: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ocuped_space'])!,
      wieldableIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wieldable_index'])!,
      purposeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purpose_index'])!,
      proficiencyIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}proficiency_index'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      rangeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}range_index'])!,
      critical: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}critical'])!,
      criticalMultiplier: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}critical_multiplier'])!,
      steps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}steps']),
      dices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dices'])!,
      skillIndexes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}skill_indexes']),
      isNatural: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_natural'])!,
      isUnarmed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_unarmed'])!,
    );
  }

  @override
  $WeaponTableTable createAlias(String alias) {
    return $WeaponTableTable(attachedDatabase, alias);
  }
}

class WeaponTableData extends DataClass implements Insertable<WeaponTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String? storedIn;
  final String? improvements;
  final int? specialMaterialIndex;
  final double? price;
  final String? desc;
  final double ocupedSpace;
  final int wieldableIndex;
  final int purposeIndex;
  final int proficiencyIndex;
  final int typeIndex;
  final int rangeIndex;
  final int critical;
  final int criticalMultiplier;
  final int? steps;
  final String dices;
  final String? skillIndexes;
  final bool isNatural;
  final bool isUnarmed;
  const WeaponTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      this.storedIn,
      this.improvements,
      this.specialMaterialIndex,
      this.price,
      this.desc,
      required this.ocupedSpace,
      required this.wieldableIndex,
      required this.purposeIndex,
      required this.proficiencyIndex,
      required this.typeIndex,
      required this.rangeIndex,
      required this.critical,
      required this.criticalMultiplier,
      this.steps,
      required this.dices,
      this.skillIndexes,
      required this.isNatural,
      required this.isUnarmed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    if (!nullToAbsent || storedIn != null) {
      map['stored_in'] = Variable<String>(storedIn);
    }
    if (!nullToAbsent || improvements != null) {
      map['improvements'] = Variable<String>(improvements);
    }
    if (!nullToAbsent || specialMaterialIndex != null) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    map['ocuped_space'] = Variable<double>(ocupedSpace);
    map['wieldable_index'] = Variable<int>(wieldableIndex);
    map['purpose_index'] = Variable<int>(purposeIndex);
    map['proficiency_index'] = Variable<int>(proficiencyIndex);
    map['type_index'] = Variable<int>(typeIndex);
    map['range_index'] = Variable<int>(rangeIndex);
    map['critical'] = Variable<int>(critical);
    map['critical_multiplier'] = Variable<int>(criticalMultiplier);
    if (!nullToAbsent || steps != null) {
      map['steps'] = Variable<int>(steps);
    }
    map['dices'] = Variable<String>(dices);
    if (!nullToAbsent || skillIndexes != null) {
      map['skill_indexes'] = Variable<String>(skillIndexes);
    }
    map['is_natural'] = Variable<bool>(isNatural);
    map['is_unarmed'] = Variable<bool>(isUnarmed);
    return map;
  }

  WeaponTableCompanion toCompanion(bool nullToAbsent) {
    return WeaponTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      storedIn: storedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(storedIn),
      improvements: improvements == null && nullToAbsent
          ? const Value.absent()
          : Value(improvements),
      specialMaterialIndex: specialMaterialIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(specialMaterialIndex),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      ocupedSpace: Value(ocupedSpace),
      wieldableIndex: Value(wieldableIndex),
      purposeIndex: Value(purposeIndex),
      proficiencyIndex: Value(proficiencyIndex),
      typeIndex: Value(typeIndex),
      rangeIndex: Value(rangeIndex),
      critical: Value(critical),
      criticalMultiplier: Value(criticalMultiplier),
      steps:
          steps == null && nullToAbsent ? const Value.absent() : Value(steps),
      dices: Value(dices),
      skillIndexes: skillIndexes == null && nullToAbsent
          ? const Value.absent()
          : Value(skillIndexes),
      isNatural: Value(isNatural),
      isUnarmed: Value(isUnarmed),
    );
  }

  factory WeaponTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeaponTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      storedIn: serializer.fromJson<String?>(json['storedIn']),
      improvements: serializer.fromJson<String?>(json['improvements']),
      specialMaterialIndex:
          serializer.fromJson<int?>(json['specialMaterialIndex']),
      price: serializer.fromJson<double?>(json['price']),
      desc: serializer.fromJson<String?>(json['desc']),
      ocupedSpace: serializer.fromJson<double>(json['ocupedSpace']),
      wieldableIndex: serializer.fromJson<int>(json['wieldableIndex']),
      purposeIndex: serializer.fromJson<int>(json['purposeIndex']),
      proficiencyIndex: serializer.fromJson<int>(json['proficiencyIndex']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      rangeIndex: serializer.fromJson<int>(json['rangeIndex']),
      critical: serializer.fromJson<int>(json['critical']),
      criticalMultiplier: serializer.fromJson<int>(json['criticalMultiplier']),
      steps: serializer.fromJson<int?>(json['steps']),
      dices: serializer.fromJson<String>(json['dices']),
      skillIndexes: serializer.fromJson<String?>(json['skillIndexes']),
      isNatural: serializer.fromJson<bool>(json['isNatural']),
      isUnarmed: serializer.fromJson<bool>(json['isUnarmed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'storedIn': serializer.toJson<String?>(storedIn),
      'improvements': serializer.toJson<String?>(improvements),
      'specialMaterialIndex': serializer.toJson<int?>(specialMaterialIndex),
      'price': serializer.toJson<double?>(price),
      'desc': serializer.toJson<String?>(desc),
      'ocupedSpace': serializer.toJson<double>(ocupedSpace),
      'wieldableIndex': serializer.toJson<int>(wieldableIndex),
      'purposeIndex': serializer.toJson<int>(purposeIndex),
      'proficiencyIndex': serializer.toJson<int>(proficiencyIndex),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'rangeIndex': serializer.toJson<int>(rangeIndex),
      'critical': serializer.toJson<int>(critical),
      'criticalMultiplier': serializer.toJson<int>(criticalMultiplier),
      'steps': serializer.toJson<int?>(steps),
      'dices': serializer.toJson<String>(dices),
      'skillIndexes': serializer.toJson<String?>(skillIndexes),
      'isNatural': serializer.toJson<bool>(isNatural),
      'isUnarmed': serializer.toJson<bool>(isUnarmed),
    };
  }

  WeaponTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          Value<String?> storedIn = const Value.absent(),
          Value<String?> improvements = const Value.absent(),
          Value<int?> specialMaterialIndex = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          double? ocupedSpace,
          int? wieldableIndex,
          int? purposeIndex,
          int? proficiencyIndex,
          int? typeIndex,
          int? rangeIndex,
          int? critical,
          int? criticalMultiplier,
          Value<int?> steps = const Value.absent(),
          String? dices,
          Value<String?> skillIndexes = const Value.absent(),
          bool? isNatural,
          bool? isUnarmed}) =>
      WeaponTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        storedIn: storedIn.present ? storedIn.value : this.storedIn,
        improvements:
            improvements.present ? improvements.value : this.improvements,
        specialMaterialIndex: specialMaterialIndex.present
            ? specialMaterialIndex.value
            : this.specialMaterialIndex,
        price: price.present ? price.value : this.price,
        desc: desc.present ? desc.value : this.desc,
        ocupedSpace: ocupedSpace ?? this.ocupedSpace,
        wieldableIndex: wieldableIndex ?? this.wieldableIndex,
        purposeIndex: purposeIndex ?? this.purposeIndex,
        proficiencyIndex: proficiencyIndex ?? this.proficiencyIndex,
        typeIndex: typeIndex ?? this.typeIndex,
        rangeIndex: rangeIndex ?? this.rangeIndex,
        critical: critical ?? this.critical,
        criticalMultiplier: criticalMultiplier ?? this.criticalMultiplier,
        steps: steps.present ? steps.value : this.steps,
        dices: dices ?? this.dices,
        skillIndexes:
            skillIndexes.present ? skillIndexes.value : this.skillIndexes,
        isNatural: isNatural ?? this.isNatural,
        isUnarmed: isUnarmed ?? this.isUnarmed,
      );
  WeaponTableData copyWithCompanion(WeaponTableCompanion data) {
    return WeaponTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      storedIn: data.storedIn.present ? data.storedIn.value : this.storedIn,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      specialMaterialIndex: data.specialMaterialIndex.present
          ? data.specialMaterialIndex.value
          : this.specialMaterialIndex,
      price: data.price.present ? data.price.value : this.price,
      desc: data.desc.present ? data.desc.value : this.desc,
      ocupedSpace:
          data.ocupedSpace.present ? data.ocupedSpace.value : this.ocupedSpace,
      wieldableIndex: data.wieldableIndex.present
          ? data.wieldableIndex.value
          : this.wieldableIndex,
      purposeIndex: data.purposeIndex.present
          ? data.purposeIndex.value
          : this.purposeIndex,
      proficiencyIndex: data.proficiencyIndex.present
          ? data.proficiencyIndex.value
          : this.proficiencyIndex,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      rangeIndex:
          data.rangeIndex.present ? data.rangeIndex.value : this.rangeIndex,
      critical: data.critical.present ? data.critical.value : this.critical,
      criticalMultiplier: data.criticalMultiplier.present
          ? data.criticalMultiplier.value
          : this.criticalMultiplier,
      steps: data.steps.present ? data.steps.value : this.steps,
      dices: data.dices.present ? data.dices.value : this.dices,
      skillIndexes: data.skillIndexes.present
          ? data.skillIndexes.value
          : this.skillIndexes,
      isNatural: data.isNatural.present ? data.isNatural.value : this.isNatural,
      isUnarmed: data.isUnarmed.present ? data.isUnarmed.value : this.isUnarmed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeaponTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('wieldableIndex: $wieldableIndex, ')
          ..write('purposeIndex: $purposeIndex, ')
          ..write('proficiencyIndex: $proficiencyIndex, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rangeIndex: $rangeIndex, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('steps: $steps, ')
          ..write('dices: $dices, ')
          ..write('skillIndexes: $skillIndexes, ')
          ..write('isNatural: $isNatural, ')
          ..write('isUnarmed: $isUnarmed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        uuid,
        name,
        parentUuid,
        storedIn,
        improvements,
        specialMaterialIndex,
        price,
        desc,
        ocupedSpace,
        wieldableIndex,
        purposeIndex,
        proficiencyIndex,
        typeIndex,
        rangeIndex,
        critical,
        criticalMultiplier,
        steps,
        dices,
        skillIndexes,
        isNatural,
        isUnarmed
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeaponTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.storedIn == this.storedIn &&
          other.improvements == this.improvements &&
          other.specialMaterialIndex == this.specialMaterialIndex &&
          other.price == this.price &&
          other.desc == this.desc &&
          other.ocupedSpace == this.ocupedSpace &&
          other.wieldableIndex == this.wieldableIndex &&
          other.purposeIndex == this.purposeIndex &&
          other.proficiencyIndex == this.proficiencyIndex &&
          other.typeIndex == this.typeIndex &&
          other.rangeIndex == this.rangeIndex &&
          other.critical == this.critical &&
          other.criticalMultiplier == this.criticalMultiplier &&
          other.steps == this.steps &&
          other.dices == this.dices &&
          other.skillIndexes == this.skillIndexes &&
          other.isNatural == this.isNatural &&
          other.isUnarmed == this.isUnarmed);
}

class WeaponTableCompanion extends UpdateCompanion<WeaponTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String?> storedIn;
  final Value<String?> improvements;
  final Value<int?> specialMaterialIndex;
  final Value<double?> price;
  final Value<String?> desc;
  final Value<double> ocupedSpace;
  final Value<int> wieldableIndex;
  final Value<int> purposeIndex;
  final Value<int> proficiencyIndex;
  final Value<int> typeIndex;
  final Value<int> rangeIndex;
  final Value<int> critical;
  final Value<int> criticalMultiplier;
  final Value<int?> steps;
  final Value<String> dices;
  final Value<String?> skillIndexes;
  final Value<bool> isNatural;
  final Value<bool> isUnarmed;
  final Value<int> rowid;
  const WeaponTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    this.ocupedSpace = const Value.absent(),
    this.wieldableIndex = const Value.absent(),
    this.purposeIndex = const Value.absent(),
    this.proficiencyIndex = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rangeIndex = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    this.steps = const Value.absent(),
    this.dices = const Value.absent(),
    this.skillIndexes = const Value.absent(),
    this.isNatural = const Value.absent(),
    this.isUnarmed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeaponTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    this.storedIn = const Value.absent(),
    this.improvements = const Value.absent(),
    this.specialMaterialIndex = const Value.absent(),
    this.price = const Value.absent(),
    this.desc = const Value.absent(),
    required double ocupedSpace,
    required int wieldableIndex,
    required int purposeIndex,
    required int proficiencyIndex,
    required int typeIndex,
    required int rangeIndex,
    required int critical,
    required int criticalMultiplier,
    this.steps = const Value.absent(),
    required String dices,
    this.skillIndexes = const Value.absent(),
    required bool isNatural,
    required bool isUnarmed,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        ocupedSpace = Value(ocupedSpace),
        wieldableIndex = Value(wieldableIndex),
        purposeIndex = Value(purposeIndex),
        proficiencyIndex = Value(proficiencyIndex),
        typeIndex = Value(typeIndex),
        rangeIndex = Value(rangeIndex),
        critical = Value(critical),
        criticalMultiplier = Value(criticalMultiplier),
        dices = Value(dices),
        isNatural = Value(isNatural),
        isUnarmed = Value(isUnarmed);
  static Insertable<WeaponTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? storedIn,
    Expression<String>? improvements,
    Expression<int>? specialMaterialIndex,
    Expression<double>? price,
    Expression<String>? desc,
    Expression<double>? ocupedSpace,
    Expression<int>? wieldableIndex,
    Expression<int>? purposeIndex,
    Expression<int>? proficiencyIndex,
    Expression<int>? typeIndex,
    Expression<int>? rangeIndex,
    Expression<int>? critical,
    Expression<int>? criticalMultiplier,
    Expression<int>? steps,
    Expression<String>? dices,
    Expression<String>? skillIndexes,
    Expression<bool>? isNatural,
    Expression<bool>? isUnarmed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (storedIn != null) 'stored_in': storedIn,
      if (improvements != null) 'improvements': improvements,
      if (specialMaterialIndex != null)
        'special_material_index': specialMaterialIndex,
      if (price != null) 'price': price,
      if (desc != null) 'desc': desc,
      if (ocupedSpace != null) 'ocuped_space': ocupedSpace,
      if (wieldableIndex != null) 'wieldable_index': wieldableIndex,
      if (purposeIndex != null) 'purpose_index': purposeIndex,
      if (proficiencyIndex != null) 'proficiency_index': proficiencyIndex,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rangeIndex != null) 'range_index': rangeIndex,
      if (critical != null) 'critical': critical,
      if (criticalMultiplier != null) 'critical_multiplier': criticalMultiplier,
      if (steps != null) 'steps': steps,
      if (dices != null) 'dices': dices,
      if (skillIndexes != null) 'skill_indexes': skillIndexes,
      if (isNatural != null) 'is_natural': isNatural,
      if (isUnarmed != null) 'is_unarmed': isUnarmed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeaponTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String?>? storedIn,
      Value<String?>? improvements,
      Value<int?>? specialMaterialIndex,
      Value<double?>? price,
      Value<String?>? desc,
      Value<double>? ocupedSpace,
      Value<int>? wieldableIndex,
      Value<int>? purposeIndex,
      Value<int>? proficiencyIndex,
      Value<int>? typeIndex,
      Value<int>? rangeIndex,
      Value<int>? critical,
      Value<int>? criticalMultiplier,
      Value<int?>? steps,
      Value<String>? dices,
      Value<String?>? skillIndexes,
      Value<bool>? isNatural,
      Value<bool>? isUnarmed,
      Value<int>? rowid}) {
    return WeaponTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      storedIn: storedIn ?? this.storedIn,
      improvements: improvements ?? this.improvements,
      specialMaterialIndex: specialMaterialIndex ?? this.specialMaterialIndex,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      ocupedSpace: ocupedSpace ?? this.ocupedSpace,
      wieldableIndex: wieldableIndex ?? this.wieldableIndex,
      purposeIndex: purposeIndex ?? this.purposeIndex,
      proficiencyIndex: proficiencyIndex ?? this.proficiencyIndex,
      typeIndex: typeIndex ?? this.typeIndex,
      rangeIndex: rangeIndex ?? this.rangeIndex,
      critical: critical ?? this.critical,
      criticalMultiplier: criticalMultiplier ?? this.criticalMultiplier,
      steps: steps ?? this.steps,
      dices: dices ?? this.dices,
      skillIndexes: skillIndexes ?? this.skillIndexes,
      isNatural: isNatural ?? this.isNatural,
      isUnarmed: isUnarmed ?? this.isUnarmed,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (storedIn.present) {
      map['stored_in'] = Variable<String>(storedIn.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (specialMaterialIndex.present) {
      map['special_material_index'] = Variable<int>(specialMaterialIndex.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (ocupedSpace.present) {
      map['ocuped_space'] = Variable<double>(ocupedSpace.value);
    }
    if (wieldableIndex.present) {
      map['wieldable_index'] = Variable<int>(wieldableIndex.value);
    }
    if (purposeIndex.present) {
      map['purpose_index'] = Variable<int>(purposeIndex.value);
    }
    if (proficiencyIndex.present) {
      map['proficiency_index'] = Variable<int>(proficiencyIndex.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (rangeIndex.present) {
      map['range_index'] = Variable<int>(rangeIndex.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (criticalMultiplier.present) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (dices.present) {
      map['dices'] = Variable<String>(dices.value);
    }
    if (skillIndexes.present) {
      map['skill_indexes'] = Variable<String>(skillIndexes.value);
    }
    if (isNatural.present) {
      map['is_natural'] = Variable<bool>(isNatural.value);
    }
    if (isUnarmed.present) {
      map['is_unarmed'] = Variable<bool>(isUnarmed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeaponTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('storedIn: $storedIn, ')
          ..write('improvements: $improvements, ')
          ..write('specialMaterialIndex: $specialMaterialIndex, ')
          ..write('price: $price, ')
          ..write('desc: $desc, ')
          ..write('ocupedSpace: $ocupedSpace, ')
          ..write('wieldableIndex: $wieldableIndex, ')
          ..write('purposeIndex: $purposeIndex, ')
          ..write('proficiencyIndex: $proficiencyIndex, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rangeIndex: $rangeIndex, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('steps: $steps, ')
          ..write('dices: $dices, ')
          ..write('skillIndexes: $skillIndexes, ')
          ..write('isNatural: $isNatural, ')
          ..write('isUnarmed: $isUnarmed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionTableTable extends ActionTable
    with TableInfo<$ActionTableTable, ActionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _damageDicesMeta =
      const VerificationMeta('damageDices');
  @override
  late final GeneratedColumn<String> damageDices = GeneratedColumn<String>(
      'damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDamageDicesMeta =
      const VerificationMeta('extraDamageDices');
  @override
  late final GeneratedColumn<String> extraDamageDices = GeneratedColumn<String>(
      'extra_damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pmMeta = const VerificationMeta('pm');
  @override
  late final GeneratedColumn<int> pm = GeneratedColumn<int>(
      'pm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cdMeta = const VerificationMeta('cd');
  @override
  late final GeneratedColumn<int> cd = GeneratedColumn<int>(
      'cd', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _equipamentUuidMeta =
      const VerificationMeta('equipamentUuid');
  @override
  late final GeneratedColumn<String> equipamentUuid = GeneratedColumn<String>(
      'equipament_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediumDamageValueMeta =
      const VerificationMeta('mediumDamageValue');
  @override
  late final GeneratedColumn<int> mediumDamageValue = GeneratedColumn<int>(
      'medium_damage_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMeta =
      const VerificationMeta('critical');
  @override
  late final GeneratedColumn<int> critical = GeneratedColumn<int>(
      'critical', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMultiplierMeta =
      const VerificationMeta('criticalMultiplier');
  @override
  late final GeneratedColumn<int> criticalMultiplier = GeneratedColumn<int>(
      'critical_multiplier', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        desc,
        damageDices,
        extraDamageDices,
        pm,
        cd,
        equipamentUuid,
        mediumDamageValue,
        critical,
        criticalMultiplier,
        typeIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_table';
  @override
  VerificationContext validateIntegrity(Insertable<ActionTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('damage_dices')) {
      context.handle(
          _damageDicesMeta,
          damageDices.isAcceptableOrUnknown(
              data['damage_dices']!, _damageDicesMeta));
    }
    if (data.containsKey('extra_damage_dices')) {
      context.handle(
          _extraDamageDicesMeta,
          extraDamageDices.isAcceptableOrUnknown(
              data['extra_damage_dices']!, _extraDamageDicesMeta));
    }
    if (data.containsKey('pm')) {
      context.handle(_pmMeta, pm.isAcceptableOrUnknown(data['pm']!, _pmMeta));
    }
    if (data.containsKey('cd')) {
      context.handle(_cdMeta, cd.isAcceptableOrUnknown(data['cd']!, _cdMeta));
    }
    if (data.containsKey('equipament_uuid')) {
      context.handle(
          _equipamentUuidMeta,
          equipamentUuid.isAcceptableOrUnknown(
              data['equipament_uuid']!, _equipamentUuidMeta));
    }
    if (data.containsKey('medium_damage_value')) {
      context.handle(
          _mediumDamageValueMeta,
          mediumDamageValue.isAcceptableOrUnknown(
              data['medium_damage_value']!, _mediumDamageValueMeta));
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical']!, _criticalMeta));
    }
    if (data.containsKey('critical_multiplier')) {
      context.handle(
          _criticalMultiplierMeta,
          criticalMultiplier.isAcceptableOrUnknown(
              data['critical_multiplier']!, _criticalMultiplierMeta));
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
  ActionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      damageDices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_dices']),
      extraDamageDices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_damage_dices']),
      pm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pm']),
      cd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cd']),
      equipamentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipament_uuid']),
      mediumDamageValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medium_damage_value']),
      critical: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}critical']),
      criticalMultiplier: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}critical_multiplier']),
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $ActionTableTable createAlias(String alias) {
    return $ActionTableTable(attachedDatabase, alias);
  }
}

class ActionTableData extends DataClass implements Insertable<ActionTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String desc;
  final String? damageDices;
  final String? extraDamageDices;
  final int? pm;
  final int? cd;
  final String? equipamentUuid;
  final int? mediumDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final int typeIndex;
  const ActionTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      required this.desc,
      this.damageDices,
      this.extraDamageDices,
      this.pm,
      this.cd,
      this.equipamentUuid,
      this.mediumDamageValue,
      this.critical,
      this.criticalMultiplier,
      required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    map['desc'] = Variable<String>(desc);
    if (!nullToAbsent || damageDices != null) {
      map['damage_dices'] = Variable<String>(damageDices);
    }
    if (!nullToAbsent || extraDamageDices != null) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices);
    }
    if (!nullToAbsent || pm != null) {
      map['pm'] = Variable<int>(pm);
    }
    if (!nullToAbsent || cd != null) {
      map['cd'] = Variable<int>(cd);
    }
    if (!nullToAbsent || equipamentUuid != null) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid);
    }
    if (!nullToAbsent || mediumDamageValue != null) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue);
    }
    if (!nullToAbsent || critical != null) {
      map['critical'] = Variable<int>(critical);
    }
    if (!nullToAbsent || criticalMultiplier != null) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier);
    }
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  ActionTableCompanion toCompanion(bool nullToAbsent) {
    return ActionTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      desc: Value(desc),
      damageDices: damageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(damageDices),
      extraDamageDices: extraDamageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(extraDamageDices),
      pm: pm == null && nullToAbsent ? const Value.absent() : Value(pm),
      cd: cd == null && nullToAbsent ? const Value.absent() : Value(cd),
      equipamentUuid: equipamentUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(equipamentUuid),
      mediumDamageValue: mediumDamageValue == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumDamageValue),
      critical: critical == null && nullToAbsent
          ? const Value.absent()
          : Value(critical),
      criticalMultiplier: criticalMultiplier == null && nullToAbsent
          ? const Value.absent()
          : Value(criticalMultiplier),
      typeIndex: Value(typeIndex),
    );
  }

  factory ActionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      desc: serializer.fromJson<String>(json['desc']),
      damageDices: serializer.fromJson<String?>(json['damageDices']),
      extraDamageDices: serializer.fromJson<String?>(json['extraDamageDices']),
      pm: serializer.fromJson<int?>(json['pm']),
      cd: serializer.fromJson<int?>(json['cd']),
      equipamentUuid: serializer.fromJson<String?>(json['equipamentUuid']),
      mediumDamageValue: serializer.fromJson<int?>(json['mediumDamageValue']),
      critical: serializer.fromJson<int?>(json['critical']),
      criticalMultiplier: serializer.fromJson<int?>(json['criticalMultiplier']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'desc': serializer.toJson<String>(desc),
      'damageDices': serializer.toJson<String?>(damageDices),
      'extraDamageDices': serializer.toJson<String?>(extraDamageDices),
      'pm': serializer.toJson<int?>(pm),
      'cd': serializer.toJson<int?>(cd),
      'equipamentUuid': serializer.toJson<String?>(equipamentUuid),
      'mediumDamageValue': serializer.toJson<int?>(mediumDamageValue),
      'critical': serializer.toJson<int?>(critical),
      'criticalMultiplier': serializer.toJson<int?>(criticalMultiplier),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  ActionTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          String? desc,
          Value<String?> damageDices = const Value.absent(),
          Value<String?> extraDamageDices = const Value.absent(),
          Value<int?> pm = const Value.absent(),
          Value<int?> cd = const Value.absent(),
          Value<String?> equipamentUuid = const Value.absent(),
          Value<int?> mediumDamageValue = const Value.absent(),
          Value<int?> critical = const Value.absent(),
          Value<int?> criticalMultiplier = const Value.absent(),
          int? typeIndex}) =>
      ActionTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        desc: desc ?? this.desc,
        damageDices: damageDices.present ? damageDices.value : this.damageDices,
        extraDamageDices: extraDamageDices.present
            ? extraDamageDices.value
            : this.extraDamageDices,
        pm: pm.present ? pm.value : this.pm,
        cd: cd.present ? cd.value : this.cd,
        equipamentUuid:
            equipamentUuid.present ? equipamentUuid.value : this.equipamentUuid,
        mediumDamageValue: mediumDamageValue.present
            ? mediumDamageValue.value
            : this.mediumDamageValue,
        critical: critical.present ? critical.value : this.critical,
        criticalMultiplier: criticalMultiplier.present
            ? criticalMultiplier.value
            : this.criticalMultiplier,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  ActionTableData copyWithCompanion(ActionTableCompanion data) {
    return ActionTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      desc: data.desc.present ? data.desc.value : this.desc,
      damageDices:
          data.damageDices.present ? data.damageDices.value : this.damageDices,
      extraDamageDices: data.extraDamageDices.present
          ? data.extraDamageDices.value
          : this.extraDamageDices,
      pm: data.pm.present ? data.pm.value : this.pm,
      cd: data.cd.present ? data.cd.value : this.cd,
      equipamentUuid: data.equipamentUuid.present
          ? data.equipamentUuid.value
          : this.equipamentUuid,
      mediumDamageValue: data.mediumDamageValue.present
          ? data.mediumDamageValue.value
          : this.mediumDamageValue,
      critical: data.critical.present ? data.critical.value : this.critical,
      criticalMultiplier: data.criticalMultiplier.present
          ? data.criticalMultiplier.value
          : this.criticalMultiplier,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      parentUuid,
      desc,
      damageDices,
      extraDamageDices,
      pm,
      cd,
      equipamentUuid,
      mediumDamageValue,
      critical,
      criticalMultiplier,
      typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.desc == this.desc &&
          other.damageDices == this.damageDices &&
          other.extraDamageDices == this.extraDamageDices &&
          other.pm == this.pm &&
          other.cd == this.cd &&
          other.equipamentUuid == this.equipamentUuid &&
          other.mediumDamageValue == this.mediumDamageValue &&
          other.critical == this.critical &&
          other.criticalMultiplier == this.criticalMultiplier &&
          other.typeIndex == this.typeIndex);
}

class ActionTableCompanion extends UpdateCompanion<ActionTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String> desc;
  final Value<String?> damageDices;
  final Value<String?> extraDamageDices;
  final Value<int?> pm;
  final Value<int?> cd;
  final Value<String?> equipamentUuid;
  final Value<int?> mediumDamageValue;
  final Value<int?> critical;
  final Value<int?> criticalMultiplier;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const ActionTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.desc = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    required String desc,
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        desc = Value(desc),
        typeIndex = Value(typeIndex);
  static Insertable<ActionTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? desc,
    Expression<String>? damageDices,
    Expression<String>? extraDamageDices,
    Expression<int>? pm,
    Expression<int>? cd,
    Expression<String>? equipamentUuid,
    Expression<int>? mediumDamageValue,
    Expression<int>? critical,
    Expression<int>? criticalMultiplier,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (desc != null) 'desc': desc,
      if (damageDices != null) 'damage_dices': damageDices,
      if (extraDamageDices != null) 'extra_damage_dices': extraDamageDices,
      if (pm != null) 'pm': pm,
      if (cd != null) 'cd': cd,
      if (equipamentUuid != null) 'equipament_uuid': equipamentUuid,
      if (mediumDamageValue != null) 'medium_damage_value': mediumDamageValue,
      if (critical != null) 'critical': critical,
      if (criticalMultiplier != null) 'critical_multiplier': criticalMultiplier,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String>? desc,
      Value<String?>? damageDices,
      Value<String?>? extraDamageDices,
      Value<int?>? pm,
      Value<int?>? cd,
      Value<String?>? equipamentUuid,
      Value<int?>? mediumDamageValue,
      Value<int?>? critical,
      Value<int?>? criticalMultiplier,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return ActionTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      desc: desc ?? this.desc,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      equipamentUuid: equipamentUuid ?? this.equipamentUuid,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
      critical: critical ?? this.critical,
      criticalMultiplier: criticalMultiplier ?? this.criticalMultiplier,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (damageDices.present) {
      map['damage_dices'] = Variable<String>(damageDices.value);
    }
    if (extraDamageDices.present) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices.value);
    }
    if (pm.present) {
      map['pm'] = Variable<int>(pm.value);
    }
    if (cd.present) {
      map['cd'] = Variable<int>(cd.value);
    }
    if (equipamentUuid.present) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid.value);
    }
    if (mediumDamageValue.present) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (criticalMultiplier.present) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier.value);
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
    return (StringBuffer('ActionTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionHandToHandTableTable extends ActionHandToHandTable
    with TableInfo<$ActionHandToHandTableTable, ActionHandToHandTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionHandToHandTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _damageDicesMeta =
      const VerificationMeta('damageDices');
  @override
  late final GeneratedColumn<String> damageDices = GeneratedColumn<String>(
      'damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDamageDicesMeta =
      const VerificationMeta('extraDamageDices');
  @override
  late final GeneratedColumn<String> extraDamageDices = GeneratedColumn<String>(
      'extra_damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pmMeta = const VerificationMeta('pm');
  @override
  late final GeneratedColumn<int> pm = GeneratedColumn<int>(
      'pm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cdMeta = const VerificationMeta('cd');
  @override
  late final GeneratedColumn<int> cd = GeneratedColumn<int>(
      'cd', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _equipamentUuidMeta =
      const VerificationMeta('equipamentUuid');
  @override
  late final GeneratedColumn<String> equipamentUuid = GeneratedColumn<String>(
      'equipament_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediumDamageValueMeta =
      const VerificationMeta('mediumDamageValue');
  @override
  late final GeneratedColumn<int> mediumDamageValue = GeneratedColumn<int>(
      'medium_damage_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMeta =
      const VerificationMeta('critical');
  @override
  late final GeneratedColumn<int> critical = GeneratedColumn<int>(
      'critical', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMultiplierMeta =
      const VerificationMeta('criticalMultiplier');
  @override
  late final GeneratedColumn<int> criticalMultiplier = GeneratedColumn<int>(
      'critical_multiplier', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        desc,
        damageDices,
        extraDamageDices,
        pm,
        cd,
        equipamentUuid,
        mediumDamageValue,
        critical,
        criticalMultiplier,
        typeIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_hand_to_hand_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActionHandToHandTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('damage_dices')) {
      context.handle(
          _damageDicesMeta,
          damageDices.isAcceptableOrUnknown(
              data['damage_dices']!, _damageDicesMeta));
    }
    if (data.containsKey('extra_damage_dices')) {
      context.handle(
          _extraDamageDicesMeta,
          extraDamageDices.isAcceptableOrUnknown(
              data['extra_damage_dices']!, _extraDamageDicesMeta));
    }
    if (data.containsKey('pm')) {
      context.handle(_pmMeta, pm.isAcceptableOrUnknown(data['pm']!, _pmMeta));
    }
    if (data.containsKey('cd')) {
      context.handle(_cdMeta, cd.isAcceptableOrUnknown(data['cd']!, _cdMeta));
    }
    if (data.containsKey('equipament_uuid')) {
      context.handle(
          _equipamentUuidMeta,
          equipamentUuid.isAcceptableOrUnknown(
              data['equipament_uuid']!, _equipamentUuidMeta));
    }
    if (data.containsKey('medium_damage_value')) {
      context.handle(
          _mediumDamageValueMeta,
          mediumDamageValue.isAcceptableOrUnknown(
              data['medium_damage_value']!, _mediumDamageValueMeta));
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical']!, _criticalMeta));
    }
    if (data.containsKey('critical_multiplier')) {
      context.handle(
          _criticalMultiplierMeta,
          criticalMultiplier.isAcceptableOrUnknown(
              data['critical_multiplier']!, _criticalMultiplierMeta));
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
  ActionHandToHandTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionHandToHandTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      damageDices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_dices']),
      extraDamageDices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_damage_dices']),
      pm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pm']),
      cd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cd']),
      equipamentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipament_uuid']),
      mediumDamageValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medium_damage_value']),
      critical: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}critical']),
      criticalMultiplier: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}critical_multiplier']),
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $ActionHandToHandTableTable createAlias(String alias) {
    return $ActionHandToHandTableTable(attachedDatabase, alias);
  }
}

class ActionHandToHandTableData extends DataClass
    implements Insertable<ActionHandToHandTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String desc;
  final String? damageDices;
  final String? extraDamageDices;
  final int? pm;
  final int? cd;
  final String? equipamentUuid;
  final int? mediumDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final int typeIndex;
  const ActionHandToHandTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      required this.desc,
      this.damageDices,
      this.extraDamageDices,
      this.pm,
      this.cd,
      this.equipamentUuid,
      this.mediumDamageValue,
      this.critical,
      this.criticalMultiplier,
      required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    map['desc'] = Variable<String>(desc);
    if (!nullToAbsent || damageDices != null) {
      map['damage_dices'] = Variable<String>(damageDices);
    }
    if (!nullToAbsent || extraDamageDices != null) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices);
    }
    if (!nullToAbsent || pm != null) {
      map['pm'] = Variable<int>(pm);
    }
    if (!nullToAbsent || cd != null) {
      map['cd'] = Variable<int>(cd);
    }
    if (!nullToAbsent || equipamentUuid != null) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid);
    }
    if (!nullToAbsent || mediumDamageValue != null) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue);
    }
    if (!nullToAbsent || critical != null) {
      map['critical'] = Variable<int>(critical);
    }
    if (!nullToAbsent || criticalMultiplier != null) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier);
    }
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  ActionHandToHandTableCompanion toCompanion(bool nullToAbsent) {
    return ActionHandToHandTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      desc: Value(desc),
      damageDices: damageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(damageDices),
      extraDamageDices: extraDamageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(extraDamageDices),
      pm: pm == null && nullToAbsent ? const Value.absent() : Value(pm),
      cd: cd == null && nullToAbsent ? const Value.absent() : Value(cd),
      equipamentUuid: equipamentUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(equipamentUuid),
      mediumDamageValue: mediumDamageValue == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumDamageValue),
      critical: critical == null && nullToAbsent
          ? const Value.absent()
          : Value(critical),
      criticalMultiplier: criticalMultiplier == null && nullToAbsent
          ? const Value.absent()
          : Value(criticalMultiplier),
      typeIndex: Value(typeIndex),
    );
  }

  factory ActionHandToHandTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionHandToHandTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      desc: serializer.fromJson<String>(json['desc']),
      damageDices: serializer.fromJson<String?>(json['damageDices']),
      extraDamageDices: serializer.fromJson<String?>(json['extraDamageDices']),
      pm: serializer.fromJson<int?>(json['pm']),
      cd: serializer.fromJson<int?>(json['cd']),
      equipamentUuid: serializer.fromJson<String?>(json['equipamentUuid']),
      mediumDamageValue: serializer.fromJson<int?>(json['mediumDamageValue']),
      critical: serializer.fromJson<int?>(json['critical']),
      criticalMultiplier: serializer.fromJson<int?>(json['criticalMultiplier']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'desc': serializer.toJson<String>(desc),
      'damageDices': serializer.toJson<String?>(damageDices),
      'extraDamageDices': serializer.toJson<String?>(extraDamageDices),
      'pm': serializer.toJson<int?>(pm),
      'cd': serializer.toJson<int?>(cd),
      'equipamentUuid': serializer.toJson<String?>(equipamentUuid),
      'mediumDamageValue': serializer.toJson<int?>(mediumDamageValue),
      'critical': serializer.toJson<int?>(critical),
      'criticalMultiplier': serializer.toJson<int?>(criticalMultiplier),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  ActionHandToHandTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          String? desc,
          Value<String?> damageDices = const Value.absent(),
          Value<String?> extraDamageDices = const Value.absent(),
          Value<int?> pm = const Value.absent(),
          Value<int?> cd = const Value.absent(),
          Value<String?> equipamentUuid = const Value.absent(),
          Value<int?> mediumDamageValue = const Value.absent(),
          Value<int?> critical = const Value.absent(),
          Value<int?> criticalMultiplier = const Value.absent(),
          int? typeIndex}) =>
      ActionHandToHandTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        desc: desc ?? this.desc,
        damageDices: damageDices.present ? damageDices.value : this.damageDices,
        extraDamageDices: extraDamageDices.present
            ? extraDamageDices.value
            : this.extraDamageDices,
        pm: pm.present ? pm.value : this.pm,
        cd: cd.present ? cd.value : this.cd,
        equipamentUuid:
            equipamentUuid.present ? equipamentUuid.value : this.equipamentUuid,
        mediumDamageValue: mediumDamageValue.present
            ? mediumDamageValue.value
            : this.mediumDamageValue,
        critical: critical.present ? critical.value : this.critical,
        criticalMultiplier: criticalMultiplier.present
            ? criticalMultiplier.value
            : this.criticalMultiplier,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  ActionHandToHandTableData copyWithCompanion(
      ActionHandToHandTableCompanion data) {
    return ActionHandToHandTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      desc: data.desc.present ? data.desc.value : this.desc,
      damageDices:
          data.damageDices.present ? data.damageDices.value : this.damageDices,
      extraDamageDices: data.extraDamageDices.present
          ? data.extraDamageDices.value
          : this.extraDamageDices,
      pm: data.pm.present ? data.pm.value : this.pm,
      cd: data.cd.present ? data.cd.value : this.cd,
      equipamentUuid: data.equipamentUuid.present
          ? data.equipamentUuid.value
          : this.equipamentUuid,
      mediumDamageValue: data.mediumDamageValue.present
          ? data.mediumDamageValue.value
          : this.mediumDamageValue,
      critical: data.critical.present ? data.critical.value : this.critical,
      criticalMultiplier: data.criticalMultiplier.present
          ? data.criticalMultiplier.value
          : this.criticalMultiplier,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionHandToHandTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      parentUuid,
      desc,
      damageDices,
      extraDamageDices,
      pm,
      cd,
      equipamentUuid,
      mediumDamageValue,
      critical,
      criticalMultiplier,
      typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionHandToHandTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.desc == this.desc &&
          other.damageDices == this.damageDices &&
          other.extraDamageDices == this.extraDamageDices &&
          other.pm == this.pm &&
          other.cd == this.cd &&
          other.equipamentUuid == this.equipamentUuid &&
          other.mediumDamageValue == this.mediumDamageValue &&
          other.critical == this.critical &&
          other.criticalMultiplier == this.criticalMultiplier &&
          other.typeIndex == this.typeIndex);
}

class ActionHandToHandTableCompanion
    extends UpdateCompanion<ActionHandToHandTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String> desc;
  final Value<String?> damageDices;
  final Value<String?> extraDamageDices;
  final Value<int?> pm;
  final Value<int?> cd;
  final Value<String?> equipamentUuid;
  final Value<int?> mediumDamageValue;
  final Value<int?> critical;
  final Value<int?> criticalMultiplier;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const ActionHandToHandTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.desc = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionHandToHandTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    required String desc,
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        desc = Value(desc),
        typeIndex = Value(typeIndex);
  static Insertable<ActionHandToHandTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? desc,
    Expression<String>? damageDices,
    Expression<String>? extraDamageDices,
    Expression<int>? pm,
    Expression<int>? cd,
    Expression<String>? equipamentUuid,
    Expression<int>? mediumDamageValue,
    Expression<int>? critical,
    Expression<int>? criticalMultiplier,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (desc != null) 'desc': desc,
      if (damageDices != null) 'damage_dices': damageDices,
      if (extraDamageDices != null) 'extra_damage_dices': extraDamageDices,
      if (pm != null) 'pm': pm,
      if (cd != null) 'cd': cd,
      if (equipamentUuid != null) 'equipament_uuid': equipamentUuid,
      if (mediumDamageValue != null) 'medium_damage_value': mediumDamageValue,
      if (critical != null) 'critical': critical,
      if (criticalMultiplier != null) 'critical_multiplier': criticalMultiplier,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionHandToHandTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String>? desc,
      Value<String?>? damageDices,
      Value<String?>? extraDamageDices,
      Value<int?>? pm,
      Value<int?>? cd,
      Value<String?>? equipamentUuid,
      Value<int?>? mediumDamageValue,
      Value<int?>? critical,
      Value<int?>? criticalMultiplier,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return ActionHandToHandTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      desc: desc ?? this.desc,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      equipamentUuid: equipamentUuid ?? this.equipamentUuid,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
      critical: critical ?? this.critical,
      criticalMultiplier: criticalMultiplier ?? this.criticalMultiplier,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (damageDices.present) {
      map['damage_dices'] = Variable<String>(damageDices.value);
    }
    if (extraDamageDices.present) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices.value);
    }
    if (pm.present) {
      map['pm'] = Variable<int>(pm.value);
    }
    if (cd.present) {
      map['cd'] = Variable<int>(cd.value);
    }
    if (equipamentUuid.present) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid.value);
    }
    if (mediumDamageValue.present) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (criticalMultiplier.present) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier.value);
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
    return (StringBuffer('ActionHandToHandTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionDistanceAttackTableTable extends ActionDistanceAttackTable
    with
        TableInfo<$ActionDistanceAttackTableTable,
            ActionDistanceAttackTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionDistanceAttackTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _damageDicesMeta =
      const VerificationMeta('damageDices');
  @override
  late final GeneratedColumn<String> damageDices = GeneratedColumn<String>(
      'damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDamageDicesMeta =
      const VerificationMeta('extraDamageDices');
  @override
  late final GeneratedColumn<String> extraDamageDices = GeneratedColumn<String>(
      'extra_damage_dices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pmMeta = const VerificationMeta('pm');
  @override
  late final GeneratedColumn<int> pm = GeneratedColumn<int>(
      'pm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cdMeta = const VerificationMeta('cd');
  @override
  late final GeneratedColumn<int> cd = GeneratedColumn<int>(
      'cd', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _equipamentUuidMeta =
      const VerificationMeta('equipamentUuid');
  @override
  late final GeneratedColumn<String> equipamentUuid = GeneratedColumn<String>(
      'equipament_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediumDamageValueMeta =
      const VerificationMeta('mediumDamageValue');
  @override
  late final GeneratedColumn<int> mediumDamageValue = GeneratedColumn<int>(
      'medium_damage_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMeta =
      const VerificationMeta('critical');
  @override
  late final GeneratedColumn<int> critical = GeneratedColumn<int>(
      'critical', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _criticalMultiplierMeta =
      const VerificationMeta('criticalMultiplier');
  @override
  late final GeneratedColumn<int> criticalMultiplier = GeneratedColumn<int>(
      'critical_multiplier', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        parentUuid,
        desc,
        damageDices,
        extraDamageDices,
        pm,
        cd,
        equipamentUuid,
        mediumDamageValue,
        critical,
        criticalMultiplier,
        typeIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_distance_attack_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActionDistanceAttackTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('damage_dices')) {
      context.handle(
          _damageDicesMeta,
          damageDices.isAcceptableOrUnknown(
              data['damage_dices']!, _damageDicesMeta));
    }
    if (data.containsKey('extra_damage_dices')) {
      context.handle(
          _extraDamageDicesMeta,
          extraDamageDices.isAcceptableOrUnknown(
              data['extra_damage_dices']!, _extraDamageDicesMeta));
    }
    if (data.containsKey('pm')) {
      context.handle(_pmMeta, pm.isAcceptableOrUnknown(data['pm']!, _pmMeta));
    }
    if (data.containsKey('cd')) {
      context.handle(_cdMeta, cd.isAcceptableOrUnknown(data['cd']!, _cdMeta));
    }
    if (data.containsKey('equipament_uuid')) {
      context.handle(
          _equipamentUuidMeta,
          equipamentUuid.isAcceptableOrUnknown(
              data['equipament_uuid']!, _equipamentUuidMeta));
    }
    if (data.containsKey('medium_damage_value')) {
      context.handle(
          _mediumDamageValueMeta,
          mediumDamageValue.isAcceptableOrUnknown(
              data['medium_damage_value']!, _mediumDamageValueMeta));
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical']!, _criticalMeta));
    }
    if (data.containsKey('critical_multiplier')) {
      context.handle(
          _criticalMultiplierMeta,
          criticalMultiplier.isAcceptableOrUnknown(
              data['critical_multiplier']!, _criticalMultiplierMeta));
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
  ActionDistanceAttackTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionDistanceAttackTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      damageDices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_dices']),
      extraDamageDices: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_damage_dices']),
      pm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pm']),
      cd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cd']),
      equipamentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipament_uuid']),
      mediumDamageValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medium_damage_value']),
      critical: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}critical']),
      criticalMultiplier: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}critical_multiplier']),
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $ActionDistanceAttackTableTable createAlias(String alias) {
    return $ActionDistanceAttackTableTable(attachedDatabase, alias);
  }
}

class ActionDistanceAttackTableData extends DataClass
    implements Insertable<ActionDistanceAttackTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final String desc;
  final String? damageDices;
  final String? extraDamageDices;
  final int? pm;
  final int? cd;
  final String? equipamentUuid;
  final int? mediumDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final int typeIndex;
  const ActionDistanceAttackTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      required this.desc,
      this.damageDices,
      this.extraDamageDices,
      this.pm,
      this.cd,
      this.equipamentUuid,
      this.mediumDamageValue,
      this.critical,
      this.criticalMultiplier,
      required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    map['desc'] = Variable<String>(desc);
    if (!nullToAbsent || damageDices != null) {
      map['damage_dices'] = Variable<String>(damageDices);
    }
    if (!nullToAbsent || extraDamageDices != null) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices);
    }
    if (!nullToAbsent || pm != null) {
      map['pm'] = Variable<int>(pm);
    }
    if (!nullToAbsent || cd != null) {
      map['cd'] = Variable<int>(cd);
    }
    if (!nullToAbsent || equipamentUuid != null) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid);
    }
    if (!nullToAbsent || mediumDamageValue != null) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue);
    }
    if (!nullToAbsent || critical != null) {
      map['critical'] = Variable<int>(critical);
    }
    if (!nullToAbsent || criticalMultiplier != null) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier);
    }
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  ActionDistanceAttackTableCompanion toCompanion(bool nullToAbsent) {
    return ActionDistanceAttackTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      desc: Value(desc),
      damageDices: damageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(damageDices),
      extraDamageDices: extraDamageDices == null && nullToAbsent
          ? const Value.absent()
          : Value(extraDamageDices),
      pm: pm == null && nullToAbsent ? const Value.absent() : Value(pm),
      cd: cd == null && nullToAbsent ? const Value.absent() : Value(cd),
      equipamentUuid: equipamentUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(equipamentUuid),
      mediumDamageValue: mediumDamageValue == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumDamageValue),
      critical: critical == null && nullToAbsent
          ? const Value.absent()
          : Value(critical),
      criticalMultiplier: criticalMultiplier == null && nullToAbsent
          ? const Value.absent()
          : Value(criticalMultiplier),
      typeIndex: Value(typeIndex),
    );
  }

  factory ActionDistanceAttackTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionDistanceAttackTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      desc: serializer.fromJson<String>(json['desc']),
      damageDices: serializer.fromJson<String?>(json['damageDices']),
      extraDamageDices: serializer.fromJson<String?>(json['extraDamageDices']),
      pm: serializer.fromJson<int?>(json['pm']),
      cd: serializer.fromJson<int?>(json['cd']),
      equipamentUuid: serializer.fromJson<String?>(json['equipamentUuid']),
      mediumDamageValue: serializer.fromJson<int?>(json['mediumDamageValue']),
      critical: serializer.fromJson<int?>(json['critical']),
      criticalMultiplier: serializer.fromJson<int?>(json['criticalMultiplier']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'desc': serializer.toJson<String>(desc),
      'damageDices': serializer.toJson<String?>(damageDices),
      'extraDamageDices': serializer.toJson<String?>(extraDamageDices),
      'pm': serializer.toJson<int?>(pm),
      'cd': serializer.toJson<int?>(cd),
      'equipamentUuid': serializer.toJson<String?>(equipamentUuid),
      'mediumDamageValue': serializer.toJson<int?>(mediumDamageValue),
      'critical': serializer.toJson<int?>(critical),
      'criticalMultiplier': serializer.toJson<int?>(criticalMultiplier),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  ActionDistanceAttackTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          String? desc,
          Value<String?> damageDices = const Value.absent(),
          Value<String?> extraDamageDices = const Value.absent(),
          Value<int?> pm = const Value.absent(),
          Value<int?> cd = const Value.absent(),
          Value<String?> equipamentUuid = const Value.absent(),
          Value<int?> mediumDamageValue = const Value.absent(),
          Value<int?> critical = const Value.absent(),
          Value<int?> criticalMultiplier = const Value.absent(),
          int? typeIndex}) =>
      ActionDistanceAttackTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        desc: desc ?? this.desc,
        damageDices: damageDices.present ? damageDices.value : this.damageDices,
        extraDamageDices: extraDamageDices.present
            ? extraDamageDices.value
            : this.extraDamageDices,
        pm: pm.present ? pm.value : this.pm,
        cd: cd.present ? cd.value : this.cd,
        equipamentUuid:
            equipamentUuid.present ? equipamentUuid.value : this.equipamentUuid,
        mediumDamageValue: mediumDamageValue.present
            ? mediumDamageValue.value
            : this.mediumDamageValue,
        critical: critical.present ? critical.value : this.critical,
        criticalMultiplier: criticalMultiplier.present
            ? criticalMultiplier.value
            : this.criticalMultiplier,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  ActionDistanceAttackTableData copyWithCompanion(
      ActionDistanceAttackTableCompanion data) {
    return ActionDistanceAttackTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      desc: data.desc.present ? data.desc.value : this.desc,
      damageDices:
          data.damageDices.present ? data.damageDices.value : this.damageDices,
      extraDamageDices: data.extraDamageDices.present
          ? data.extraDamageDices.value
          : this.extraDamageDices,
      pm: data.pm.present ? data.pm.value : this.pm,
      cd: data.cd.present ? data.cd.value : this.cd,
      equipamentUuid: data.equipamentUuid.present
          ? data.equipamentUuid.value
          : this.equipamentUuid,
      mediumDamageValue: data.mediumDamageValue.present
          ? data.mediumDamageValue.value
          : this.mediumDamageValue,
      critical: data.critical.present ? data.critical.value : this.critical,
      criticalMultiplier: data.criticalMultiplier.present
          ? data.criticalMultiplier.value
          : this.criticalMultiplier,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionDistanceAttackTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid,
      name,
      parentUuid,
      desc,
      damageDices,
      extraDamageDices,
      pm,
      cd,
      equipamentUuid,
      mediumDamageValue,
      critical,
      criticalMultiplier,
      typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionDistanceAttackTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.desc == this.desc &&
          other.damageDices == this.damageDices &&
          other.extraDamageDices == this.extraDamageDices &&
          other.pm == this.pm &&
          other.cd == this.cd &&
          other.equipamentUuid == this.equipamentUuid &&
          other.mediumDamageValue == this.mediumDamageValue &&
          other.critical == this.critical &&
          other.criticalMultiplier == this.criticalMultiplier &&
          other.typeIndex == this.typeIndex);
}

class ActionDistanceAttackTableCompanion
    extends UpdateCompanion<ActionDistanceAttackTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<String> desc;
  final Value<String?> damageDices;
  final Value<String?> extraDamageDices;
  final Value<int?> pm;
  final Value<int?> cd;
  final Value<String?> equipamentUuid;
  final Value<int?> mediumDamageValue;
  final Value<int?> critical;
  final Value<int?> criticalMultiplier;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const ActionDistanceAttackTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.desc = const Value.absent(),
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionDistanceAttackTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    required String desc,
    this.damageDices = const Value.absent(),
    this.extraDamageDices = const Value.absent(),
    this.pm = const Value.absent(),
    this.cd = const Value.absent(),
    this.equipamentUuid = const Value.absent(),
    this.mediumDamageValue = const Value.absent(),
    this.critical = const Value.absent(),
    this.criticalMultiplier = const Value.absent(),
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        desc = Value(desc),
        typeIndex = Value(typeIndex);
  static Insertable<ActionDistanceAttackTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<String>? desc,
    Expression<String>? damageDices,
    Expression<String>? extraDamageDices,
    Expression<int>? pm,
    Expression<int>? cd,
    Expression<String>? equipamentUuid,
    Expression<int>? mediumDamageValue,
    Expression<int>? critical,
    Expression<int>? criticalMultiplier,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (desc != null) 'desc': desc,
      if (damageDices != null) 'damage_dices': damageDices,
      if (extraDamageDices != null) 'extra_damage_dices': extraDamageDices,
      if (pm != null) 'pm': pm,
      if (cd != null) 'cd': cd,
      if (equipamentUuid != null) 'equipament_uuid': equipamentUuid,
      if (mediumDamageValue != null) 'medium_damage_value': mediumDamageValue,
      if (critical != null) 'critical': critical,
      if (criticalMultiplier != null) 'critical_multiplier': criticalMultiplier,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionDistanceAttackTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<String>? desc,
      Value<String?>? damageDices,
      Value<String?>? extraDamageDices,
      Value<int?>? pm,
      Value<int?>? cd,
      Value<String?>? equipamentUuid,
      Value<int?>? mediumDamageValue,
      Value<int?>? critical,
      Value<int?>? criticalMultiplier,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return ActionDistanceAttackTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      desc: desc ?? this.desc,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      equipamentUuid: equipamentUuid ?? this.equipamentUuid,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
      critical: critical ?? this.critical,
      criticalMultiplier: criticalMultiplier ?? this.criticalMultiplier,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (damageDices.present) {
      map['damage_dices'] = Variable<String>(damageDices.value);
    }
    if (extraDamageDices.present) {
      map['extra_damage_dices'] = Variable<String>(extraDamageDices.value);
    }
    if (pm.present) {
      map['pm'] = Variable<int>(pm.value);
    }
    if (cd.present) {
      map['cd'] = Variable<int>(cd.value);
    }
    if (equipamentUuid.present) {
      map['equipament_uuid'] = Variable<String>(equipamentUuid.value);
    }
    if (mediumDamageValue.present) {
      map['medium_damage_value'] = Variable<int>(mediumDamageValue.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (criticalMultiplier.present) {
      map['critical_multiplier'] = Variable<int>(criticalMultiplier.value);
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
    return (StringBuffer('ActionDistanceAttackTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('desc: $desc, ')
          ..write('damageDices: $damageDices, ')
          ..write('extraDamageDices: $extraDamageDices, ')
          ..write('pm: $pm, ')
          ..write('cd: $cd, ')
          ..write('equipamentUuid: $equipamentUuid, ')
          ..write('mediumDamageValue: $mediumDamageValue, ')
          ..write('critical: $critical, ')
          ..write('criticalMultiplier: $criticalMultiplier, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpertiseTableTable extends ExpertiseTable
    with TableInfo<$ExpertiseTableTable, ExpertiseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpertiseTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentUuidMeta =
      const VerificationMeta('parentUuid');
  @override
  late final GeneratedColumn<String> parentUuid = GeneratedColumn<String>(
      'parent_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _atributeIndexMeta =
      const VerificationMeta('atributeIndex');
  @override
  late final GeneratedColumn<int> atributeIndex = GeneratedColumn<int>(
      'atribute_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bonusMeta = const VerificationMeta('bonus');
  @override
  late final GeneratedColumn<int> bonus = GeneratedColumn<int>(
      'bonus', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _valueFinalMeta =
      const VerificationMeta('valueFinal');
  @override
  late final GeneratedColumn<int> valueFinal = GeneratedColumn<int>(
      'value_final', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isTrainedMeta =
      const VerificationMeta('isTrained');
  @override
  late final GeneratedColumn<bool> isTrained = GeneratedColumn<bool>(
      'is_trained', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_trained" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, name, parentUuid, id, atributeIndex, bonus, valueFinal, isTrained];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expertise_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExpertiseTableData> instance,
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
    if (data.containsKey('parent_uuid')) {
      context.handle(
          _parentUuidMeta,
          parentUuid.isAcceptableOrUnknown(
              data['parent_uuid']!, _parentUuidMeta));
    } else if (isInserting) {
      context.missing(_parentUuidMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('atribute_index')) {
      context.handle(
          _atributeIndexMeta,
          atributeIndex.isAcceptableOrUnknown(
              data['atribute_index']!, _atributeIndexMeta));
    } else if (isInserting) {
      context.missing(_atributeIndexMeta);
    }
    if (data.containsKey('bonus')) {
      context.handle(
          _bonusMeta, bonus.isAcceptableOrUnknown(data['bonus']!, _bonusMeta));
    }
    if (data.containsKey('value_final')) {
      context.handle(
          _valueFinalMeta,
          valueFinal.isAcceptableOrUnknown(
              data['value_final']!, _valueFinalMeta));
    }
    if (data.containsKey('is_trained')) {
      context.handle(_isTrainedMeta,
          isTrained.isAcceptableOrUnknown(data['is_trained']!, _isTrainedMeta));
    } else if (isInserting) {
      context.missing(_isTrainedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ExpertiseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpertiseTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_uuid'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      atributeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}atribute_index'])!,
      bonus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bonus']),
      valueFinal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value_final']),
      isTrained: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_trained'])!,
    );
  }

  @override
  $ExpertiseTableTable createAlias(String alias) {
    return $ExpertiseTableTable(attachedDatabase, alias);
  }
}

class ExpertiseTableData extends DataClass
    implements Insertable<ExpertiseTableData> {
  final String uuid;
  final String name;
  final String parentUuid;
  final int id;
  final int atributeIndex;
  final int? bonus;
  final int? valueFinal;
  final bool isTrained;
  const ExpertiseTableData(
      {required this.uuid,
      required this.name,
      required this.parentUuid,
      required this.id,
      required this.atributeIndex,
      this.bonus,
      this.valueFinal,
      required this.isTrained});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['parent_uuid'] = Variable<String>(parentUuid);
    map['id'] = Variable<int>(id);
    map['atribute_index'] = Variable<int>(atributeIndex);
    if (!nullToAbsent || bonus != null) {
      map['bonus'] = Variable<int>(bonus);
    }
    if (!nullToAbsent || valueFinal != null) {
      map['value_final'] = Variable<int>(valueFinal);
    }
    map['is_trained'] = Variable<bool>(isTrained);
    return map;
  }

  ExpertiseTableCompanion toCompanion(bool nullToAbsent) {
    return ExpertiseTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      parentUuid: Value(parentUuid),
      id: Value(id),
      atributeIndex: Value(atributeIndex),
      bonus:
          bonus == null && nullToAbsent ? const Value.absent() : Value(bonus),
      valueFinal: valueFinal == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFinal),
      isTrained: Value(isTrained),
    );
  }

  factory ExpertiseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpertiseTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      parentUuid: serializer.fromJson<String>(json['parentUuid']),
      id: serializer.fromJson<int>(json['id']),
      atributeIndex: serializer.fromJson<int>(json['atributeIndex']),
      bonus: serializer.fromJson<int?>(json['bonus']),
      valueFinal: serializer.fromJson<int?>(json['valueFinal']),
      isTrained: serializer.fromJson<bool>(json['isTrained']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'parentUuid': serializer.toJson<String>(parentUuid),
      'id': serializer.toJson<int>(id),
      'atributeIndex': serializer.toJson<int>(atributeIndex),
      'bonus': serializer.toJson<int?>(bonus),
      'valueFinal': serializer.toJson<int?>(valueFinal),
      'isTrained': serializer.toJson<bool>(isTrained),
    };
  }

  ExpertiseTableData copyWith(
          {String? uuid,
          String? name,
          String? parentUuid,
          int? id,
          int? atributeIndex,
          Value<int?> bonus = const Value.absent(),
          Value<int?> valueFinal = const Value.absent(),
          bool? isTrained}) =>
      ExpertiseTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        parentUuid: parentUuid ?? this.parentUuid,
        id: id ?? this.id,
        atributeIndex: atributeIndex ?? this.atributeIndex,
        bonus: bonus.present ? bonus.value : this.bonus,
        valueFinal: valueFinal.present ? valueFinal.value : this.valueFinal,
        isTrained: isTrained ?? this.isTrained,
      );
  ExpertiseTableData copyWithCompanion(ExpertiseTableCompanion data) {
    return ExpertiseTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      parentUuid:
          data.parentUuid.present ? data.parentUuid.value : this.parentUuid,
      id: data.id.present ? data.id.value : this.id,
      atributeIndex: data.atributeIndex.present
          ? data.atributeIndex.value
          : this.atributeIndex,
      bonus: data.bonus.present ? data.bonus.value : this.bonus,
      valueFinal:
          data.valueFinal.present ? data.valueFinal.value : this.valueFinal,
      isTrained: data.isTrained.present ? data.isTrained.value : this.isTrained,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpertiseTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('id: $id, ')
          ..write('atributeIndex: $atributeIndex, ')
          ..write('bonus: $bonus, ')
          ..write('valueFinal: $valueFinal, ')
          ..write('isTrained: $isTrained')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid, name, parentUuid, id, atributeIndex, bonus, valueFinal, isTrained);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpertiseTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.parentUuid == this.parentUuid &&
          other.id == this.id &&
          other.atributeIndex == this.atributeIndex &&
          other.bonus == this.bonus &&
          other.valueFinal == this.valueFinal &&
          other.isTrained == this.isTrained);
}

class ExpertiseTableCompanion extends UpdateCompanion<ExpertiseTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> parentUuid;
  final Value<int> id;
  final Value<int> atributeIndex;
  final Value<int?> bonus;
  final Value<int?> valueFinal;
  final Value<bool> isTrained;
  final Value<int> rowid;
  const ExpertiseTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.parentUuid = const Value.absent(),
    this.id = const Value.absent(),
    this.atributeIndex = const Value.absent(),
    this.bonus = const Value.absent(),
    this.valueFinal = const Value.absent(),
    this.isTrained = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpertiseTableCompanion.insert({
    required String uuid,
    required String name,
    required String parentUuid,
    required int id,
    required int atributeIndex,
    this.bonus = const Value.absent(),
    this.valueFinal = const Value.absent(),
    required bool isTrained,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        parentUuid = Value(parentUuid),
        id = Value(id),
        atributeIndex = Value(atributeIndex),
        isTrained = Value(isTrained);
  static Insertable<ExpertiseTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? parentUuid,
    Expression<int>? id,
    Expression<int>? atributeIndex,
    Expression<int>? bonus,
    Expression<int>? valueFinal,
    Expression<bool>? isTrained,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (parentUuid != null) 'parent_uuid': parentUuid,
      if (id != null) 'id': id,
      if (atributeIndex != null) 'atribute_index': atributeIndex,
      if (bonus != null) 'bonus': bonus,
      if (valueFinal != null) 'value_final': valueFinal,
      if (isTrained != null) 'is_trained': isTrained,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpertiseTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? parentUuid,
      Value<int>? id,
      Value<int>? atributeIndex,
      Value<int?>? bonus,
      Value<int?>? valueFinal,
      Value<bool>? isTrained,
      Value<int>? rowid}) {
    return ExpertiseTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      parentUuid: parentUuid ?? this.parentUuid,
      id: id ?? this.id,
      atributeIndex: atributeIndex ?? this.atributeIndex,
      bonus: bonus ?? this.bonus,
      valueFinal: valueFinal ?? this.valueFinal,
      isTrained: isTrained ?? this.isTrained,
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
    if (parentUuid.present) {
      map['parent_uuid'] = Variable<String>(parentUuid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (atributeIndex.present) {
      map['atribute_index'] = Variable<int>(atributeIndex.value);
    }
    if (bonus.present) {
      map['bonus'] = Variable<int>(bonus.value);
    }
    if (valueFinal.present) {
      map['value_final'] = Variable<int>(valueFinal.value);
    }
    if (isTrained.present) {
      map['is_trained'] = Variable<bool>(isTrained.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpertiseTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('parentUuid: $parentUuid, ')
          ..write('id: $id, ')
          ..write('atributeIndex: $atributeIndex, ')
          ..write('bonus: $bonus, ')
          ..write('valueFinal: $valueFinal, ')
          ..write('isTrained: $isTrained, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MenaceLinkBoardTableTable extends MenaceLinkBoardTable
    with TableInfo<$MenaceLinkBoardTableTable, MenaceLinkBoardTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenaceLinkBoardTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _menaceUuidMeta =
      const VerificationMeta('menaceUuid');
  @override
  late final GeneratedColumn<String> menaceUuid = GeneratedColumn<String>(
      'menace_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardUuidMeta =
      const VerificationMeta('boardUuid');
  @override
  late final GeneratedColumn<String> boardUuid = GeneratedColumn<String>(
      'board_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, menaceUuid, boardUuid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menace_link_board_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MenaceLinkBoardTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('menace_uuid')) {
      context.handle(
          _menaceUuidMeta,
          menaceUuid.isAcceptableOrUnknown(
              data['menace_uuid']!, _menaceUuidMeta));
    } else if (isInserting) {
      context.missing(_menaceUuidMeta);
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
  MenaceLinkBoardTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenaceLinkBoardTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      menaceUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}menace_uuid'])!,
      boardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_uuid'])!,
    );
  }

  @override
  $MenaceLinkBoardTableTable createAlias(String alias) {
    return $MenaceLinkBoardTableTable(attachedDatabase, alias);
  }
}

class MenaceLinkBoardTableData extends DataClass
    implements Insertable<MenaceLinkBoardTableData> {
  final String uuid;
  final String menaceUuid;
  final String boardUuid;
  const MenaceLinkBoardTableData(
      {required this.uuid, required this.menaceUuid, required this.boardUuid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['menace_uuid'] = Variable<String>(menaceUuid);
    map['board_uuid'] = Variable<String>(boardUuid);
    return map;
  }

  MenaceLinkBoardTableCompanion toCompanion(bool nullToAbsent) {
    return MenaceLinkBoardTableCompanion(
      uuid: Value(uuid),
      menaceUuid: Value(menaceUuid),
      boardUuid: Value(boardUuid),
    );
  }

  factory MenaceLinkBoardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenaceLinkBoardTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      menaceUuid: serializer.fromJson<String>(json['menaceUuid']),
      boardUuid: serializer.fromJson<String>(json['boardUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'menaceUuid': serializer.toJson<String>(menaceUuid),
      'boardUuid': serializer.toJson<String>(boardUuid),
    };
  }

  MenaceLinkBoardTableData copyWith(
          {String? uuid, String? menaceUuid, String? boardUuid}) =>
      MenaceLinkBoardTableData(
        uuid: uuid ?? this.uuid,
        menaceUuid: menaceUuid ?? this.menaceUuid,
        boardUuid: boardUuid ?? this.boardUuid,
      );
  MenaceLinkBoardTableData copyWithCompanion(
      MenaceLinkBoardTableCompanion data) {
    return MenaceLinkBoardTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      menaceUuid:
          data.menaceUuid.present ? data.menaceUuid.value : this.menaceUuid,
      boardUuid: data.boardUuid.present ? data.boardUuid.value : this.boardUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenaceLinkBoardTableData(')
          ..write('uuid: $uuid, ')
          ..write('menaceUuid: $menaceUuid, ')
          ..write('boardUuid: $boardUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, menaceUuid, boardUuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenaceLinkBoardTableData &&
          other.uuid == this.uuid &&
          other.menaceUuid == this.menaceUuid &&
          other.boardUuid == this.boardUuid);
}

class MenaceLinkBoardTableCompanion
    extends UpdateCompanion<MenaceLinkBoardTableData> {
  final Value<String> uuid;
  final Value<String> menaceUuid;
  final Value<String> boardUuid;
  final Value<int> rowid;
  const MenaceLinkBoardTableCompanion({
    this.uuid = const Value.absent(),
    this.menaceUuid = const Value.absent(),
    this.boardUuid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenaceLinkBoardTableCompanion.insert({
    required String uuid,
    required String menaceUuid,
    required String boardUuid,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        menaceUuid = Value(menaceUuid),
        boardUuid = Value(boardUuid);
  static Insertable<MenaceLinkBoardTableData> custom({
    Expression<String>? uuid,
    Expression<String>? menaceUuid,
    Expression<String>? boardUuid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (menaceUuid != null) 'menace_uuid': menaceUuid,
      if (boardUuid != null) 'board_uuid': boardUuid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenaceLinkBoardTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? menaceUuid,
      Value<String>? boardUuid,
      Value<int>? rowid}) {
    return MenaceLinkBoardTableCompanion(
      uuid: uuid ?? this.uuid,
      menaceUuid: menaceUuid ?? this.menaceUuid,
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
    if (menaceUuid.present) {
      map['menace_uuid'] = Variable<String>(menaceUuid.value);
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
    return (StringBuffer('MenaceLinkBoardTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('menaceUuid: $menaceUuid, ')
          ..write('boardUuid: $boardUuid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConfigTableTable extends ConfigTable
    with TableInfo<$ConfigTableTable, ConfigTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _modeIndexMeta =
      const VerificationMeta('modeIndex');
  @override
  late final GeneratedColumn<int> modeIndex = GeneratedColumn<int>(
      'mode_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _showApresetationMeta =
      const VerificationMeta('showApresetation');
  @override
  late final GeneratedColumn<bool> showApresetation = GeneratedColumn<bool>(
      'show_apresetation', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_apresetation" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _enableBottomBackButtonMeta =
      const VerificationMeta('enableBottomBackButton');
  @override
  late final GeneratedColumn<bool> enableBottomBackButton =
      GeneratedColumn<bool>('enable_bottom_back_button', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("enable_bottom_back_button" IN (0, 1))'),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, modeIndex, showApresetation, enableBottomBackButton];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'config_table';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mode_index')) {
      context.handle(_modeIndexMeta,
          modeIndex.isAcceptableOrUnknown(data['mode_index']!, _modeIndexMeta));
    }
    if (data.containsKey('show_apresetation')) {
      context.handle(
          _showApresetationMeta,
          showApresetation.isAcceptableOrUnknown(
              data['show_apresetation']!, _showApresetationMeta));
    }
    if (data.containsKey('enable_bottom_back_button')) {
      context.handle(
          _enableBottomBackButtonMeta,
          enableBottomBackButton.isAcceptableOrUnknown(
              data['enable_bottom_back_button']!, _enableBottomBackButtonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      modeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mode_index'])!,
      showApresetation: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}show_apresetation'])!,
      enableBottomBackButton: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}enable_bottom_back_button'])!,
    );
  }

  @override
  $ConfigTableTable createAlias(String alias) {
    return $ConfigTableTable(attachedDatabase, alias);
  }
}

class ConfigTableData extends DataClass implements Insertable<ConfigTableData> {
  final int id;
  final int modeIndex;
  final bool showApresetation;
  final bool enableBottomBackButton;
  const ConfigTableData(
      {required this.id,
      required this.modeIndex,
      required this.showApresetation,
      required this.enableBottomBackButton});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mode_index'] = Variable<int>(modeIndex);
    map['show_apresetation'] = Variable<bool>(showApresetation);
    map['enable_bottom_back_button'] = Variable<bool>(enableBottomBackButton);
    return map;
  }

  ConfigTableCompanion toCompanion(bool nullToAbsent) {
    return ConfigTableCompanion(
      id: Value(id),
      modeIndex: Value(modeIndex),
      showApresetation: Value(showApresetation),
      enableBottomBackButton: Value(enableBottomBackButton),
    );
  }

  factory ConfigTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigTableData(
      id: serializer.fromJson<int>(json['id']),
      modeIndex: serializer.fromJson<int>(json['modeIndex']),
      showApresetation: serializer.fromJson<bool>(json['showApresetation']),
      enableBottomBackButton:
          serializer.fromJson<bool>(json['enableBottomBackButton']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modeIndex': serializer.toJson<int>(modeIndex),
      'showApresetation': serializer.toJson<bool>(showApresetation),
      'enableBottomBackButton': serializer.toJson<bool>(enableBottomBackButton),
    };
  }

  ConfigTableData copyWith(
          {int? id,
          int? modeIndex,
          bool? showApresetation,
          bool? enableBottomBackButton}) =>
      ConfigTableData(
        id: id ?? this.id,
        modeIndex: modeIndex ?? this.modeIndex,
        showApresetation: showApresetation ?? this.showApresetation,
        enableBottomBackButton:
            enableBottomBackButton ?? this.enableBottomBackButton,
      );
  ConfigTableData copyWithCompanion(ConfigTableCompanion data) {
    return ConfigTableData(
      id: data.id.present ? data.id.value : this.id,
      modeIndex: data.modeIndex.present ? data.modeIndex.value : this.modeIndex,
      showApresetation: data.showApresetation.present
          ? data.showApresetation.value
          : this.showApresetation,
      enableBottomBackButton: data.enableBottomBackButton.present
          ? data.enableBottomBackButton.value
          : this.enableBottomBackButton,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfigTableData(')
          ..write('id: $id, ')
          ..write('modeIndex: $modeIndex, ')
          ..write('showApresetation: $showApresetation, ')
          ..write('enableBottomBackButton: $enableBottomBackButton')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, modeIndex, showApresetation, enableBottomBackButton);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigTableData &&
          other.id == this.id &&
          other.modeIndex == this.modeIndex &&
          other.showApresetation == this.showApresetation &&
          other.enableBottomBackButton == this.enableBottomBackButton);
}

class ConfigTableCompanion extends UpdateCompanion<ConfigTableData> {
  final Value<int> id;
  final Value<int> modeIndex;
  final Value<bool> showApresetation;
  final Value<bool> enableBottomBackButton;
  const ConfigTableCompanion({
    this.id = const Value.absent(),
    this.modeIndex = const Value.absent(),
    this.showApresetation = const Value.absent(),
    this.enableBottomBackButton = const Value.absent(),
  });
  ConfigTableCompanion.insert({
    this.id = const Value.absent(),
    this.modeIndex = const Value.absent(),
    this.showApresetation = const Value.absent(),
    this.enableBottomBackButton = const Value.absent(),
  });
  static Insertable<ConfigTableData> custom({
    Expression<int>? id,
    Expression<int>? modeIndex,
    Expression<bool>? showApresetation,
    Expression<bool>? enableBottomBackButton,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modeIndex != null) 'mode_index': modeIndex,
      if (showApresetation != null) 'show_apresetation': showApresetation,
      if (enableBottomBackButton != null)
        'enable_bottom_back_button': enableBottomBackButton,
    });
  }

  ConfigTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? modeIndex,
      Value<bool>? showApresetation,
      Value<bool>? enableBottomBackButton}) {
    return ConfigTableCompanion(
      id: id ?? this.id,
      modeIndex: modeIndex ?? this.modeIndex,
      showApresetation: showApresetation ?? this.showApresetation,
      enableBottomBackButton:
          enableBottomBackButton ?? this.enableBottomBackButton,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modeIndex.present) {
      map['mode_index'] = Variable<int>(modeIndex.value);
    }
    if (showApresetation.present) {
      map['show_apresetation'] = Variable<bool>(showApresetation.value);
    }
    if (enableBottomBackButton.present) {
      map['enable_bottom_back_button'] =
          Variable<bool>(enableBottomBackButton.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigTableCompanion(')
          ..write('id: $id, ')
          ..write('modeIndex: $modeIndex, ')
          ..write('showApresetation: $showApresetation, ')
          ..write('enableBottomBackButton: $enableBottomBackButton')
          ..write(')'))
        .toString();
  }
}

class $CharacterTableTable extends CharacterTable
    with TableInfo<$CharacterTableTable, CharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _displacementMeta =
      const VerificationMeta('displacement');
  @override
  late final GeneratedColumn<String> displacement = GeneratedColumn<String>(
      'displacement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sensesMeta = const VerificationMeta('senses');
  @override
  late final GeneratedColumn<String> senses = GeneratedColumn<String>(
      'senses', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _divinityIdMeta =
      const VerificationMeta('divinityId');
  @override
  late final GeneratedColumn<int> divinityId = GeneratedColumn<int>(
      'divinity_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _perceptionMeta =
      const VerificationMeta('perception');
  @override
  late final GeneratedColumn<int> perception = GeneratedColumn<int>(
      'perception', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseMeta =
      const VerificationMeta('defense');
  @override
  late final GeneratedColumn<int> defense = GeneratedColumn<int>(
      'defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityMeta =
      const VerificationMeta('dexterity');
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
      'dexterity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionMeta =
      const VerificationMeta('constitution');
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
      'constitution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
      'intelligence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
      'wisdom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaMeta =
      const VerificationMeta('charisma');
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
      'charisma', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creatureSizeIndexMeta =
      const VerificationMeta('creatureSizeIndex');
  @override
  late final GeneratedColumn<int> creatureSizeIndex = GeneratedColumn<int>(
      'creature_size_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _broodIndexMeta =
      const VerificationMeta('broodIndex');
  @override
  late final GeneratedColumn<int> broodIndex = GeneratedColumn<int>(
      'brood_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _grimoireUuidMeta =
      const VerificationMeta('grimoireUuid');
  @override
  late final GeneratedColumn<String> grimoireUuid = GeneratedColumn<String>(
      'grimoire_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _trainedExpertisesIndexesMeta =
      const VerificationMeta('trainedExpertisesIndexes');
  @override
  late final GeneratedColumn<String> trainedExpertisesIndexes =
      GeneratedColumn<String>('trained_expertises_indexes', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aligmentIndexMeta =
      const VerificationMeta('aligmentIndex');
  @override
  late final GeneratedColumn<int> aligmentIndex = GeneratedColumn<int>(
      'aligment_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        senses,
        divinityId,
        perception,
        defense,
        life,
        mana,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        creatureSizeIndex,
        broodIndex,
        grimoireUuid,
        createdAt,
        updatedAt,
        trainedExpertisesIndexes,
        aligmentIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_table';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterTableData> instance,
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
    if (data.containsKey('displacement')) {
      context.handle(
          _displacementMeta,
          displacement.isAcceptableOrUnknown(
              data['displacement']!, _displacementMeta));
    }
    if (data.containsKey('senses')) {
      context.handle(_sensesMeta,
          senses.isAcceptableOrUnknown(data['senses']!, _sensesMeta));
    }
    if (data.containsKey('divinity_id')) {
      context.handle(
          _divinityIdMeta,
          divinityId.isAcceptableOrUnknown(
              data['divinity_id']!, _divinityIdMeta));
    }
    if (data.containsKey('perception')) {
      context.handle(
          _perceptionMeta,
          perception.isAcceptableOrUnknown(
              data['perception']!, _perceptionMeta));
    } else if (isInserting) {
      context.missing(_perceptionMeta);
    }
    if (data.containsKey('defense')) {
      context.handle(_defenseMeta,
          defense.isAcceptableOrUnknown(data['defense']!, _defenseMeta));
    } else if (isInserting) {
      context.missing(_defenseMeta);
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
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('dexterity')) {
      context.handle(_dexterityMeta,
          dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta));
    } else if (isInserting) {
      context.missing(_dexterityMeta);
    }
    if (data.containsKey('constitution')) {
      context.handle(
          _constitutionMeta,
          constitution.isAcceptableOrUnknown(
              data['constitution']!, _constitutionMeta));
    } else if (isInserting) {
      context.missing(_constitutionMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(_wisdomMeta,
          wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta));
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(_charismaMeta,
          charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta));
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('creature_size_index')) {
      context.handle(
          _creatureSizeIndexMeta,
          creatureSizeIndex.isAcceptableOrUnknown(
              data['creature_size_index']!, _creatureSizeIndexMeta));
    } else if (isInserting) {
      context.missing(_creatureSizeIndexMeta);
    }
    if (data.containsKey('brood_index')) {
      context.handle(
          _broodIndexMeta,
          broodIndex.isAcceptableOrUnknown(
              data['brood_index']!, _broodIndexMeta));
    } else if (isInserting) {
      context.missing(_broodIndexMeta);
    }
    if (data.containsKey('grimoire_uuid')) {
      context.handle(
          _grimoireUuidMeta,
          grimoireUuid.isAcceptableOrUnknown(
              data['grimoire_uuid']!, _grimoireUuidMeta));
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
    if (data.containsKey('trained_expertises_indexes')) {
      context.handle(
          _trainedExpertisesIndexesMeta,
          trainedExpertisesIndexes.isAcceptableOrUnknown(
              data['trained_expertises_indexes']!,
              _trainedExpertisesIndexesMeta));
    }
    if (data.containsKey('aligment_index')) {
      context.handle(
          _aligmentIndexMeta,
          aligmentIndex.isAcceptableOrUnknown(
              data['aligment_index']!, _aligmentIndexMeta));
    } else if (isInserting) {
      context.missing(_aligmentIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  CharacterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      imageAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_asset']),
      displacement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}displacement']),
      senses: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}senses']),
      divinityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}divinity_id']),
      perception: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}perception'])!,
      defense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense'])!,
      life: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}life'])!,
      mana: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mana'])!,
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength'])!,
      dexterity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity'])!,
      constitution: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution'])!,
      intelligence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence'])!,
      wisdom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom'])!,
      charisma: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma'])!,
      creatureSizeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}creature_size_index'])!,
      broodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brood_index'])!,
      grimoireUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grimoire_uuid']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
      trainedExpertisesIndexes: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}trained_expertises_indexes']),
      aligmentIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}aligment_index'])!,
    );
  }

  @override
  $CharacterTableTable createAlias(String alias) {
    return $CharacterTableTable(attachedDatabase, alias);
  }
}

class CharacterTableData extends DataClass
    implements Insertable<CharacterTableData> {
  final String uuid;
  final String name;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final String? senses;
  final int? divinityId;
  final int perception;
  final int defense;
  final int life;
  final int mana;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int creatureSizeIndex;
  final int broodIndex;
  final String? grimoireUuid;
  final int createdAt;
  final int updatedAt;
  final String? trainedExpertisesIndexes;
  final int aligmentIndex;
  const CharacterTableData(
      {required this.uuid,
      required this.name,
      this.imagePath,
      this.imageAsset,
      this.displacement,
      this.senses,
      this.divinityId,
      required this.perception,
      required this.defense,
      required this.life,
      required this.mana,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma,
      required this.creatureSizeIndex,
      required this.broodIndex,
      this.grimoireUuid,
      required this.createdAt,
      required this.updatedAt,
      this.trainedExpertisesIndexes,
      required this.aligmentIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    if (!nullToAbsent || displacement != null) {
      map['displacement'] = Variable<String>(displacement);
    }
    if (!nullToAbsent || senses != null) {
      map['senses'] = Variable<String>(senses);
    }
    if (!nullToAbsent || divinityId != null) {
      map['divinity_id'] = Variable<int>(divinityId);
    }
    map['perception'] = Variable<int>(perception);
    map['defense'] = Variable<int>(defense);
    map['life'] = Variable<int>(life);
    map['mana'] = Variable<int>(mana);
    map['strength'] = Variable<int>(strength);
    map['dexterity'] = Variable<int>(dexterity);
    map['constitution'] = Variable<int>(constitution);
    map['intelligence'] = Variable<int>(intelligence);
    map['wisdom'] = Variable<int>(wisdom);
    map['charisma'] = Variable<int>(charisma);
    map['creature_size_index'] = Variable<int>(creatureSizeIndex);
    map['brood_index'] = Variable<int>(broodIndex);
    if (!nullToAbsent || grimoireUuid != null) {
      map['grimoire_uuid'] = Variable<String>(grimoireUuid);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || trainedExpertisesIndexes != null) {
      map['trained_expertises_indexes'] =
          Variable<String>(trainedExpertisesIndexes);
    }
    map['aligment_index'] = Variable<int>(aligmentIndex);
    return map;
  }

  CharacterTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      displacement: displacement == null && nullToAbsent
          ? const Value.absent()
          : Value(displacement),
      senses:
          senses == null && nullToAbsent ? const Value.absent() : Value(senses),
      divinityId: divinityId == null && nullToAbsent
          ? const Value.absent()
          : Value(divinityId),
      perception: Value(perception),
      defense: Value(defense),
      life: Value(life),
      mana: Value(mana),
      strength: Value(strength),
      dexterity: Value(dexterity),
      constitution: Value(constitution),
      intelligence: Value(intelligence),
      wisdom: Value(wisdom),
      charisma: Value(charisma),
      creatureSizeIndex: Value(creatureSizeIndex),
      broodIndex: Value(broodIndex),
      grimoireUuid: grimoireUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(grimoireUuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      trainedExpertisesIndexes: trainedExpertisesIndexes == null && nullToAbsent
          ? const Value.absent()
          : Value(trainedExpertisesIndexes),
      aligmentIndex: Value(aligmentIndex),
    );
  }

  factory CharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      displacement: serializer.fromJson<String?>(json['displacement']),
      senses: serializer.fromJson<String?>(json['senses']),
      divinityId: serializer.fromJson<int?>(json['divinityId']),
      perception: serializer.fromJson<int>(json['perception']),
      defense: serializer.fromJson<int>(json['defense']),
      life: serializer.fromJson<int>(json['life']),
      mana: serializer.fromJson<int>(json['mana']),
      strength: serializer.fromJson<int>(json['strength']),
      dexterity: serializer.fromJson<int>(json['dexterity']),
      constitution: serializer.fromJson<int>(json['constitution']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      charisma: serializer.fromJson<int>(json['charisma']),
      creatureSizeIndex: serializer.fromJson<int>(json['creatureSizeIndex']),
      broodIndex: serializer.fromJson<int>(json['broodIndex']),
      grimoireUuid: serializer.fromJson<String?>(json['grimoireUuid']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      trainedExpertisesIndexes:
          serializer.fromJson<String?>(json['trainedExpertisesIndexes']),
      aligmentIndex: serializer.fromJson<int>(json['aligmentIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'displacement': serializer.toJson<String?>(displacement),
      'senses': serializer.toJson<String?>(senses),
      'divinityId': serializer.toJson<int?>(divinityId),
      'perception': serializer.toJson<int>(perception),
      'defense': serializer.toJson<int>(defense),
      'life': serializer.toJson<int>(life),
      'mana': serializer.toJson<int>(mana),
      'strength': serializer.toJson<int>(strength),
      'dexterity': serializer.toJson<int>(dexterity),
      'constitution': serializer.toJson<int>(constitution),
      'intelligence': serializer.toJson<int>(intelligence),
      'wisdom': serializer.toJson<int>(wisdom),
      'charisma': serializer.toJson<int>(charisma),
      'creatureSizeIndex': serializer.toJson<int>(creatureSizeIndex),
      'broodIndex': serializer.toJson<int>(broodIndex),
      'grimoireUuid': serializer.toJson<String?>(grimoireUuid),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'trainedExpertisesIndexes':
          serializer.toJson<String?>(trainedExpertisesIndexes),
      'aligmentIndex': serializer.toJson<int>(aligmentIndex),
    };
  }

  CharacterTableData copyWith(
          {String? uuid,
          String? name,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> imageAsset = const Value.absent(),
          Value<String?> displacement = const Value.absent(),
          Value<String?> senses = const Value.absent(),
          Value<int?> divinityId = const Value.absent(),
          int? perception,
          int? defense,
          int? life,
          int? mana,
          int? strength,
          int? dexterity,
          int? constitution,
          int? intelligence,
          int? wisdom,
          int? charisma,
          int? creatureSizeIndex,
          int? broodIndex,
          Value<String?> grimoireUuid = const Value.absent(),
          int? createdAt,
          int? updatedAt,
          Value<String?> trainedExpertisesIndexes = const Value.absent(),
          int? aligmentIndex}) =>
      CharacterTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
        displacement:
            displacement.present ? displacement.value : this.displacement,
        senses: senses.present ? senses.value : this.senses,
        divinityId: divinityId.present ? divinityId.value : this.divinityId,
        perception: perception ?? this.perception,
        defense: defense ?? this.defense,
        life: life ?? this.life,
        mana: mana ?? this.mana,
        strength: strength ?? this.strength,
        dexterity: dexterity ?? this.dexterity,
        constitution: constitution ?? this.constitution,
        intelligence: intelligence ?? this.intelligence,
        wisdom: wisdom ?? this.wisdom,
        charisma: charisma ?? this.charisma,
        creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
        broodIndex: broodIndex ?? this.broodIndex,
        grimoireUuid:
            grimoireUuid.present ? grimoireUuid.value : this.grimoireUuid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        trainedExpertisesIndexes: trainedExpertisesIndexes.present
            ? trainedExpertisesIndexes.value
            : this.trainedExpertisesIndexes,
        aligmentIndex: aligmentIndex ?? this.aligmentIndex,
      );
  CharacterTableData copyWithCompanion(CharacterTableCompanion data) {
    return CharacterTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageAsset:
          data.imageAsset.present ? data.imageAsset.value : this.imageAsset,
      displacement: data.displacement.present
          ? data.displacement.value
          : this.displacement,
      senses: data.senses.present ? data.senses.value : this.senses,
      divinityId:
          data.divinityId.present ? data.divinityId.value : this.divinityId,
      perception:
          data.perception.present ? data.perception.value : this.perception,
      defense: data.defense.present ? data.defense.value : this.defense,
      life: data.life.present ? data.life.value : this.life,
      mana: data.mana.present ? data.mana.value : this.mana,
      strength: data.strength.present ? data.strength.value : this.strength,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      creatureSizeIndex: data.creatureSizeIndex.present
          ? data.creatureSizeIndex.value
          : this.creatureSizeIndex,
      broodIndex:
          data.broodIndex.present ? data.broodIndex.value : this.broodIndex,
      grimoireUuid: data.grimoireUuid.present
          ? data.grimoireUuid.value
          : this.grimoireUuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      trainedExpertisesIndexes: data.trainedExpertisesIndexes.present
          ? data.trainedExpertisesIndexes.value
          : this.trainedExpertisesIndexes,
      aligmentIndex: data.aligmentIndex.present
          ? data.aligmentIndex.value
          : this.aligmentIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('senses: $senses, ')
          ..write('divinityId: $divinityId, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('grimoireUuid: $grimoireUuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('trainedExpertisesIndexes: $trainedExpertisesIndexes, ')
          ..write('aligmentIndex: $aligmentIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        uuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        senses,
        divinityId,
        perception,
        defense,
        life,
        mana,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        creatureSizeIndex,
        broodIndex,
        grimoireUuid,
        createdAt,
        updatedAt,
        trainedExpertisesIndexes,
        aligmentIndex
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.imageAsset == this.imageAsset &&
          other.displacement == this.displacement &&
          other.senses == this.senses &&
          other.divinityId == this.divinityId &&
          other.perception == this.perception &&
          other.defense == this.defense &&
          other.life == this.life &&
          other.mana == this.mana &&
          other.strength == this.strength &&
          other.dexterity == this.dexterity &&
          other.constitution == this.constitution &&
          other.intelligence == this.intelligence &&
          other.wisdom == this.wisdom &&
          other.charisma == this.charisma &&
          other.creatureSizeIndex == this.creatureSizeIndex &&
          other.broodIndex == this.broodIndex &&
          other.grimoireUuid == this.grimoireUuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.trainedExpertisesIndexes == this.trainedExpertisesIndexes &&
          other.aligmentIndex == this.aligmentIndex);
}

class CharacterTableCompanion extends UpdateCompanion<CharacterTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<String?> displacement;
  final Value<String?> senses;
  final Value<int?> divinityId;
  final Value<int> perception;
  final Value<int> defense;
  final Value<int> life;
  final Value<int> mana;
  final Value<int> strength;
  final Value<int> dexterity;
  final Value<int> constitution;
  final Value<int> intelligence;
  final Value<int> wisdom;
  final Value<int> charisma;
  final Value<int> creatureSizeIndex;
  final Value<int> broodIndex;
  final Value<String?> grimoireUuid;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String?> trainedExpertisesIndexes;
  final Value<int> aligmentIndex;
  final Value<int> rowid;
  const CharacterTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.senses = const Value.absent(),
    this.divinityId = const Value.absent(),
    this.perception = const Value.absent(),
    this.defense = const Value.absent(),
    this.life = const Value.absent(),
    this.mana = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.creatureSizeIndex = const Value.absent(),
    this.broodIndex = const Value.absent(),
    this.grimoireUuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.trainedExpertisesIndexes = const Value.absent(),
    this.aligmentIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterTableCompanion.insert({
    required String uuid,
    required String name,
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.senses = const Value.absent(),
    this.divinityId = const Value.absent(),
    required int perception,
    required int defense,
    required int life,
    required int mana,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
    required int creatureSizeIndex,
    required int broodIndex,
    this.grimoireUuid = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.trainedExpertisesIndexes = const Value.absent(),
    required int aligmentIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        perception = Value(perception),
        defense = Value(defense),
        life = Value(life),
        mana = Value(mana),
        strength = Value(strength),
        dexterity = Value(dexterity),
        constitution = Value(constitution),
        intelligence = Value(intelligence),
        wisdom = Value(wisdom),
        charisma = Value(charisma),
        creatureSizeIndex = Value(creatureSizeIndex),
        broodIndex = Value(broodIndex),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        aligmentIndex = Value(aligmentIndex);
  static Insertable<CharacterTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<String>? displacement,
    Expression<String>? senses,
    Expression<int>? divinityId,
    Expression<int>? perception,
    Expression<int>? defense,
    Expression<int>? life,
    Expression<int>? mana,
    Expression<int>? strength,
    Expression<int>? dexterity,
    Expression<int>? constitution,
    Expression<int>? intelligence,
    Expression<int>? wisdom,
    Expression<int>? charisma,
    Expression<int>? creatureSizeIndex,
    Expression<int>? broodIndex,
    Expression<String>? grimoireUuid,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? trainedExpertisesIndexes,
    Expression<int>? aligmentIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (displacement != null) 'displacement': displacement,
      if (senses != null) 'senses': senses,
      if (divinityId != null) 'divinity_id': divinityId,
      if (perception != null) 'perception': perception,
      if (defense != null) 'defense': defense,
      if (life != null) 'life': life,
      if (mana != null) 'mana': mana,
      if (strength != null) 'strength': strength,
      if (dexterity != null) 'dexterity': dexterity,
      if (constitution != null) 'constitution': constitution,
      if (intelligence != null) 'intelligence': intelligence,
      if (wisdom != null) 'wisdom': wisdom,
      if (charisma != null) 'charisma': charisma,
      if (creatureSizeIndex != null) 'creature_size_index': creatureSizeIndex,
      if (broodIndex != null) 'brood_index': broodIndex,
      if (grimoireUuid != null) 'grimoire_uuid': grimoireUuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (trainedExpertisesIndexes != null)
        'trained_expertises_indexes': trainedExpertisesIndexes,
      if (aligmentIndex != null) 'aligment_index': aligmentIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String?>? imagePath,
      Value<String?>? imageAsset,
      Value<String?>? displacement,
      Value<String?>? senses,
      Value<int?>? divinityId,
      Value<int>? perception,
      Value<int>? defense,
      Value<int>? life,
      Value<int>? mana,
      Value<int>? strength,
      Value<int>? dexterity,
      Value<int>? constitution,
      Value<int>? intelligence,
      Value<int>? wisdom,
      Value<int>? charisma,
      Value<int>? creatureSizeIndex,
      Value<int>? broodIndex,
      Value<String?>? grimoireUuid,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<String?>? trainedExpertisesIndexes,
      Value<int>? aligmentIndex,
      Value<int>? rowid}) {
    return CharacterTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      displacement: displacement ?? this.displacement,
      senses: senses ?? this.senses,
      divinityId: divinityId ?? this.divinityId,
      perception: perception ?? this.perception,
      defense: defense ?? this.defense,
      life: life ?? this.life,
      mana: mana ?? this.mana,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
      broodIndex: broodIndex ?? this.broodIndex,
      grimoireUuid: grimoireUuid ?? this.grimoireUuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      trainedExpertisesIndexes:
          trainedExpertisesIndexes ?? this.trainedExpertisesIndexes,
      aligmentIndex: aligmentIndex ?? this.aligmentIndex,
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
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (displacement.present) {
      map['displacement'] = Variable<String>(displacement.value);
    }
    if (senses.present) {
      map['senses'] = Variable<String>(senses.value);
    }
    if (divinityId.present) {
      map['divinity_id'] = Variable<int>(divinityId.value);
    }
    if (perception.present) {
      map['perception'] = Variable<int>(perception.value);
    }
    if (defense.present) {
      map['defense'] = Variable<int>(defense.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (mana.present) {
      map['mana'] = Variable<int>(mana.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (creatureSizeIndex.present) {
      map['creature_size_index'] = Variable<int>(creatureSizeIndex.value);
    }
    if (broodIndex.present) {
      map['brood_index'] = Variable<int>(broodIndex.value);
    }
    if (grimoireUuid.present) {
      map['grimoire_uuid'] = Variable<String>(grimoireUuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (trainedExpertisesIndexes.present) {
      map['trained_expertises_indexes'] =
          Variable<String>(trainedExpertisesIndexes.value);
    }
    if (aligmentIndex.present) {
      map['aligment_index'] = Variable<int>(aligmentIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('senses: $senses, ')
          ..write('divinityId: $divinityId, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('grimoireUuid: $grimoireUuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('trainedExpertisesIndexes: $trainedExpertisesIndexes, ')
          ..write('aligmentIndex: $aligmentIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClasseCharacterTableTable extends ClasseCharacterTable
    with TableInfo<$ClasseCharacterTableTable, ClasseCharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClasseCharacterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterUuidMeta =
      const VerificationMeta('characterUuid');
  @override
  late final GeneratedColumn<String> characterUuid = GeneratedColumn<String>(
      'character_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, characterUuid, typeIndex, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classe_character_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ClasseCharacterTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('character_uuid')) {
      context.handle(
          _characterUuidMeta,
          characterUuid.isAcceptableOrUnknown(
              data['character_uuid']!, _characterUuidMeta));
    } else if (isInserting) {
      context.missing(_characterUuidMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ClasseCharacterTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClasseCharacterTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      characterUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_uuid'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
    );
  }

  @override
  $ClasseCharacterTableTable createAlias(String alias) {
    return $ClasseCharacterTableTable(attachedDatabase, alias);
  }
}

class ClasseCharacterTableData extends DataClass
    implements Insertable<ClasseCharacterTableData> {
  final String uuid;
  final String characterUuid;
  final int typeIndex;
  final int level;
  const ClasseCharacterTableData(
      {required this.uuid,
      required this.characterUuid,
      required this.typeIndex,
      required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['character_uuid'] = Variable<String>(characterUuid);
    map['type_index'] = Variable<int>(typeIndex);
    map['level'] = Variable<int>(level);
    return map;
  }

  ClasseCharacterTableCompanion toCompanion(bool nullToAbsent) {
    return ClasseCharacterTableCompanion(
      uuid: Value(uuid),
      characterUuid: Value(characterUuid),
      typeIndex: Value(typeIndex),
      level: Value(level),
    );
  }

  factory ClasseCharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClasseCharacterTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      characterUuid: serializer.fromJson<String>(json['characterUuid']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'characterUuid': serializer.toJson<String>(characterUuid),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'level': serializer.toJson<int>(level),
    };
  }

  ClasseCharacterTableData copyWith(
          {String? uuid, String? characterUuid, int? typeIndex, int? level}) =>
      ClasseCharacterTableData(
        uuid: uuid ?? this.uuid,
        characterUuid: characterUuid ?? this.characterUuid,
        typeIndex: typeIndex ?? this.typeIndex,
        level: level ?? this.level,
      );
  ClasseCharacterTableData copyWithCompanion(
      ClasseCharacterTableCompanion data) {
    return ClasseCharacterTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      characterUuid: data.characterUuid.present
          ? data.characterUuid.value
          : this.characterUuid,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClasseCharacterTableData(')
          ..write('uuid: $uuid, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, characterUuid, typeIndex, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClasseCharacterTableData &&
          other.uuid == this.uuid &&
          other.characterUuid == this.characterUuid &&
          other.typeIndex == this.typeIndex &&
          other.level == this.level);
}

class ClasseCharacterTableCompanion
    extends UpdateCompanion<ClasseCharacterTableData> {
  final Value<String> uuid;
  final Value<String> characterUuid;
  final Value<int> typeIndex;
  final Value<int> level;
  final Value<int> rowid;
  const ClasseCharacterTableCompanion({
    this.uuid = const Value.absent(),
    this.characterUuid = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClasseCharacterTableCompanion.insert({
    required String uuid,
    required String characterUuid,
    required int typeIndex,
    required int level,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        characterUuid = Value(characterUuid),
        typeIndex = Value(typeIndex),
        level = Value(level);
  static Insertable<ClasseCharacterTableData> custom({
    Expression<String>? uuid,
    Expression<String>? characterUuid,
    Expression<int>? typeIndex,
    Expression<int>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (characterUuid != null) 'character_uuid': characterUuid,
      if (typeIndex != null) 'type_index': typeIndex,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClasseCharacterTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? characterUuid,
      Value<int>? typeIndex,
      Value<int>? level,
      Value<int>? rowid}) {
    return ClasseCharacterTableCompanion(
      uuid: uuid ?? this.uuid,
      characterUuid: characterUuid ?? this.characterUuid,
      typeIndex: typeIndex ?? this.typeIndex,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (characterUuid.present) {
      map['character_uuid'] = Variable<String>(characterUuid.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClasseCharacterTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OriginTableTable extends OriginTable
    with TableInfo<$OriginTableTable, OriginTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OriginTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterUuidMeta =
      const VerificationMeta('characterUuid');
  @override
  late final GeneratedColumn<String> characterUuid = GeneratedColumn<String>(
      'character_uuid', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [uuid, characterUuid, name, desc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'origin_table';
  @override
  VerificationContext validateIntegrity(Insertable<OriginTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('character_uuid')) {
      context.handle(
          _characterUuidMeta,
          characterUuid.isAcceptableOrUnknown(
              data['character_uuid']!, _characterUuidMeta));
    } else if (isInserting) {
      context.missing(_characterUuidMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  OriginTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OriginTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      characterUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
    );
  }

  @override
  $OriginTableTable createAlias(String alias) {
    return $OriginTableTable(attachedDatabase, alias);
  }
}

class OriginTableData extends DataClass implements Insertable<OriginTableData> {
  final String uuid;
  final String characterUuid;
  final String name;
  final String desc;
  const OriginTableData(
      {required this.uuid,
      required this.characterUuid,
      required this.name,
      required this.desc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['character_uuid'] = Variable<String>(characterUuid);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    return map;
  }

  OriginTableCompanion toCompanion(bool nullToAbsent) {
    return OriginTableCompanion(
      uuid: Value(uuid),
      characterUuid: Value(characterUuid),
      name: Value(name),
      desc: Value(desc),
    );
  }

  factory OriginTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OriginTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      characterUuid: serializer.fromJson<String>(json['characterUuid']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'characterUuid': serializer.toJson<String>(characterUuid),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
    };
  }

  OriginTableData copyWith(
          {String? uuid, String? characterUuid, String? name, String? desc}) =>
      OriginTableData(
        uuid: uuid ?? this.uuid,
        characterUuid: characterUuid ?? this.characterUuid,
        name: name ?? this.name,
        desc: desc ?? this.desc,
      );
  OriginTableData copyWithCompanion(OriginTableCompanion data) {
    return OriginTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      characterUuid: data.characterUuid.present
          ? data.characterUuid.value
          : this.characterUuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OriginTableData(')
          ..write('uuid: $uuid, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, characterUuid, name, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OriginTableData &&
          other.uuid == this.uuid &&
          other.characterUuid == this.characterUuid &&
          other.name == this.name &&
          other.desc == this.desc);
}

class OriginTableCompanion extends UpdateCompanion<OriginTableData> {
  final Value<String> uuid;
  final Value<String> characterUuid;
  final Value<String> name;
  final Value<String> desc;
  final Value<int> rowid;
  const OriginTableCompanion({
    this.uuid = const Value.absent(),
    this.characterUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OriginTableCompanion.insert({
    required String uuid,
    required String characterUuid,
    required String name,
    required String desc,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        characterUuid = Value(characterUuid),
        name = Value(name),
        desc = Value(desc);
  static Insertable<OriginTableData> custom({
    Expression<String>? uuid,
    Expression<String>? characterUuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (characterUuid != null) 'character_uuid': characterUuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OriginTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? characterUuid,
      Value<String>? name,
      Value<String>? desc,
      Value<int>? rowid}) {
    return OriginTableCompanion(
      uuid: uuid ?? this.uuid,
      characterUuid: characterUuid ?? this.characterUuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (characterUuid.present) {
      map['character_uuid'] = Variable<String>(characterUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OriginTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PowerTableTable extends PowerTable
    with TableInfo<$PowerTableTable, PowerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PowerTableTable(this.attachedDatabase, [this._alias]);
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
      'desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterUuidMeta =
      const VerificationMeta('characterUuid');
  @override
  late final GeneratedColumn<String> characterUuid = GeneratedColumn<String>(
      'character_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, name, desc, characterUuid, typeIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'power_table';
  @override
  VerificationContext validateIntegrity(Insertable<PowerTableData> instance,
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
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('character_uuid')) {
      context.handle(
          _characterUuidMeta,
          characterUuid.isAcceptableOrUnknown(
              data['character_uuid']!, _characterUuidMeta));
    } else if (isInserting) {
      context.missing(_characterUuidMeta);
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
  PowerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PowerTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
      characterUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_uuid'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
    );
  }

  @override
  $PowerTableTable createAlias(String alias) {
    return $PowerTableTable(attachedDatabase, alias);
  }
}

class PowerTableData extends DataClass implements Insertable<PowerTableData> {
  final String uuid;
  final String name;
  final String desc;
  final String characterUuid;
  final int typeIndex;
  const PowerTableData(
      {required this.uuid,
      required this.name,
      required this.desc,
      required this.characterUuid,
      required this.typeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['character_uuid'] = Variable<String>(characterUuid);
    map['type_index'] = Variable<int>(typeIndex);
    return map;
  }

  PowerTableCompanion toCompanion(bool nullToAbsent) {
    return PowerTableCompanion(
      uuid: Value(uuid),
      name: Value(name),
      desc: Value(desc),
      characterUuid: Value(characterUuid),
      typeIndex: Value(typeIndex),
    );
  }

  factory PowerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PowerTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      characterUuid: serializer.fromJson<String>(json['characterUuid']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'characterUuid': serializer.toJson<String>(characterUuid),
      'typeIndex': serializer.toJson<int>(typeIndex),
    };
  }

  PowerTableData copyWith(
          {String? uuid,
          String? name,
          String? desc,
          String? characterUuid,
          int? typeIndex}) =>
      PowerTableData(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        characterUuid: characterUuid ?? this.characterUuid,
        typeIndex: typeIndex ?? this.typeIndex,
      );
  PowerTableData copyWithCompanion(PowerTableCompanion data) {
    return PowerTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      characterUuid: data.characterUuid.present
          ? data.characterUuid.value
          : this.characterUuid,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PowerTableData(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('typeIndex: $typeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, desc, characterUuid, typeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PowerTableData &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.characterUuid == this.characterUuid &&
          other.typeIndex == this.typeIndex);
}

class PowerTableCompanion extends UpdateCompanion<PowerTableData> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> desc;
  final Value<String> characterUuid;
  final Value<int> typeIndex;
  final Value<int> rowid;
  const PowerTableCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.characterUuid = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PowerTableCompanion.insert({
    required String uuid,
    required String name,
    required String desc,
    required String characterUuid,
    required int typeIndex,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        desc = Value(desc),
        characterUuid = Value(characterUuid),
        typeIndex = Value(typeIndex);
  static Insertable<PowerTableData> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? characterUuid,
    Expression<int>? typeIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (characterUuid != null) 'character_uuid': characterUuid,
      if (typeIndex != null) 'type_index': typeIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PowerTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? desc,
      Value<String>? characterUuid,
      Value<int>? typeIndex,
      Value<int>? rowid}) {
    return PowerTableCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      characterUuid: characterUuid ?? this.characterUuid,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (characterUuid.present) {
      map['character_uuid'] = Variable<String>(characterUuid.value);
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
    return (StringBuffer('PowerTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('characterUuid: $characterUuid, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterBoardTableTable extends CharacterBoardTable
    with TableInfo<$CharacterBoardTableTable, CharacterBoardTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterBoardTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentuuidMeta =
      const VerificationMeta('parentuuid');
  @override
  late final GeneratedColumn<String> parentuuid = GeneratedColumn<String>(
      'parentuuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boarduuidMeta =
      const VerificationMeta('boarduuid');
  @override
  late final GeneratedColumn<String> boarduuid = GeneratedColumn<String>(
      'boarduuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
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
  static const VerificationMeta _displacementMeta =
      const VerificationMeta('displacement');
  @override
  late final GeneratedColumn<String> displacement = GeneratedColumn<String>(
      'displacement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sensesMeta = const VerificationMeta('senses');
  @override
  late final GeneratedColumn<String> senses = GeneratedColumn<String>(
      'senses', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _divinityIdMeta =
      const VerificationMeta('divinityId');
  @override
  late final GeneratedColumn<int> divinityId = GeneratedColumn<int>(
      'divinity_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _initiativeMeta =
      const VerificationMeta('initiative');
  @override
  late final GeneratedColumn<int> initiative = GeneratedColumn<int>(
      'initiative', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _perceptionMeta =
      const VerificationMeta('perception');
  @override
  late final GeneratedColumn<int> perception = GeneratedColumn<int>(
      'perception', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseMeta =
      const VerificationMeta('defense');
  @override
  late final GeneratedColumn<int> defense = GeneratedColumn<int>(
      'defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityMeta =
      const VerificationMeta('dexterity');
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
      'dexterity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionMeta =
      const VerificationMeta('constitution');
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
      'constitution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
      'intelligence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
      'wisdom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaMeta =
      const VerificationMeta('charisma');
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
      'charisma', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIndexMeta =
      const VerificationMeta('typeIndex');
  @override
  late final GeneratedColumn<int> typeIndex = GeneratedColumn<int>(
      'type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creatureSizeIndexMeta =
      const VerificationMeta('creatureSizeIndex');
  @override
  late final GeneratedColumn<int> creatureSizeIndex = GeneratedColumn<int>(
      'creature_size_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _broodIndexMeta =
      const VerificationMeta('broodIndex');
  @override
  late final GeneratedColumn<int> broodIndex = GeneratedColumn<int>(
      'brood_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _combateRoleIndexMeta =
      const VerificationMeta('combateRoleIndex');
  @override
  late final GeneratedColumn<int> combateRoleIndex = GeneratedColumn<int>(
      'combate_role_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _treasureTypeIndexMeta =
      const VerificationMeta('treasureTypeIndex');
  @override
  late final GeneratedColumn<int> treasureTypeIndex = GeneratedColumn<int>(
      'treasure_type_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _grimoireUuidMeta =
      const VerificationMeta('grimoireUuid');
  @override
  late final GeneratedColumn<String> grimoireUuid = GeneratedColumn<String>(
      'grimoire_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
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
  static const VerificationMeta _aligmentIndexMeta =
      const VerificationMeta('aligmentIndex');
  @override
  late final GeneratedColumn<int> aligmentIndex = GeneratedColumn<int>(
      'aligment_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentLifeMeta =
      const VerificationMeta('currentLife');
  @override
  late final GeneratedColumn<int> currentLife = GeneratedColumn<int>(
      'current_life', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentManaMeta =
      const VerificationMeta('currentMana');
  @override
  late final GeneratedColumn<int> currentMana = GeneratedColumn<int>(
      'current_mana', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inLeftHandMeta =
      const VerificationMeta('inLeftHand');
  @override
  late final GeneratedColumn<String> inLeftHand = GeneratedColumn<String>(
      'in_left_hand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _inRightHandMeta =
      const VerificationMeta('inRightHand');
  @override
  late final GeneratedColumn<String> inRightHand = GeneratedColumn<String>(
      'in_right_hand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _inTwoHandsMeta =
      const VerificationMeta('inTwoHands');
  @override
  late final GeneratedColumn<String> inTwoHands = GeneratedColumn<String>(
      'in_two_hands', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _inWearableSlotsMeta =
      const VerificationMeta('inWearableSlots');
  @override
  late final GeneratedColumn<String> inWearableSlots = GeneratedColumn<String>(
      'in_wearable_slots', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        parentuuid,
        boarduuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        senses,
        divinityId,
        initiative,
        perception,
        defense,
        life,
        mana,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        typeIndex,
        creatureSizeIndex,
        broodIndex,
        combateRoleIndex,
        treasureTypeIndex,
        grimoireUuid,
        createdAt,
        updatedAt,
        isAlive,
        aligmentIndex,
        currentLife,
        currentMana,
        inLeftHand,
        inRightHand,
        inTwoHands,
        inWearableSlots
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_board_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharacterBoardTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('parentuuid')) {
      context.handle(
          _parentuuidMeta,
          parentuuid.isAcceptableOrUnknown(
              data['parentuuid']!, _parentuuidMeta));
    } else if (isInserting) {
      context.missing(_parentuuidMeta);
    }
    if (data.containsKey('boarduuid')) {
      context.handle(_boarduuidMeta,
          boarduuid.isAcceptableOrUnknown(data['boarduuid']!, _boarduuidMeta));
    } else if (isInserting) {
      context.missing(_boarduuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    if (data.containsKey('displacement')) {
      context.handle(
          _displacementMeta,
          displacement.isAcceptableOrUnknown(
              data['displacement']!, _displacementMeta));
    }
    if (data.containsKey('senses')) {
      context.handle(_sensesMeta,
          senses.isAcceptableOrUnknown(data['senses']!, _sensesMeta));
    }
    if (data.containsKey('divinity_id')) {
      context.handle(
          _divinityIdMeta,
          divinityId.isAcceptableOrUnknown(
              data['divinity_id']!, _divinityIdMeta));
    }
    if (data.containsKey('initiative')) {
      context.handle(
          _initiativeMeta,
          initiative.isAcceptableOrUnknown(
              data['initiative']!, _initiativeMeta));
    } else if (isInserting) {
      context.missing(_initiativeMeta);
    }
    if (data.containsKey('perception')) {
      context.handle(
          _perceptionMeta,
          perception.isAcceptableOrUnknown(
              data['perception']!, _perceptionMeta));
    } else if (isInserting) {
      context.missing(_perceptionMeta);
    }
    if (data.containsKey('defense')) {
      context.handle(_defenseMeta,
          defense.isAcceptableOrUnknown(data['defense']!, _defenseMeta));
    } else if (isInserting) {
      context.missing(_defenseMeta);
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
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('dexterity')) {
      context.handle(_dexterityMeta,
          dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta));
    } else if (isInserting) {
      context.missing(_dexterityMeta);
    }
    if (data.containsKey('constitution')) {
      context.handle(
          _constitutionMeta,
          constitution.isAcceptableOrUnknown(
              data['constitution']!, _constitutionMeta));
    } else if (isInserting) {
      context.missing(_constitutionMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(_wisdomMeta,
          wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta));
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(_charismaMeta,
          charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta));
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index']!, _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('creature_size_index')) {
      context.handle(
          _creatureSizeIndexMeta,
          creatureSizeIndex.isAcceptableOrUnknown(
              data['creature_size_index']!, _creatureSizeIndexMeta));
    } else if (isInserting) {
      context.missing(_creatureSizeIndexMeta);
    }
    if (data.containsKey('brood_index')) {
      context.handle(
          _broodIndexMeta,
          broodIndex.isAcceptableOrUnknown(
              data['brood_index']!, _broodIndexMeta));
    } else if (isInserting) {
      context.missing(_broodIndexMeta);
    }
    if (data.containsKey('combate_role_index')) {
      context.handle(
          _combateRoleIndexMeta,
          combateRoleIndex.isAcceptableOrUnknown(
              data['combate_role_index']!, _combateRoleIndexMeta));
    } else if (isInserting) {
      context.missing(_combateRoleIndexMeta);
    }
    if (data.containsKey('treasure_type_index')) {
      context.handle(
          _treasureTypeIndexMeta,
          treasureTypeIndex.isAcceptableOrUnknown(
              data['treasure_type_index']!, _treasureTypeIndexMeta));
    }
    if (data.containsKey('grimoire_uuid')) {
      context.handle(
          _grimoireUuidMeta,
          grimoireUuid.isAcceptableOrUnknown(
              data['grimoire_uuid']!, _grimoireUuidMeta));
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
    if (data.containsKey('is_alive')) {
      context.handle(_isAliveMeta,
          isAlive.isAcceptableOrUnknown(data['is_alive']!, _isAliveMeta));
    } else if (isInserting) {
      context.missing(_isAliveMeta);
    }
    if (data.containsKey('aligment_index')) {
      context.handle(
          _aligmentIndexMeta,
          aligmentIndex.isAcceptableOrUnknown(
              data['aligment_index']!, _aligmentIndexMeta));
    } else if (isInserting) {
      context.missing(_aligmentIndexMeta);
    }
    if (data.containsKey('current_life')) {
      context.handle(
          _currentLifeMeta,
          currentLife.isAcceptableOrUnknown(
              data['current_life']!, _currentLifeMeta));
    } else if (isInserting) {
      context.missing(_currentLifeMeta);
    }
    if (data.containsKey('current_mana')) {
      context.handle(
          _currentManaMeta,
          currentMana.isAcceptableOrUnknown(
              data['current_mana']!, _currentManaMeta));
    } else if (isInserting) {
      context.missing(_currentManaMeta);
    }
    if (data.containsKey('in_left_hand')) {
      context.handle(
          _inLeftHandMeta,
          inLeftHand.isAcceptableOrUnknown(
              data['in_left_hand']!, _inLeftHandMeta));
    }
    if (data.containsKey('in_right_hand')) {
      context.handle(
          _inRightHandMeta,
          inRightHand.isAcceptableOrUnknown(
              data['in_right_hand']!, _inRightHandMeta));
    }
    if (data.containsKey('in_two_hands')) {
      context.handle(
          _inTwoHandsMeta,
          inTwoHands.isAcceptableOrUnknown(
              data['in_two_hands']!, _inTwoHandsMeta));
    }
    if (data.containsKey('in_wearable_slots')) {
      context.handle(
          _inWearableSlotsMeta,
          inWearableSlots.isAcceptableOrUnknown(
              data['in_wearable_slots']!, _inWearableSlotsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  CharacterBoardTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterBoardTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      parentuuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parentuuid'])!,
      boarduuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}boarduuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      imageAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_asset']),
      displacement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}displacement']),
      senses: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}senses']),
      divinityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}divinity_id']),
      initiative: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initiative'])!,
      perception: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}perception'])!,
      defense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense'])!,
      life: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}life'])!,
      mana: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mana'])!,
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength'])!,
      dexterity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity'])!,
      constitution: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution'])!,
      intelligence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence'])!,
      wisdom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom'])!,
      charisma: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma'])!,
      typeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_index'])!,
      creatureSizeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}creature_size_index'])!,
      broodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brood_index'])!,
      combateRoleIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}combate_role_index'])!,
      treasureTypeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}treasure_type_index']),
      grimoireUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grimoire_uuid']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
      isAlive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_alive'])!,
      aligmentIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}aligment_index'])!,
      currentLife: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_life'])!,
      currentMana: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_mana'])!,
      inLeftHand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}in_left_hand']),
      inRightHand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}in_right_hand']),
      inTwoHands: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}in_two_hands']),
      inWearableSlots: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}in_wearable_slots']),
    );
  }

  @override
  $CharacterBoardTableTable createAlias(String alias) {
    return $CharacterBoardTableTable(attachedDatabase, alias);
  }
}

class CharacterBoardTableData extends DataClass
    implements Insertable<CharacterBoardTableData> {
  final String uuid;
  final String parentuuid;
  final String boarduuid;
  final String name;
  final String? imagePath;
  final String? imageAsset;
  final String? displacement;
  final String? senses;
  final int? divinityId;
  final int initiative;
  final int perception;
  final int defense;
  final int life;
  final int mana;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int typeIndex;
  final int creatureSizeIndex;
  final int broodIndex;
  final int combateRoleIndex;
  final int? treasureTypeIndex;
  final String? grimoireUuid;
  final int createdAt;
  final int updatedAt;
  final bool isAlive;
  final int aligmentIndex;
  final int currentLife;
  final int currentMana;
  final String? inLeftHand;
  final String? inRightHand;
  final String? inTwoHands;
  final String? inWearableSlots;
  const CharacterBoardTableData(
      {required this.uuid,
      required this.parentuuid,
      required this.boarduuid,
      required this.name,
      this.imagePath,
      this.imageAsset,
      this.displacement,
      this.senses,
      this.divinityId,
      required this.initiative,
      required this.perception,
      required this.defense,
      required this.life,
      required this.mana,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma,
      required this.typeIndex,
      required this.creatureSizeIndex,
      required this.broodIndex,
      required this.combateRoleIndex,
      this.treasureTypeIndex,
      this.grimoireUuid,
      required this.createdAt,
      required this.updatedAt,
      required this.isAlive,
      required this.aligmentIndex,
      required this.currentLife,
      required this.currentMana,
      this.inLeftHand,
      this.inRightHand,
      this.inTwoHands,
      this.inWearableSlots});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['parentuuid'] = Variable<String>(parentuuid);
    map['boarduuid'] = Variable<String>(boarduuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    if (!nullToAbsent || displacement != null) {
      map['displacement'] = Variable<String>(displacement);
    }
    if (!nullToAbsent || senses != null) {
      map['senses'] = Variable<String>(senses);
    }
    if (!nullToAbsent || divinityId != null) {
      map['divinity_id'] = Variable<int>(divinityId);
    }
    map['initiative'] = Variable<int>(initiative);
    map['perception'] = Variable<int>(perception);
    map['defense'] = Variable<int>(defense);
    map['life'] = Variable<int>(life);
    map['mana'] = Variable<int>(mana);
    map['strength'] = Variable<int>(strength);
    map['dexterity'] = Variable<int>(dexterity);
    map['constitution'] = Variable<int>(constitution);
    map['intelligence'] = Variable<int>(intelligence);
    map['wisdom'] = Variable<int>(wisdom);
    map['charisma'] = Variable<int>(charisma);
    map['type_index'] = Variable<int>(typeIndex);
    map['creature_size_index'] = Variable<int>(creatureSizeIndex);
    map['brood_index'] = Variable<int>(broodIndex);
    map['combate_role_index'] = Variable<int>(combateRoleIndex);
    if (!nullToAbsent || treasureTypeIndex != null) {
      map['treasure_type_index'] = Variable<int>(treasureTypeIndex);
    }
    if (!nullToAbsent || grimoireUuid != null) {
      map['grimoire_uuid'] = Variable<String>(grimoireUuid);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['is_alive'] = Variable<bool>(isAlive);
    map['aligment_index'] = Variable<int>(aligmentIndex);
    map['current_life'] = Variable<int>(currentLife);
    map['current_mana'] = Variable<int>(currentMana);
    if (!nullToAbsent || inLeftHand != null) {
      map['in_left_hand'] = Variable<String>(inLeftHand);
    }
    if (!nullToAbsent || inRightHand != null) {
      map['in_right_hand'] = Variable<String>(inRightHand);
    }
    if (!nullToAbsent || inTwoHands != null) {
      map['in_two_hands'] = Variable<String>(inTwoHands);
    }
    if (!nullToAbsent || inWearableSlots != null) {
      map['in_wearable_slots'] = Variable<String>(inWearableSlots);
    }
    return map;
  }

  CharacterBoardTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterBoardTableCompanion(
      uuid: Value(uuid),
      parentuuid: Value(parentuuid),
      boarduuid: Value(boarduuid),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      displacement: displacement == null && nullToAbsent
          ? const Value.absent()
          : Value(displacement),
      senses:
          senses == null && nullToAbsent ? const Value.absent() : Value(senses),
      divinityId: divinityId == null && nullToAbsent
          ? const Value.absent()
          : Value(divinityId),
      initiative: Value(initiative),
      perception: Value(perception),
      defense: Value(defense),
      life: Value(life),
      mana: Value(mana),
      strength: Value(strength),
      dexterity: Value(dexterity),
      constitution: Value(constitution),
      intelligence: Value(intelligence),
      wisdom: Value(wisdom),
      charisma: Value(charisma),
      typeIndex: Value(typeIndex),
      creatureSizeIndex: Value(creatureSizeIndex),
      broodIndex: Value(broodIndex),
      combateRoleIndex: Value(combateRoleIndex),
      treasureTypeIndex: treasureTypeIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(treasureTypeIndex),
      grimoireUuid: grimoireUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(grimoireUuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isAlive: Value(isAlive),
      aligmentIndex: Value(aligmentIndex),
      currentLife: Value(currentLife),
      currentMana: Value(currentMana),
      inLeftHand: inLeftHand == null && nullToAbsent
          ? const Value.absent()
          : Value(inLeftHand),
      inRightHand: inRightHand == null && nullToAbsent
          ? const Value.absent()
          : Value(inRightHand),
      inTwoHands: inTwoHands == null && nullToAbsent
          ? const Value.absent()
          : Value(inTwoHands),
      inWearableSlots: inWearableSlots == null && nullToAbsent
          ? const Value.absent()
          : Value(inWearableSlots),
    );
  }

  factory CharacterBoardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterBoardTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      parentuuid: serializer.fromJson<String>(json['parentuuid']),
      boarduuid: serializer.fromJson<String>(json['boarduuid']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      displacement: serializer.fromJson<String?>(json['displacement']),
      senses: serializer.fromJson<String?>(json['senses']),
      divinityId: serializer.fromJson<int?>(json['divinityId']),
      initiative: serializer.fromJson<int>(json['initiative']),
      perception: serializer.fromJson<int>(json['perception']),
      defense: serializer.fromJson<int>(json['defense']),
      life: serializer.fromJson<int>(json['life']),
      mana: serializer.fromJson<int>(json['mana']),
      strength: serializer.fromJson<int>(json['strength']),
      dexterity: serializer.fromJson<int>(json['dexterity']),
      constitution: serializer.fromJson<int>(json['constitution']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      charisma: serializer.fromJson<int>(json['charisma']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      creatureSizeIndex: serializer.fromJson<int>(json['creatureSizeIndex']),
      broodIndex: serializer.fromJson<int>(json['broodIndex']),
      combateRoleIndex: serializer.fromJson<int>(json['combateRoleIndex']),
      treasureTypeIndex: serializer.fromJson<int?>(json['treasureTypeIndex']),
      grimoireUuid: serializer.fromJson<String?>(json['grimoireUuid']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      isAlive: serializer.fromJson<bool>(json['isAlive']),
      aligmentIndex: serializer.fromJson<int>(json['aligmentIndex']),
      currentLife: serializer.fromJson<int>(json['currentLife']),
      currentMana: serializer.fromJson<int>(json['currentMana']),
      inLeftHand: serializer.fromJson<String?>(json['inLeftHand']),
      inRightHand: serializer.fromJson<String?>(json['inRightHand']),
      inTwoHands: serializer.fromJson<String?>(json['inTwoHands']),
      inWearableSlots: serializer.fromJson<String?>(json['inWearableSlots']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'parentuuid': serializer.toJson<String>(parentuuid),
      'boarduuid': serializer.toJson<String>(boarduuid),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'displacement': serializer.toJson<String?>(displacement),
      'senses': serializer.toJson<String?>(senses),
      'divinityId': serializer.toJson<int?>(divinityId),
      'initiative': serializer.toJson<int>(initiative),
      'perception': serializer.toJson<int>(perception),
      'defense': serializer.toJson<int>(defense),
      'life': serializer.toJson<int>(life),
      'mana': serializer.toJson<int>(mana),
      'strength': serializer.toJson<int>(strength),
      'dexterity': serializer.toJson<int>(dexterity),
      'constitution': serializer.toJson<int>(constitution),
      'intelligence': serializer.toJson<int>(intelligence),
      'wisdom': serializer.toJson<int>(wisdom),
      'charisma': serializer.toJson<int>(charisma),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'creatureSizeIndex': serializer.toJson<int>(creatureSizeIndex),
      'broodIndex': serializer.toJson<int>(broodIndex),
      'combateRoleIndex': serializer.toJson<int>(combateRoleIndex),
      'treasureTypeIndex': serializer.toJson<int?>(treasureTypeIndex),
      'grimoireUuid': serializer.toJson<String?>(grimoireUuid),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'isAlive': serializer.toJson<bool>(isAlive),
      'aligmentIndex': serializer.toJson<int>(aligmentIndex),
      'currentLife': serializer.toJson<int>(currentLife),
      'currentMana': serializer.toJson<int>(currentMana),
      'inLeftHand': serializer.toJson<String?>(inLeftHand),
      'inRightHand': serializer.toJson<String?>(inRightHand),
      'inTwoHands': serializer.toJson<String?>(inTwoHands),
      'inWearableSlots': serializer.toJson<String?>(inWearableSlots),
    };
  }

  CharacterBoardTableData copyWith(
          {String? uuid,
          String? parentuuid,
          String? boarduuid,
          String? name,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> imageAsset = const Value.absent(),
          Value<String?> displacement = const Value.absent(),
          Value<String?> senses = const Value.absent(),
          Value<int?> divinityId = const Value.absent(),
          int? initiative,
          int? perception,
          int? defense,
          int? life,
          int? mana,
          int? strength,
          int? dexterity,
          int? constitution,
          int? intelligence,
          int? wisdom,
          int? charisma,
          int? typeIndex,
          int? creatureSizeIndex,
          int? broodIndex,
          int? combateRoleIndex,
          Value<int?> treasureTypeIndex = const Value.absent(),
          Value<String?> grimoireUuid = const Value.absent(),
          int? createdAt,
          int? updatedAt,
          bool? isAlive,
          int? aligmentIndex,
          int? currentLife,
          int? currentMana,
          Value<String?> inLeftHand = const Value.absent(),
          Value<String?> inRightHand = const Value.absent(),
          Value<String?> inTwoHands = const Value.absent(),
          Value<String?> inWearableSlots = const Value.absent()}) =>
      CharacterBoardTableData(
        uuid: uuid ?? this.uuid,
        parentuuid: parentuuid ?? this.parentuuid,
        boarduuid: boarduuid ?? this.boarduuid,
        name: name ?? this.name,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
        displacement:
            displacement.present ? displacement.value : this.displacement,
        senses: senses.present ? senses.value : this.senses,
        divinityId: divinityId.present ? divinityId.value : this.divinityId,
        initiative: initiative ?? this.initiative,
        perception: perception ?? this.perception,
        defense: defense ?? this.defense,
        life: life ?? this.life,
        mana: mana ?? this.mana,
        strength: strength ?? this.strength,
        dexterity: dexterity ?? this.dexterity,
        constitution: constitution ?? this.constitution,
        intelligence: intelligence ?? this.intelligence,
        wisdom: wisdom ?? this.wisdom,
        charisma: charisma ?? this.charisma,
        typeIndex: typeIndex ?? this.typeIndex,
        creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
        broodIndex: broodIndex ?? this.broodIndex,
        combateRoleIndex: combateRoleIndex ?? this.combateRoleIndex,
        treasureTypeIndex: treasureTypeIndex.present
            ? treasureTypeIndex.value
            : this.treasureTypeIndex,
        grimoireUuid:
            grimoireUuid.present ? grimoireUuid.value : this.grimoireUuid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isAlive: isAlive ?? this.isAlive,
        aligmentIndex: aligmentIndex ?? this.aligmentIndex,
        currentLife: currentLife ?? this.currentLife,
        currentMana: currentMana ?? this.currentMana,
        inLeftHand: inLeftHand.present ? inLeftHand.value : this.inLeftHand,
        inRightHand: inRightHand.present ? inRightHand.value : this.inRightHand,
        inTwoHands: inTwoHands.present ? inTwoHands.value : this.inTwoHands,
        inWearableSlots: inWearableSlots.present
            ? inWearableSlots.value
            : this.inWearableSlots,
      );
  CharacterBoardTableData copyWithCompanion(CharacterBoardTableCompanion data) {
    return CharacterBoardTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      parentuuid:
          data.parentuuid.present ? data.parentuuid.value : this.parentuuid,
      boarduuid: data.boarduuid.present ? data.boarduuid.value : this.boarduuid,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageAsset:
          data.imageAsset.present ? data.imageAsset.value : this.imageAsset,
      displacement: data.displacement.present
          ? data.displacement.value
          : this.displacement,
      senses: data.senses.present ? data.senses.value : this.senses,
      divinityId:
          data.divinityId.present ? data.divinityId.value : this.divinityId,
      initiative:
          data.initiative.present ? data.initiative.value : this.initiative,
      perception:
          data.perception.present ? data.perception.value : this.perception,
      defense: data.defense.present ? data.defense.value : this.defense,
      life: data.life.present ? data.life.value : this.life,
      mana: data.mana.present ? data.mana.value : this.mana,
      strength: data.strength.present ? data.strength.value : this.strength,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      typeIndex: data.typeIndex.present ? data.typeIndex.value : this.typeIndex,
      creatureSizeIndex: data.creatureSizeIndex.present
          ? data.creatureSizeIndex.value
          : this.creatureSizeIndex,
      broodIndex:
          data.broodIndex.present ? data.broodIndex.value : this.broodIndex,
      combateRoleIndex: data.combateRoleIndex.present
          ? data.combateRoleIndex.value
          : this.combateRoleIndex,
      treasureTypeIndex: data.treasureTypeIndex.present
          ? data.treasureTypeIndex.value
          : this.treasureTypeIndex,
      grimoireUuid: data.grimoireUuid.present
          ? data.grimoireUuid.value
          : this.grimoireUuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isAlive: data.isAlive.present ? data.isAlive.value : this.isAlive,
      aligmentIndex: data.aligmentIndex.present
          ? data.aligmentIndex.value
          : this.aligmentIndex,
      currentLife:
          data.currentLife.present ? data.currentLife.value : this.currentLife,
      currentMana:
          data.currentMana.present ? data.currentMana.value : this.currentMana,
      inLeftHand:
          data.inLeftHand.present ? data.inLeftHand.value : this.inLeftHand,
      inRightHand:
          data.inRightHand.present ? data.inRightHand.value : this.inRightHand,
      inTwoHands:
          data.inTwoHands.present ? data.inTwoHands.value : this.inTwoHands,
      inWearableSlots: data.inWearableSlots.present
          ? data.inWearableSlots.value
          : this.inWearableSlots,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBoardTableData(')
          ..write('uuid: $uuid, ')
          ..write('parentuuid: $parentuuid, ')
          ..write('boarduuid: $boarduuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('senses: $senses, ')
          ..write('divinityId: $divinityId, ')
          ..write('initiative: $initiative, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('combateRoleIndex: $combateRoleIndex, ')
          ..write('treasureTypeIndex: $treasureTypeIndex, ')
          ..write('grimoireUuid: $grimoireUuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isAlive: $isAlive, ')
          ..write('aligmentIndex: $aligmentIndex, ')
          ..write('currentLife: $currentLife, ')
          ..write('currentMana: $currentMana, ')
          ..write('inLeftHand: $inLeftHand, ')
          ..write('inRightHand: $inRightHand, ')
          ..write('inTwoHands: $inTwoHands, ')
          ..write('inWearableSlots: $inWearableSlots')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        uuid,
        parentuuid,
        boarduuid,
        name,
        imagePath,
        imageAsset,
        displacement,
        senses,
        divinityId,
        initiative,
        perception,
        defense,
        life,
        mana,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        typeIndex,
        creatureSizeIndex,
        broodIndex,
        combateRoleIndex,
        treasureTypeIndex,
        grimoireUuid,
        createdAt,
        updatedAt,
        isAlive,
        aligmentIndex,
        currentLife,
        currentMana,
        inLeftHand,
        inRightHand,
        inTwoHands,
        inWearableSlots
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterBoardTableData &&
          other.uuid == this.uuid &&
          other.parentuuid == this.parentuuid &&
          other.boarduuid == this.boarduuid &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.imageAsset == this.imageAsset &&
          other.displacement == this.displacement &&
          other.senses == this.senses &&
          other.divinityId == this.divinityId &&
          other.initiative == this.initiative &&
          other.perception == this.perception &&
          other.defense == this.defense &&
          other.life == this.life &&
          other.mana == this.mana &&
          other.strength == this.strength &&
          other.dexterity == this.dexterity &&
          other.constitution == this.constitution &&
          other.intelligence == this.intelligence &&
          other.wisdom == this.wisdom &&
          other.charisma == this.charisma &&
          other.typeIndex == this.typeIndex &&
          other.creatureSizeIndex == this.creatureSizeIndex &&
          other.broodIndex == this.broodIndex &&
          other.combateRoleIndex == this.combateRoleIndex &&
          other.treasureTypeIndex == this.treasureTypeIndex &&
          other.grimoireUuid == this.grimoireUuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isAlive == this.isAlive &&
          other.aligmentIndex == this.aligmentIndex &&
          other.currentLife == this.currentLife &&
          other.currentMana == this.currentMana &&
          other.inLeftHand == this.inLeftHand &&
          other.inRightHand == this.inRightHand &&
          other.inTwoHands == this.inTwoHands &&
          other.inWearableSlots == this.inWearableSlots);
}

class CharacterBoardTableCompanion
    extends UpdateCompanion<CharacterBoardTableData> {
  final Value<String> uuid;
  final Value<String> parentuuid;
  final Value<String> boarduuid;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<String?> imageAsset;
  final Value<String?> displacement;
  final Value<String?> senses;
  final Value<int?> divinityId;
  final Value<int> initiative;
  final Value<int> perception;
  final Value<int> defense;
  final Value<int> life;
  final Value<int> mana;
  final Value<int> strength;
  final Value<int> dexterity;
  final Value<int> constitution;
  final Value<int> intelligence;
  final Value<int> wisdom;
  final Value<int> charisma;
  final Value<int> typeIndex;
  final Value<int> creatureSizeIndex;
  final Value<int> broodIndex;
  final Value<int> combateRoleIndex;
  final Value<int?> treasureTypeIndex;
  final Value<String?> grimoireUuid;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<bool> isAlive;
  final Value<int> aligmentIndex;
  final Value<int> currentLife;
  final Value<int> currentMana;
  final Value<String?> inLeftHand;
  final Value<String?> inRightHand;
  final Value<String?> inTwoHands;
  final Value<String?> inWearableSlots;
  final Value<int> rowid;
  const CharacterBoardTableCompanion({
    this.uuid = const Value.absent(),
    this.parentuuid = const Value.absent(),
    this.boarduuid = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.senses = const Value.absent(),
    this.divinityId = const Value.absent(),
    this.initiative = const Value.absent(),
    this.perception = const Value.absent(),
    this.defense = const Value.absent(),
    this.life = const Value.absent(),
    this.mana = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.creatureSizeIndex = const Value.absent(),
    this.broodIndex = const Value.absent(),
    this.combateRoleIndex = const Value.absent(),
    this.treasureTypeIndex = const Value.absent(),
    this.grimoireUuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isAlive = const Value.absent(),
    this.aligmentIndex = const Value.absent(),
    this.currentLife = const Value.absent(),
    this.currentMana = const Value.absent(),
    this.inLeftHand = const Value.absent(),
    this.inRightHand = const Value.absent(),
    this.inTwoHands = const Value.absent(),
    this.inWearableSlots = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterBoardTableCompanion.insert({
    required String uuid,
    required String parentuuid,
    required String boarduuid,
    required String name,
    this.imagePath = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.displacement = const Value.absent(),
    this.senses = const Value.absent(),
    this.divinityId = const Value.absent(),
    required int initiative,
    required int perception,
    required int defense,
    required int life,
    required int mana,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
    required int typeIndex,
    required int creatureSizeIndex,
    required int broodIndex,
    required int combateRoleIndex,
    this.treasureTypeIndex = const Value.absent(),
    this.grimoireUuid = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    required bool isAlive,
    required int aligmentIndex,
    required int currentLife,
    required int currentMana,
    this.inLeftHand = const Value.absent(),
    this.inRightHand = const Value.absent(),
    this.inTwoHands = const Value.absent(),
    this.inWearableSlots = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        parentuuid = Value(parentuuid),
        boarduuid = Value(boarduuid),
        name = Value(name),
        initiative = Value(initiative),
        perception = Value(perception),
        defense = Value(defense),
        life = Value(life),
        mana = Value(mana),
        strength = Value(strength),
        dexterity = Value(dexterity),
        constitution = Value(constitution),
        intelligence = Value(intelligence),
        wisdom = Value(wisdom),
        charisma = Value(charisma),
        typeIndex = Value(typeIndex),
        creatureSizeIndex = Value(creatureSizeIndex),
        broodIndex = Value(broodIndex),
        combateRoleIndex = Value(combateRoleIndex),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        isAlive = Value(isAlive),
        aligmentIndex = Value(aligmentIndex),
        currentLife = Value(currentLife),
        currentMana = Value(currentMana);
  static Insertable<CharacterBoardTableData> custom({
    Expression<String>? uuid,
    Expression<String>? parentuuid,
    Expression<String>? boarduuid,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? imageAsset,
    Expression<String>? displacement,
    Expression<String>? senses,
    Expression<int>? divinityId,
    Expression<int>? initiative,
    Expression<int>? perception,
    Expression<int>? defense,
    Expression<int>? life,
    Expression<int>? mana,
    Expression<int>? strength,
    Expression<int>? dexterity,
    Expression<int>? constitution,
    Expression<int>? intelligence,
    Expression<int>? wisdom,
    Expression<int>? charisma,
    Expression<int>? typeIndex,
    Expression<int>? creatureSizeIndex,
    Expression<int>? broodIndex,
    Expression<int>? combateRoleIndex,
    Expression<int>? treasureTypeIndex,
    Expression<String>? grimoireUuid,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<bool>? isAlive,
    Expression<int>? aligmentIndex,
    Expression<int>? currentLife,
    Expression<int>? currentMana,
    Expression<String>? inLeftHand,
    Expression<String>? inRightHand,
    Expression<String>? inTwoHands,
    Expression<String>? inWearableSlots,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (parentuuid != null) 'parentuuid': parentuuid,
      if (boarduuid != null) 'boarduuid': boarduuid,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (displacement != null) 'displacement': displacement,
      if (senses != null) 'senses': senses,
      if (divinityId != null) 'divinity_id': divinityId,
      if (initiative != null) 'initiative': initiative,
      if (perception != null) 'perception': perception,
      if (defense != null) 'defense': defense,
      if (life != null) 'life': life,
      if (mana != null) 'mana': mana,
      if (strength != null) 'strength': strength,
      if (dexterity != null) 'dexterity': dexterity,
      if (constitution != null) 'constitution': constitution,
      if (intelligence != null) 'intelligence': intelligence,
      if (wisdom != null) 'wisdom': wisdom,
      if (charisma != null) 'charisma': charisma,
      if (typeIndex != null) 'type_index': typeIndex,
      if (creatureSizeIndex != null) 'creature_size_index': creatureSizeIndex,
      if (broodIndex != null) 'brood_index': broodIndex,
      if (combateRoleIndex != null) 'combate_role_index': combateRoleIndex,
      if (treasureTypeIndex != null) 'treasure_type_index': treasureTypeIndex,
      if (grimoireUuid != null) 'grimoire_uuid': grimoireUuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isAlive != null) 'is_alive': isAlive,
      if (aligmentIndex != null) 'aligment_index': aligmentIndex,
      if (currentLife != null) 'current_life': currentLife,
      if (currentMana != null) 'current_mana': currentMana,
      if (inLeftHand != null) 'in_left_hand': inLeftHand,
      if (inRightHand != null) 'in_right_hand': inRightHand,
      if (inTwoHands != null) 'in_two_hands': inTwoHands,
      if (inWearableSlots != null) 'in_wearable_slots': inWearableSlots,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterBoardTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? parentuuid,
      Value<String>? boarduuid,
      Value<String>? name,
      Value<String?>? imagePath,
      Value<String?>? imageAsset,
      Value<String?>? displacement,
      Value<String?>? senses,
      Value<int?>? divinityId,
      Value<int>? initiative,
      Value<int>? perception,
      Value<int>? defense,
      Value<int>? life,
      Value<int>? mana,
      Value<int>? strength,
      Value<int>? dexterity,
      Value<int>? constitution,
      Value<int>? intelligence,
      Value<int>? wisdom,
      Value<int>? charisma,
      Value<int>? typeIndex,
      Value<int>? creatureSizeIndex,
      Value<int>? broodIndex,
      Value<int>? combateRoleIndex,
      Value<int?>? treasureTypeIndex,
      Value<String?>? grimoireUuid,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<bool>? isAlive,
      Value<int>? aligmentIndex,
      Value<int>? currentLife,
      Value<int>? currentMana,
      Value<String?>? inLeftHand,
      Value<String?>? inRightHand,
      Value<String?>? inTwoHands,
      Value<String?>? inWearableSlots,
      Value<int>? rowid}) {
    return CharacterBoardTableCompanion(
      uuid: uuid ?? this.uuid,
      parentuuid: parentuuid ?? this.parentuuid,
      boarduuid: boarduuid ?? this.boarduuid,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      imageAsset: imageAsset ?? this.imageAsset,
      displacement: displacement ?? this.displacement,
      senses: senses ?? this.senses,
      divinityId: divinityId ?? this.divinityId,
      initiative: initiative ?? this.initiative,
      perception: perception ?? this.perception,
      defense: defense ?? this.defense,
      life: life ?? this.life,
      mana: mana ?? this.mana,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      typeIndex: typeIndex ?? this.typeIndex,
      creatureSizeIndex: creatureSizeIndex ?? this.creatureSizeIndex,
      broodIndex: broodIndex ?? this.broodIndex,
      combateRoleIndex: combateRoleIndex ?? this.combateRoleIndex,
      treasureTypeIndex: treasureTypeIndex ?? this.treasureTypeIndex,
      grimoireUuid: grimoireUuid ?? this.grimoireUuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isAlive: isAlive ?? this.isAlive,
      aligmentIndex: aligmentIndex ?? this.aligmentIndex,
      currentLife: currentLife ?? this.currentLife,
      currentMana: currentMana ?? this.currentMana,
      inLeftHand: inLeftHand ?? this.inLeftHand,
      inRightHand: inRightHand ?? this.inRightHand,
      inTwoHands: inTwoHands ?? this.inTwoHands,
      inWearableSlots: inWearableSlots ?? this.inWearableSlots,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (parentuuid.present) {
      map['parentuuid'] = Variable<String>(parentuuid.value);
    }
    if (boarduuid.present) {
      map['boarduuid'] = Variable<String>(boarduuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (displacement.present) {
      map['displacement'] = Variable<String>(displacement.value);
    }
    if (senses.present) {
      map['senses'] = Variable<String>(senses.value);
    }
    if (divinityId.present) {
      map['divinity_id'] = Variable<int>(divinityId.value);
    }
    if (initiative.present) {
      map['initiative'] = Variable<int>(initiative.value);
    }
    if (perception.present) {
      map['perception'] = Variable<int>(perception.value);
    }
    if (defense.present) {
      map['defense'] = Variable<int>(defense.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (mana.present) {
      map['mana'] = Variable<int>(mana.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (creatureSizeIndex.present) {
      map['creature_size_index'] = Variable<int>(creatureSizeIndex.value);
    }
    if (broodIndex.present) {
      map['brood_index'] = Variable<int>(broodIndex.value);
    }
    if (combateRoleIndex.present) {
      map['combate_role_index'] = Variable<int>(combateRoleIndex.value);
    }
    if (treasureTypeIndex.present) {
      map['treasure_type_index'] = Variable<int>(treasureTypeIndex.value);
    }
    if (grimoireUuid.present) {
      map['grimoire_uuid'] = Variable<String>(grimoireUuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (isAlive.present) {
      map['is_alive'] = Variable<bool>(isAlive.value);
    }
    if (aligmentIndex.present) {
      map['aligment_index'] = Variable<int>(aligmentIndex.value);
    }
    if (currentLife.present) {
      map['current_life'] = Variable<int>(currentLife.value);
    }
    if (currentMana.present) {
      map['current_mana'] = Variable<int>(currentMana.value);
    }
    if (inLeftHand.present) {
      map['in_left_hand'] = Variable<String>(inLeftHand.value);
    }
    if (inRightHand.present) {
      map['in_right_hand'] = Variable<String>(inRightHand.value);
    }
    if (inTwoHands.present) {
      map['in_two_hands'] = Variable<String>(inTwoHands.value);
    }
    if (inWearableSlots.present) {
      map['in_wearable_slots'] = Variable<String>(inWearableSlots.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterBoardTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('parentuuid: $parentuuid, ')
          ..write('boarduuid: $boarduuid, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('displacement: $displacement, ')
          ..write('senses: $senses, ')
          ..write('divinityId: $divinityId, ')
          ..write('initiative: $initiative, ')
          ..write('perception: $perception, ')
          ..write('defense: $defense, ')
          ..write('life: $life, ')
          ..write('mana: $mana, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('creatureSizeIndex: $creatureSizeIndex, ')
          ..write('broodIndex: $broodIndex, ')
          ..write('combateRoleIndex: $combateRoleIndex, ')
          ..write('treasureTypeIndex: $treasureTypeIndex, ')
          ..write('grimoireUuid: $grimoireUuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isAlive: $isAlive, ')
          ..write('aligmentIndex: $aligmentIndex, ')
          ..write('currentLife: $currentLife, ')
          ..write('currentMana: $currentMana, ')
          ..write('inLeftHand: $inLeftHand, ')
          ..write('inRightHand: $inRightHand, ')
          ..write('inTwoHands: $inTwoHands, ')
          ..write('inWearableSlots: $inWearableSlots, ')
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
  late final $BoardNoteTableTable boardNoteTable = $BoardNoteTableTable(this);
  late final $BoardCombatTableTable boardCombatTable =
      $BoardCombatTableTable(this);
  late final $MenaceTableTable menaceTable = $MenaceTableTable(this);
  late final $AdventureBackpackTableTable adventureBackpackTable =
      $AdventureBackpackTableTable(this);
  late final $EquipmentTableTable equipmentTable = $EquipmentTableTable(this);
  late final $AmmunitionTableTable ammunitionTable =
      $AmmunitionTableTable(this);
  late final $ArmorTableTable armorTable = $ArmorTableTable(this);
  late final $BackpackTableTable backpackTable = $BackpackTableTable(this);
  late final $GeneralItemTableTable generalItemTable =
      $GeneralItemTableTable(this);
  late final $GeneralSkillTableTable generalSkillTable =
      $GeneralSkillTableTable(this);
  late final $MagicMenaceTableTable magicMenaceTable =
      $MagicMenaceTableTable(this);
  late final $SaddlebagTableTable saddlebagTable = $SaddlebagTableTable(this);
  late final $ShieldTableTable shieldTable = $ShieldTableTable(this);
  late final $TibarsTableTable tibarsTable = $TibarsTableTable(this);
  late final $WeaponTableTable weaponTable = $WeaponTableTable(this);
  late final $ActionTableTable actionTable = $ActionTableTable(this);
  late final $ActionHandToHandTableTable actionHandToHandTable =
      $ActionHandToHandTableTable(this);
  late final $ActionDistanceAttackTableTable actionDistanceAttackTable =
      $ActionDistanceAttackTableTable(this);
  late final $ExpertiseTableTable expertiseTable = $ExpertiseTableTable(this);
  late final $MenaceLinkBoardTableTable menaceLinkBoardTable =
      $MenaceLinkBoardTableTable(this);
  late final $ConfigTableTable configTable = $ConfigTableTable(this);
  late final $CharacterTableTable characterTable = $CharacterTableTable(this);
  late final $ClasseCharacterTableTable classeCharacterTable =
      $ClasseCharacterTableTable(this);
  late final $OriginTableTable originTable = $OriginTableTable(this);
  late final $PowerTableTable powerTable = $PowerTableTable(this);
  late final $CharacterBoardTableTable characterBoardTable =
      $CharacterBoardTableTable(this);
  late final GrimoireDAO grimoireDAO = GrimoireDAO(this as AppDatabase);
  late final BoardDAO boardDAO = BoardDAO(this as AppDatabase);
  late final MagicCharacterDAO magicCharacterDAO =
      MagicCharacterDAO(this as AppDatabase);
  late final MenaceDAO menaceDAO = MenaceDAO(this as AppDatabase);
  late final ConfigDAO configDAO = ConfigDAO(this as AppDatabase);
  late final CharacterDAO characterDAO = CharacterDAO(this as AppDatabase);
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
        boardNoteTable,
        boardCombatTable,
        menaceTable,
        adventureBackpackTable,
        equipmentTable,
        ammunitionTable,
        armorTable,
        backpackTable,
        generalItemTable,
        generalSkillTable,
        magicMenaceTable,
        saddlebagTable,
        shieldTable,
        tibarsTable,
        weaponTable,
        actionTable,
        actionHandToHandTable,
        actionDistanceAttackTable,
        expertiseTable,
        menaceLinkBoardTable,
        configTable,
        characterTable,
        classeCharacterTable,
        originTable,
        powerTable,
        characterBoardTable
      ];
}

typedef $$GrimoireTableTableCreateCompanionBuilder = GrimoireTableCompanion
    Function({
  required String uuid,
  required String name,
  Value<String?> desc,
  required String iconAsset,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$GrimoireTableTableUpdateCompanionBuilder = GrimoireTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String?> desc,
  Value<String> iconAsset,
  Value<int> createdAt,
  Value<int> updatedAt,
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
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
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
            required int createdAt,
            required int updatedAt,
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

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
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

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
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
  Value<int?> pm,
  Value<int?> cd,
  Value<int?> mediumDamageValue,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
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
  Value<int?> pm,
  Value<int?> cd,
  Value<int?> mediumDamageValue,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
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
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
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
            pm: pm,
            cd: cd,
            mediumDamageValue: mediumDamageValue,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
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
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
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
            pm: pm,
            cd: cd,
            mediumDamageValue: mediumDamageValue,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
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

  ColumnFilters<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
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

  ColumnOrderings<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
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
  required int createdAt,
  required int updatedAt,
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
  Value<int> createdAt,
  Value<int> updatedAt,
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
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
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
            required int createdAt,
            required int updatedAt,
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

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
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

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
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
  required int createdAt,
  required int updatedAt,
  required int life,
  required int mana,
  required int defense,
  required int initiative,
  required bool isAlive,
  required String classeIndexes,
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
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> life,
  Value<int> mana,
  Value<int> defense,
  Value<int> initiative,
  Value<bool> isAlive,
  Value<String> classeIndexes,
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
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> life = const Value.absent(),
            Value<int> mana = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> initiative = const Value.absent(),
            Value<bool> isAlive = const Value.absent(),
            Value<String> classeIndexes = const Value.absent(),
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
            classeIndexes: classeIndexes,
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
            required int createdAt,
            required int updatedAt,
            required int life,
            required int mana,
            required int defense,
            required int initiative,
            required bool isAlive,
            required String classeIndexes,
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
            classeIndexes: classeIndexes,
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

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
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

  ColumnFilters<String> get classeIndexes => $state.composableBuilder(
      column: $state.table.classeIndexes,
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

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
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

  ColumnOrderings<String> get classeIndexes => $state.composableBuilder(
      column: $state.table.classeIndexes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BoardNoteTableTableCreateCompanionBuilder = BoardNoteTableCompanion
    Function({
  required String uuid,
  required String boardUuid,
  required String note,
  required bool isFavorited,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$BoardNoteTableTableUpdateCompanionBuilder = BoardNoteTableCompanion
    Function({
  Value<String> uuid,
  Value<String> boardUuid,
  Value<String> note,
  Value<bool> isFavorited,
  Value<int> createdAt,
  Value<int> updatedAt,
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
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
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
            required int createdAt,
            required int updatedAt,
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

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
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

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
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

typedef $$MenaceTableTableCreateCompanionBuilder = MenaceTableCompanion
    Function({
  required String uuid,
  required String name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> casterInfos,
  Value<String?> desc,
  Value<String?> extraInfos,
  Value<String?> senses,
  required String nd,
  Value<int?> divinityId,
  required int initiative,
  required int perception,
  required int defense,
  required int life,
  required int mana,
  required int fortResistence,
  required int refResistence,
  required int vonResistence,
  required int strength,
  required int dexterity,
  required int constitution,
  required int intelligence,
  required int wisdom,
  required int charisma,
  required int typeIndex,
  required int creatureSizeIndex,
  required int combateRoleIndex,
  Value<int?> treasureTypeIndex,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$MenaceTableTableUpdateCompanionBuilder = MenaceTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> casterInfos,
  Value<String?> desc,
  Value<String?> extraInfos,
  Value<String?> senses,
  Value<String> nd,
  Value<int?> divinityId,
  Value<int> initiative,
  Value<int> perception,
  Value<int> defense,
  Value<int> life,
  Value<int> mana,
  Value<int> fortResistence,
  Value<int> refResistence,
  Value<int> vonResistence,
  Value<int> strength,
  Value<int> dexterity,
  Value<int> constitution,
  Value<int> intelligence,
  Value<int> wisdom,
  Value<int> charisma,
  Value<int> typeIndex,
  Value<int> creatureSizeIndex,
  Value<int> combateRoleIndex,
  Value<int?> treasureTypeIndex,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

class $$MenaceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MenaceTableTable,
    MenaceTableData,
    $$MenaceTableTableFilterComposer,
    $$MenaceTableTableOrderingComposer,
    $$MenaceTableTableCreateCompanionBuilder,
    $$MenaceTableTableUpdateCompanionBuilder> {
  $$MenaceTableTableTableManager(_$AppDatabase db, $MenaceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MenaceTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MenaceTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> casterInfos = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<String?> extraInfos = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            Value<String> nd = const Value.absent(),
            Value<int?> divinityId = const Value.absent(),
            Value<int> initiative = const Value.absent(),
            Value<int> perception = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> life = const Value.absent(),
            Value<int> mana = const Value.absent(),
            Value<int> fortResistence = const Value.absent(),
            Value<int> refResistence = const Value.absent(),
            Value<int> vonResistence = const Value.absent(),
            Value<int> strength = const Value.absent(),
            Value<int> dexterity = const Value.absent(),
            Value<int> constitution = const Value.absent(),
            Value<int> intelligence = const Value.absent(),
            Value<int> wisdom = const Value.absent(),
            Value<int> charisma = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> creatureSizeIndex = const Value.absent(),
            Value<int> combateRoleIndex = const Value.absent(),
            Value<int?> treasureTypeIndex = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MenaceTableCompanion(
            uuid: uuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            casterInfos: casterInfos,
            desc: desc,
            extraInfos: extraInfos,
            senses: senses,
            nd: nd,
            divinityId: divinityId,
            initiative: initiative,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            fortResistence: fortResistence,
            refResistence: refResistence,
            vonResistence: vonResistence,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            typeIndex: typeIndex,
            creatureSizeIndex: creatureSizeIndex,
            combateRoleIndex: combateRoleIndex,
            treasureTypeIndex: treasureTypeIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> casterInfos = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<String?> extraInfos = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            required String nd,
            Value<int?> divinityId = const Value.absent(),
            required int initiative,
            required int perception,
            required int defense,
            required int life,
            required int mana,
            required int fortResistence,
            required int refResistence,
            required int vonResistence,
            required int strength,
            required int dexterity,
            required int constitution,
            required int intelligence,
            required int wisdom,
            required int charisma,
            required int typeIndex,
            required int creatureSizeIndex,
            required int combateRoleIndex,
            Value<int?> treasureTypeIndex = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MenaceTableCompanion.insert(
            uuid: uuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            casterInfos: casterInfos,
            desc: desc,
            extraInfos: extraInfos,
            senses: senses,
            nd: nd,
            divinityId: divinityId,
            initiative: initiative,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            fortResistence: fortResistence,
            refResistence: refResistence,
            vonResistence: vonResistence,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            typeIndex: typeIndex,
            creatureSizeIndex: creatureSizeIndex,
            combateRoleIndex: combateRoleIndex,
            treasureTypeIndex: treasureTypeIndex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$MenaceTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MenaceTableTable> {
  $$MenaceTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnFilters<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get casterInfos => $state.composableBuilder(
      column: $state.table.casterInfos,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraInfos => $state.composableBuilder(
      column: $state.table.extraInfos,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nd => $state.composableBuilder(
      column: $state.table.nd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnFilters<int> get fortResistence => $state.composableBuilder(
      column: $state.table.fortResistence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get refResistence => $state.composableBuilder(
      column: $state.table.refResistence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vonResistence => $state.composableBuilder(
      column: $state.table.vonResistence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get combateRoleIndex => $state.composableBuilder(
      column: $state.table.combateRoleIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get treasureTypeIndex => $state.composableBuilder(
      column: $state.table.treasureTypeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MenaceTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MenaceTableTable> {
  $$MenaceTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnOrderings<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get casterInfos => $state.composableBuilder(
      column: $state.table.casterInfos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraInfos => $state.composableBuilder(
      column: $state.table.extraInfos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nd => $state.composableBuilder(
      column: $state.table.nd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnOrderings<int> get fortResistence => $state.composableBuilder(
      column: $state.table.fortResistence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get refResistence => $state.composableBuilder(
      column: $state.table.refResistence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vonResistence => $state.composableBuilder(
      column: $state.table.vonResistence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get combateRoleIndex => $state.composableBuilder(
      column: $state.table.combateRoleIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get treasureTypeIndex => $state.composableBuilder(
      column: $state.table.treasureTypeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AdventureBackpackTableTableCreateCompanionBuilder
    = AdventureBackpackTableCompanion Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> suffix,
  Value<double?> price,
  Value<int> rowid,
});
typedef $$AdventureBackpackTableTableUpdateCompanionBuilder
    = AdventureBackpackTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> suffix,
  Value<double?> price,
  Value<int> rowid,
});

class $$AdventureBackpackTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AdventureBackpackTableTable,
    AdventureBackpackTableData,
    $$AdventureBackpackTableTableFilterComposer,
    $$AdventureBackpackTableTableOrderingComposer,
    $$AdventureBackpackTableTableCreateCompanionBuilder,
    $$AdventureBackpackTableTableUpdateCompanionBuilder> {
  $$AdventureBackpackTableTableTableManager(
      _$AppDatabase db, $AdventureBackpackTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AdventureBackpackTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AdventureBackpackTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> suffix = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AdventureBackpackTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            suffix: suffix,
            price: price,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> suffix = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AdventureBackpackTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            suffix: suffix,
            price: price,
            rowid: rowid,
          ),
        ));
}

class $$AdventureBackpackTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AdventureBackpackTableTable> {
  $$AdventureBackpackTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get suffix => $state.composableBuilder(
      column: $state.table.suffix,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AdventureBackpackTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AdventureBackpackTableTable> {
  $$AdventureBackpackTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get suffix => $state.composableBuilder(
      column: $state.table.suffix,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EquipmentTableTableCreateCompanionBuilder = EquipmentTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<int> rowid,
});
typedef $$EquipmentTableTableUpdateCompanionBuilder = EquipmentTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<int> rowid,
});

class $$EquipmentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EquipmentTableTable,
    EquipmentTableData,
    $$EquipmentTableTableFilterComposer,
    $$EquipmentTableTableOrderingComposer,
    $$EquipmentTableTableCreateCompanionBuilder,
    $$EquipmentTableTableUpdateCompanionBuilder> {
  $$EquipmentTableTableTableManager(
      _$AppDatabase db, $EquipmentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EquipmentTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EquipmentTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EquipmentTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EquipmentTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            rowid: rowid,
          ),
        ));
}

class $$EquipmentTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EquipmentTableTable> {
  $$EquipmentTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EquipmentTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EquipmentTableTable> {
  $$EquipmentTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AmmunitionTableTableCreateCompanionBuilder = AmmunitionTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  required int quantity,
  Value<String?> storedIn,
  Value<double?> price,
  Value<String?> desc,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<int> rowid,
});
typedef $$AmmunitionTableTableUpdateCompanionBuilder = AmmunitionTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<int> quantity,
  Value<String?> storedIn,
  Value<double?> price,
  Value<String?> desc,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<int> rowid,
});

class $$AmmunitionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AmmunitionTableTable,
    AmmunitionTableData,
    $$AmmunitionTableTableFilterComposer,
    $$AmmunitionTableTableOrderingComposer,
    $$AmmunitionTableTableCreateCompanionBuilder,
    $$AmmunitionTableTableUpdateCompanionBuilder> {
  $$AmmunitionTableTableTableManager(
      _$AppDatabase db, $AmmunitionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AmmunitionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AmmunitionTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AmmunitionTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            quantity: quantity,
            storedIn: storedIn,
            price: price,
            desc: desc,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            required int quantity,
            Value<String?> storedIn = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AmmunitionTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            quantity: quantity,
            storedIn: storedIn,
            price: price,
            desc: desc,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            rowid: rowid,
          ),
        ));
}

class $$AmmunitionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AmmunitionTableTable> {
  $$AmmunitionTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AmmunitionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AmmunitionTableTable> {
  $$AmmunitionTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ArmorTableTableCreateCompanionBuilder = ArmorTableCompanion Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  required double ocupedSpace,
  required int typeIndex,
  required int defenseBonus,
  required int penalty,
  Value<bool> inUse,
  Value<int> rowid,
});
typedef $$ArmorTableTableUpdateCompanionBuilder = ArmorTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  Value<double> ocupedSpace,
  Value<int> typeIndex,
  Value<int> defenseBonus,
  Value<int> penalty,
  Value<bool> inUse,
  Value<int> rowid,
});

class $$ArmorTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArmorTableTable,
    ArmorTableData,
    $$ArmorTableTableFilterComposer,
    $$ArmorTableTableOrderingComposer,
    $$ArmorTableTableCreateCompanionBuilder,
    $$ArmorTableTableUpdateCompanionBuilder> {
  $$ArmorTableTableTableManager(_$AppDatabase db, $ArmorTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ArmorTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ArmorTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<double> ocupedSpace = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> defenseBonus = const Value.absent(),
            Value<int> penalty = const Value.absent(),
            Value<bool> inUse = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArmorTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            defenseBonus: defenseBonus,
            penalty: penalty,
            inUse: inUse,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required double ocupedSpace,
            required int typeIndex,
            required int defenseBonus,
            required int penalty,
            Value<bool> inUse = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArmorTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            defenseBonus: defenseBonus,
            penalty: penalty,
            inUse: inUse,
            rowid: rowid,
          ),
        ));
}

class $$ArmorTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ArmorTableTable> {
  $$ArmorTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defenseBonus => $state.composableBuilder(
      column: $state.table.defenseBonus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get penalty => $state.composableBuilder(
      column: $state.table.penalty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get inUse => $state.composableBuilder(
      column: $state.table.inUse,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ArmorTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ArmorTableTable> {
  $$ArmorTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defenseBonus => $state.composableBuilder(
      column: $state.table.defenseBonus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get penalty => $state.composableBuilder(
      column: $state.table.penalty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get inUse => $state.composableBuilder(
      column: $state.table.inUse,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BackpackTableTableCreateCompanionBuilder = BackpackTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> suffix,
  Value<double?> price,
  Value<int> rowid,
});
typedef $$BackpackTableTableUpdateCompanionBuilder = BackpackTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> suffix,
  Value<double?> price,
  Value<int> rowid,
});

class $$BackpackTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BackpackTableTable,
    BackpackTableData,
    $$BackpackTableTableFilterComposer,
    $$BackpackTableTableOrderingComposer,
    $$BackpackTableTableCreateCompanionBuilder,
    $$BackpackTableTableUpdateCompanionBuilder> {
  $$BackpackTableTableTableManager(_$AppDatabase db, $BackpackTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BackpackTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BackpackTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> suffix = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BackpackTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            suffix: suffix,
            price: price,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> suffix = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BackpackTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            suffix: suffix,
            price: price,
            rowid: rowid,
          ),
        ));
}

class $$BackpackTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BackpackTableTable> {
  $$BackpackTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get suffix => $state.composableBuilder(
      column: $state.table.suffix,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BackpackTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BackpackTableTable> {
  $$BackpackTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get suffix => $state.composableBuilder(
      column: $state.table.suffix,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GeneralItemTableTableCreateCompanionBuilder
    = GeneralItemTableCompanion Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  required double ocupedSpace,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$GeneralItemTableTableUpdateCompanionBuilder
    = GeneralItemTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  Value<double> ocupedSpace,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$GeneralItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GeneralItemTableTable,
    GeneralItemTableData,
    $$GeneralItemTableTableFilterComposer,
    $$GeneralItemTableTableOrderingComposer,
    $$GeneralItemTableTableCreateCompanionBuilder,
    $$GeneralItemTableTableUpdateCompanionBuilder> {
  $$GeneralItemTableTableTableManager(
      _$AppDatabase db, $GeneralItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GeneralItemTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GeneralItemTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<double> ocupedSpace = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneralItemTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required double ocupedSpace,
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneralItemTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$GeneralItemTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GeneralItemTableTable> {
  $$GeneralItemTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$GeneralItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GeneralItemTableTable> {
  $$GeneralItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GeneralSkillTableTableCreateCompanionBuilder
    = GeneralSkillTableCompanion Function({
  required String uuid,
  required String name,
  required String desc,
  required String parentUuid,
  Value<int> rowid,
});
typedef $$GeneralSkillTableTableUpdateCompanionBuilder
    = GeneralSkillTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> desc,
  Value<String> parentUuid,
  Value<int> rowid,
});

class $$GeneralSkillTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GeneralSkillTableTable,
    GeneralSkillTableData,
    $$GeneralSkillTableTableFilterComposer,
    $$GeneralSkillTableTableOrderingComposer,
    $$GeneralSkillTableTableCreateCompanionBuilder,
    $$GeneralSkillTableTableUpdateCompanionBuilder> {
  $$GeneralSkillTableTableTableManager(
      _$AppDatabase db, $GeneralSkillTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GeneralSkillTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$GeneralSkillTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneralSkillTableCompanion(
            uuid: uuid,
            name: name,
            desc: desc,
            parentUuid: parentUuid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String desc,
            required String parentUuid,
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneralSkillTableCompanion.insert(
            uuid: uuid,
            name: name,
            desc: desc,
            parentUuid: parentUuid,
            rowid: rowid,
          ),
        ));
}

class $$GeneralSkillTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GeneralSkillTableTable> {
  $$GeneralSkillTableTableFilterComposer(super.$state);
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

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$GeneralSkillTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GeneralSkillTableTable> {
  $$GeneralSkillTableTableOrderingComposer(super.$state);
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

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MagicMenaceTableTableCreateCompanionBuilder
    = MagicMenaceTableCompanion Function({
  required String uuid,
  required String name,
  required String resumedDesc,
  required String menaceUuid,
  required int magicBaseId,
  Value<int?> pm,
  Value<int?> cd,
  Value<int?> mediumDamageValue,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int> rowid,
});
typedef $$MagicMenaceTableTableUpdateCompanionBuilder
    = MagicMenaceTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> resumedDesc,
  Value<String> menaceUuid,
  Value<int> magicBaseId,
  Value<int?> pm,
  Value<int?> cd,
  Value<int?> mediumDamageValue,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int> rowid,
});

class $$MagicMenaceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MagicMenaceTableTable,
    MagicMenaceTableData,
    $$MagicMenaceTableTableFilterComposer,
    $$MagicMenaceTableTableOrderingComposer,
    $$MagicMenaceTableTableCreateCompanionBuilder,
    $$MagicMenaceTableTableUpdateCompanionBuilder> {
  $$MagicMenaceTableTableTableManager(
      _$AppDatabase db, $MagicMenaceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MagicMenaceTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MagicMenaceTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> resumedDesc = const Value.absent(),
            Value<String> menaceUuid = const Value.absent(),
            Value<int> magicBaseId = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MagicMenaceTableCompanion(
            uuid: uuid,
            name: name,
            resumedDesc: resumedDesc,
            menaceUuid: menaceUuid,
            magicBaseId: magicBaseId,
            pm: pm,
            cd: cd,
            mediumDamageValue: mediumDamageValue,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String resumedDesc,
            required String menaceUuid,
            required int magicBaseId,
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MagicMenaceTableCompanion.insert(
            uuid: uuid,
            name: name,
            resumedDesc: resumedDesc,
            menaceUuid: menaceUuid,
            magicBaseId: magicBaseId,
            pm: pm,
            cd: cd,
            mediumDamageValue: mediumDamageValue,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            rowid: rowid,
          ),
        ));
}

class $$MagicMenaceTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MagicMenaceTableTable> {
  $$MagicMenaceTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get resumedDesc => $state.composableBuilder(
      column: $state.table.resumedDesc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get menaceUuid => $state.composableBuilder(
      column: $state.table.menaceUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get magicBaseId => $state.composableBuilder(
      column: $state.table.magicBaseId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MagicMenaceTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MagicMenaceTableTable> {
  $$MagicMenaceTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get resumedDesc => $state.composableBuilder(
      column: $state.table.resumedDesc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get menaceUuid => $state.composableBuilder(
      column: $state.table.menaceUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get magicBaseId => $state.composableBuilder(
      column: $state.table.magicBaseId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SaddlebagTableTableCreateCompanionBuilder = SaddlebagTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<double?> price,
  Value<int> rowid,
});
typedef $$SaddlebagTableTableUpdateCompanionBuilder = SaddlebagTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<double?> price,
  Value<int> rowid,
});

class $$SaddlebagTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SaddlebagTableTable,
    SaddlebagTableData,
    $$SaddlebagTableTableFilterComposer,
    $$SaddlebagTableTableOrderingComposer,
    $$SaddlebagTableTableCreateCompanionBuilder,
    $$SaddlebagTableTableUpdateCompanionBuilder> {
  $$SaddlebagTableTableTableManager(
      _$AppDatabase db, $SaddlebagTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SaddlebagTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SaddlebagTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SaddlebagTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            price: price,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SaddlebagTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            price: price,
            rowid: rowid,
          ),
        ));
}

class $$SaddlebagTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SaddlebagTableTable> {
  $$SaddlebagTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SaddlebagTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SaddlebagTableTable> {
  $$SaddlebagTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ShieldTableTableCreateCompanionBuilder = ShieldTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  required double ocupedSpace,
  required int typeIndex,
  required int defenseBonus,
  required int penalty,
  Value<bool> inUse,
  Value<int> rowid,
});
typedef $$ShieldTableTableUpdateCompanionBuilder = ShieldTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  Value<double> ocupedSpace,
  Value<int> typeIndex,
  Value<int> defenseBonus,
  Value<int> penalty,
  Value<bool> inUse,
  Value<int> rowid,
});

class $$ShieldTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShieldTableTable,
    ShieldTableData,
    $$ShieldTableTableFilterComposer,
    $$ShieldTableTableOrderingComposer,
    $$ShieldTableTableCreateCompanionBuilder,
    $$ShieldTableTableUpdateCompanionBuilder> {
  $$ShieldTableTableTableManager(_$AppDatabase db, $ShieldTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ShieldTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ShieldTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<double> ocupedSpace = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> defenseBonus = const Value.absent(),
            Value<int> penalty = const Value.absent(),
            Value<bool> inUse = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShieldTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            defenseBonus: defenseBonus,
            penalty: penalty,
            inUse: inUse,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required double ocupedSpace,
            required int typeIndex,
            required int defenseBonus,
            required int penalty,
            Value<bool> inUse = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShieldTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            typeIndex: typeIndex,
            defenseBonus: defenseBonus,
            penalty: penalty,
            inUse: inUse,
            rowid: rowid,
          ),
        ));
}

class $$ShieldTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ShieldTableTable> {
  $$ShieldTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defenseBonus => $state.composableBuilder(
      column: $state.table.defenseBonus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get penalty => $state.composableBuilder(
      column: $state.table.penalty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get inUse => $state.composableBuilder(
      column: $state.table.inUse,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ShieldTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ShieldTableTable> {
  $$ShieldTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defenseBonus => $state.composableBuilder(
      column: $state.table.defenseBonus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get penalty => $state.composableBuilder(
      column: $state.table.penalty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get inUse => $state.composableBuilder(
      column: $state.table.inUse,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TibarsTableTableCreateCompanionBuilder = TibarsTableCompanion
    Function({
  required String uuid,
  required String parentUuid,
  Value<String?> storedIn,
  required int gold,
  required int silver,
  required int bronze,
  Value<int> rowid,
});
typedef $$TibarsTableTableUpdateCompanionBuilder = TibarsTableCompanion
    Function({
  Value<String> uuid,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<int> gold,
  Value<int> silver,
  Value<int> bronze,
  Value<int> rowid,
});

class $$TibarsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TibarsTableTable,
    TibarsTableData,
    $$TibarsTableTableFilterComposer,
    $$TibarsTableTableOrderingComposer,
    $$TibarsTableTableCreateCompanionBuilder,
    $$TibarsTableTableUpdateCompanionBuilder> {
  $$TibarsTableTableTableManager(_$AppDatabase db, $TibarsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TibarsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TibarsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<int> gold = const Value.absent(),
            Value<int> silver = const Value.absent(),
            Value<int> bronze = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TibarsTableCompanion(
            uuid: uuid,
            parentUuid: parentUuid,
            storedIn: storedIn,
            gold: gold,
            silver: silver,
            bronze: bronze,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            required int gold,
            required int silver,
            required int bronze,
            Value<int> rowid = const Value.absent(),
          }) =>
              TibarsTableCompanion.insert(
            uuid: uuid,
            parentUuid: parentUuid,
            storedIn: storedIn,
            gold: gold,
            silver: silver,
            bronze: bronze,
            rowid: rowid,
          ),
        ));
}

class $$TibarsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TibarsTableTable> {
  $$TibarsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gold => $state.composableBuilder(
      column: $state.table.gold,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get silver => $state.composableBuilder(
      column: $state.table.silver,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bronze => $state.composableBuilder(
      column: $state.table.bronze,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TibarsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TibarsTableTable> {
  $$TibarsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gold => $state.composableBuilder(
      column: $state.table.gold,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get silver => $state.composableBuilder(
      column: $state.table.silver,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bronze => $state.composableBuilder(
      column: $state.table.bronze,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WeaponTableTableCreateCompanionBuilder = WeaponTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  required double ocupedSpace,
  required int wieldableIndex,
  required int purposeIndex,
  required int proficiencyIndex,
  required int typeIndex,
  required int rangeIndex,
  required int critical,
  required int criticalMultiplier,
  Value<int?> steps,
  required String dices,
  Value<String?> skillIndexes,
  required bool isNatural,
  required bool isUnarmed,
  Value<int> rowid,
});
typedef $$WeaponTableTableUpdateCompanionBuilder = WeaponTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String?> storedIn,
  Value<String?> improvements,
  Value<int?> specialMaterialIndex,
  Value<double?> price,
  Value<String?> desc,
  Value<double> ocupedSpace,
  Value<int> wieldableIndex,
  Value<int> purposeIndex,
  Value<int> proficiencyIndex,
  Value<int> typeIndex,
  Value<int> rangeIndex,
  Value<int> critical,
  Value<int> criticalMultiplier,
  Value<int?> steps,
  Value<String> dices,
  Value<String?> skillIndexes,
  Value<bool> isNatural,
  Value<bool> isUnarmed,
  Value<int> rowid,
});

class $$WeaponTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeaponTableTable,
    WeaponTableData,
    $$WeaponTableTableFilterComposer,
    $$WeaponTableTableOrderingComposer,
    $$WeaponTableTableCreateCompanionBuilder,
    $$WeaponTableTableUpdateCompanionBuilder> {
  $$WeaponTableTableTableManager(_$AppDatabase db, $WeaponTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WeaponTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WeaponTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            Value<double> ocupedSpace = const Value.absent(),
            Value<int> wieldableIndex = const Value.absent(),
            Value<int> purposeIndex = const Value.absent(),
            Value<int> proficiencyIndex = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rangeIndex = const Value.absent(),
            Value<int> critical = const Value.absent(),
            Value<int> criticalMultiplier = const Value.absent(),
            Value<int?> steps = const Value.absent(),
            Value<String> dices = const Value.absent(),
            Value<String?> skillIndexes = const Value.absent(),
            Value<bool> isNatural = const Value.absent(),
            Value<bool> isUnarmed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WeaponTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            wieldableIndex: wieldableIndex,
            purposeIndex: purposeIndex,
            proficiencyIndex: proficiencyIndex,
            typeIndex: typeIndex,
            rangeIndex: rangeIndex,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            steps: steps,
            dices: dices,
            skillIndexes: skillIndexes,
            isNatural: isNatural,
            isUnarmed: isUnarmed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            Value<String?> storedIn = const Value.absent(),
            Value<String?> improvements = const Value.absent(),
            Value<int?> specialMaterialIndex = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<String?> desc = const Value.absent(),
            required double ocupedSpace,
            required int wieldableIndex,
            required int purposeIndex,
            required int proficiencyIndex,
            required int typeIndex,
            required int rangeIndex,
            required int critical,
            required int criticalMultiplier,
            Value<int?> steps = const Value.absent(),
            required String dices,
            Value<String?> skillIndexes = const Value.absent(),
            required bool isNatural,
            required bool isUnarmed,
            Value<int> rowid = const Value.absent(),
          }) =>
              WeaponTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            storedIn: storedIn,
            improvements: improvements,
            specialMaterialIndex: specialMaterialIndex,
            price: price,
            desc: desc,
            ocupedSpace: ocupedSpace,
            wieldableIndex: wieldableIndex,
            purposeIndex: purposeIndex,
            proficiencyIndex: proficiencyIndex,
            typeIndex: typeIndex,
            rangeIndex: rangeIndex,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            steps: steps,
            dices: dices,
            skillIndexes: skillIndexes,
            isNatural: isNatural,
            isUnarmed: isUnarmed,
            rowid: rowid,
          ),
        ));
}

class $$WeaponTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WeaponTableTable> {
  $$WeaponTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wieldableIndex => $state.composableBuilder(
      column: $state.table.wieldableIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get purposeIndex => $state.composableBuilder(
      column: $state.table.purposeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get proficiencyIndex => $state.composableBuilder(
      column: $state.table.proficiencyIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get rangeIndex => $state.composableBuilder(
      column: $state.table.rangeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get steps => $state.composableBuilder(
      column: $state.table.steps,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dices => $state.composableBuilder(
      column: $state.table.dices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get skillIndexes => $state.composableBuilder(
      column: $state.table.skillIndexes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isNatural => $state.composableBuilder(
      column: $state.table.isNatural,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isUnarmed => $state.composableBuilder(
      column: $state.table.isUnarmed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WeaponTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WeaponTableTable> {
  $$WeaponTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storedIn => $state.composableBuilder(
      column: $state.table.storedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get improvements => $state.composableBuilder(
      column: $state.table.improvements,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get specialMaterialIndex => $state.composableBuilder(
      column: $state.table.specialMaterialIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ocupedSpace => $state.composableBuilder(
      column: $state.table.ocupedSpace,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wieldableIndex => $state.composableBuilder(
      column: $state.table.wieldableIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get purposeIndex => $state.composableBuilder(
      column: $state.table.purposeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get proficiencyIndex => $state.composableBuilder(
      column: $state.table.proficiencyIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get rangeIndex => $state.composableBuilder(
      column: $state.table.rangeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get steps => $state.composableBuilder(
      column: $state.table.steps,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dices => $state.composableBuilder(
      column: $state.table.dices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get skillIndexes => $state.composableBuilder(
      column: $state.table.skillIndexes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isNatural => $state.composableBuilder(
      column: $state.table.isNatural,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isUnarmed => $state.composableBuilder(
      column: $state.table.isUnarmed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ActionTableTableCreateCompanionBuilder = ActionTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  required String desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$ActionTableTableUpdateCompanionBuilder = ActionTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String> desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$ActionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActionTableTable,
    ActionTableData,
    $$ActionTableTableFilterComposer,
    $$ActionTableTableOrderingComposer,
    $$ActionTableTableCreateCompanionBuilder,
    $$ActionTableTableUpdateCompanionBuilder> {
  $$ActionTableTableTableManager(_$AppDatabase db, $ActionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ActionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ActionTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            required String desc,
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$ActionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ActionTableTable> {
  $$ActionTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ActionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ActionTableTable> {
  $$ActionTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ActionHandToHandTableTableCreateCompanionBuilder
    = ActionHandToHandTableCompanion Function({
  required String uuid,
  required String name,
  required String parentUuid,
  required String desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$ActionHandToHandTableTableUpdateCompanionBuilder
    = ActionHandToHandTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String> desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$ActionHandToHandTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActionHandToHandTableTable,
    ActionHandToHandTableData,
    $$ActionHandToHandTableTableFilterComposer,
    $$ActionHandToHandTableTableOrderingComposer,
    $$ActionHandToHandTableTableCreateCompanionBuilder,
    $$ActionHandToHandTableTableUpdateCompanionBuilder> {
  $$ActionHandToHandTableTableTableManager(
      _$AppDatabase db, $ActionHandToHandTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ActionHandToHandTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ActionHandToHandTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionHandToHandTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            required String desc,
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionHandToHandTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$ActionHandToHandTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ActionHandToHandTableTable> {
  $$ActionHandToHandTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ActionHandToHandTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ActionHandToHandTableTable> {
  $$ActionHandToHandTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ActionDistanceAttackTableTableCreateCompanionBuilder
    = ActionDistanceAttackTableCompanion Function({
  required String uuid,
  required String name,
  required String parentUuid,
  required String desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$ActionDistanceAttackTableTableUpdateCompanionBuilder
    = ActionDistanceAttackTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<String> desc,
  Value<String?> damageDices,
  Value<String?> extraDamageDices,
  Value<int?> pm,
  Value<int?> cd,
  Value<String?> equipamentUuid,
  Value<int?> mediumDamageValue,
  Value<int?> critical,
  Value<int?> criticalMultiplier,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$ActionDistanceAttackTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActionDistanceAttackTableTable,
    ActionDistanceAttackTableData,
    $$ActionDistanceAttackTableTableFilterComposer,
    $$ActionDistanceAttackTableTableOrderingComposer,
    $$ActionDistanceAttackTableTableCreateCompanionBuilder,
    $$ActionDistanceAttackTableTableUpdateCompanionBuilder> {
  $$ActionDistanceAttackTableTableTableManager(
      _$AppDatabase db, $ActionDistanceAttackTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ActionDistanceAttackTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ActionDistanceAttackTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionDistanceAttackTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            required String desc,
            Value<String?> damageDices = const Value.absent(),
            Value<String?> extraDamageDices = const Value.absent(),
            Value<int?> pm = const Value.absent(),
            Value<int?> cd = const Value.absent(),
            Value<String?> equipamentUuid = const Value.absent(),
            Value<int?> mediumDamageValue = const Value.absent(),
            Value<int?> critical = const Value.absent(),
            Value<int?> criticalMultiplier = const Value.absent(),
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              ActionDistanceAttackTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            desc: desc,
            damageDices: damageDices,
            extraDamageDices: extraDamageDices,
            pm: pm,
            cd: cd,
            equipamentUuid: equipamentUuid,
            mediumDamageValue: mediumDamageValue,
            critical: critical,
            criticalMultiplier: criticalMultiplier,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$ActionDistanceAttackTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ActionDistanceAttackTableTable> {
  $$ActionDistanceAttackTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ActionDistanceAttackTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ActionDistanceAttackTableTable> {
  $$ActionDistanceAttackTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get damageDices => $state.composableBuilder(
      column: $state.table.damageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraDamageDices => $state.composableBuilder(
      column: $state.table.extraDamageDices,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pm => $state.composableBuilder(
      column: $state.table.pm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cd => $state.composableBuilder(
      column: $state.table.cd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get equipamentUuid => $state.composableBuilder(
      column: $state.table.equipamentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediumDamageValue => $state.composableBuilder(
      column: $state.table.mediumDamageValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get critical => $state.composableBuilder(
      column: $state.table.critical,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get criticalMultiplier => $state.composableBuilder(
      column: $state.table.criticalMultiplier,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExpertiseTableTableCreateCompanionBuilder = ExpertiseTableCompanion
    Function({
  required String uuid,
  required String name,
  required String parentUuid,
  required int id,
  required int atributeIndex,
  Value<int?> bonus,
  Value<int?> valueFinal,
  required bool isTrained,
  Value<int> rowid,
});
typedef $$ExpertiseTableTableUpdateCompanionBuilder = ExpertiseTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> parentUuid,
  Value<int> id,
  Value<int> atributeIndex,
  Value<int?> bonus,
  Value<int?> valueFinal,
  Value<bool> isTrained,
  Value<int> rowid,
});

class $$ExpertiseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpertiseTableTable,
    ExpertiseTableData,
    $$ExpertiseTableTableFilterComposer,
    $$ExpertiseTableTableOrderingComposer,
    $$ExpertiseTableTableCreateCompanionBuilder,
    $$ExpertiseTableTableUpdateCompanionBuilder> {
  $$ExpertiseTableTableTableManager(
      _$AppDatabase db, $ExpertiseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExpertiseTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExpertiseTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> parentUuid = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<int> atributeIndex = const Value.absent(),
            Value<int?> bonus = const Value.absent(),
            Value<int?> valueFinal = const Value.absent(),
            Value<bool> isTrained = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpertiseTableCompanion(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            id: id,
            atributeIndex: atributeIndex,
            bonus: bonus,
            valueFinal: valueFinal,
            isTrained: isTrained,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String parentUuid,
            required int id,
            required int atributeIndex,
            Value<int?> bonus = const Value.absent(),
            Value<int?> valueFinal = const Value.absent(),
            required bool isTrained,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpertiseTableCompanion.insert(
            uuid: uuid,
            name: name,
            parentUuid: parentUuid,
            id: id,
            atributeIndex: atributeIndex,
            bonus: bonus,
            valueFinal: valueFinal,
            isTrained: isTrained,
            rowid: rowid,
          ),
        ));
}

class $$ExpertiseTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExpertiseTableTable> {
  $$ExpertiseTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get atributeIndex => $state.composableBuilder(
      column: $state.table.atributeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bonus => $state.composableBuilder(
      column: $state.table.bonus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get valueFinal => $state.composableBuilder(
      column: $state.table.valueFinal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isTrained => $state.composableBuilder(
      column: $state.table.isTrained,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExpertiseTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExpertiseTableTable> {
  $$ExpertiseTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentUuid => $state.composableBuilder(
      column: $state.table.parentUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get atributeIndex => $state.composableBuilder(
      column: $state.table.atributeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bonus => $state.composableBuilder(
      column: $state.table.bonus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get valueFinal => $state.composableBuilder(
      column: $state.table.valueFinal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isTrained => $state.composableBuilder(
      column: $state.table.isTrained,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MenaceLinkBoardTableTableCreateCompanionBuilder
    = MenaceLinkBoardTableCompanion Function({
  required String uuid,
  required String menaceUuid,
  required String boardUuid,
  Value<int> rowid,
});
typedef $$MenaceLinkBoardTableTableUpdateCompanionBuilder
    = MenaceLinkBoardTableCompanion Function({
  Value<String> uuid,
  Value<String> menaceUuid,
  Value<String> boardUuid,
  Value<int> rowid,
});

class $$MenaceLinkBoardTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MenaceLinkBoardTableTable,
    MenaceLinkBoardTableData,
    $$MenaceLinkBoardTableTableFilterComposer,
    $$MenaceLinkBoardTableTableOrderingComposer,
    $$MenaceLinkBoardTableTableCreateCompanionBuilder,
    $$MenaceLinkBoardTableTableUpdateCompanionBuilder> {
  $$MenaceLinkBoardTableTableTableManager(
      _$AppDatabase db, $MenaceLinkBoardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$MenaceLinkBoardTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$MenaceLinkBoardTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> menaceUuid = const Value.absent(),
            Value<String> boardUuid = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MenaceLinkBoardTableCompanion(
            uuid: uuid,
            menaceUuid: menaceUuid,
            boardUuid: boardUuid,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String menaceUuid,
            required String boardUuid,
            Value<int> rowid = const Value.absent(),
          }) =>
              MenaceLinkBoardTableCompanion.insert(
            uuid: uuid,
            menaceUuid: menaceUuid,
            boardUuid: boardUuid,
            rowid: rowid,
          ),
        ));
}

class $$MenaceLinkBoardTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MenaceLinkBoardTableTable> {
  $$MenaceLinkBoardTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get menaceUuid => $state.composableBuilder(
      column: $state.table.menaceUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MenaceLinkBoardTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MenaceLinkBoardTableTable> {
  $$MenaceLinkBoardTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get menaceUuid => $state.composableBuilder(
      column: $state.table.menaceUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boardUuid => $state.composableBuilder(
      column: $state.table.boardUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ConfigTableTableCreateCompanionBuilder = ConfigTableCompanion
    Function({
  Value<int> id,
  Value<int> modeIndex,
  Value<bool> showApresetation,
  Value<bool> enableBottomBackButton,
});
typedef $$ConfigTableTableUpdateCompanionBuilder = ConfigTableCompanion
    Function({
  Value<int> id,
  Value<int> modeIndex,
  Value<bool> showApresetation,
  Value<bool> enableBottomBackButton,
});

class $$ConfigTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConfigTableTable,
    ConfigTableData,
    $$ConfigTableTableFilterComposer,
    $$ConfigTableTableOrderingComposer,
    $$ConfigTableTableCreateCompanionBuilder,
    $$ConfigTableTableUpdateCompanionBuilder> {
  $$ConfigTableTableTableManager(_$AppDatabase db, $ConfigTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ConfigTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ConfigTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> modeIndex = const Value.absent(),
            Value<bool> showApresetation = const Value.absent(),
            Value<bool> enableBottomBackButton = const Value.absent(),
          }) =>
              ConfigTableCompanion(
            id: id,
            modeIndex: modeIndex,
            showApresetation: showApresetation,
            enableBottomBackButton: enableBottomBackButton,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> modeIndex = const Value.absent(),
            Value<bool> showApresetation = const Value.absent(),
            Value<bool> enableBottomBackButton = const Value.absent(),
          }) =>
              ConfigTableCompanion.insert(
            id: id,
            modeIndex: modeIndex,
            showApresetation: showApresetation,
            enableBottomBackButton: enableBottomBackButton,
          ),
        ));
}

class $$ConfigTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ConfigTableTable> {
  $$ConfigTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get modeIndex => $state.composableBuilder(
      column: $state.table.modeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get showApresetation => $state.composableBuilder(
      column: $state.table.showApresetation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get enableBottomBackButton => $state.composableBuilder(
      column: $state.table.enableBottomBackButton,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ConfigTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ConfigTableTable> {
  $$ConfigTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get modeIndex => $state.composableBuilder(
      column: $state.table.modeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get showApresetation => $state.composableBuilder(
      column: $state.table.showApresetation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get enableBottomBackButton => $state.composableBuilder(
      column: $state.table.enableBottomBackButton,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CharacterTableTableCreateCompanionBuilder = CharacterTableCompanion
    Function({
  required String uuid,
  required String name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> senses,
  Value<int?> divinityId,
  required int perception,
  required int defense,
  required int life,
  required int mana,
  required int strength,
  required int dexterity,
  required int constitution,
  required int intelligence,
  required int wisdom,
  required int charisma,
  required int creatureSizeIndex,
  required int broodIndex,
  Value<String?> grimoireUuid,
  required int createdAt,
  required int updatedAt,
  Value<String?> trainedExpertisesIndexes,
  required int aligmentIndex,
  Value<int> rowid,
});
typedef $$CharacterTableTableUpdateCompanionBuilder = CharacterTableCompanion
    Function({
  Value<String> uuid,
  Value<String> name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> senses,
  Value<int?> divinityId,
  Value<int> perception,
  Value<int> defense,
  Value<int> life,
  Value<int> mana,
  Value<int> strength,
  Value<int> dexterity,
  Value<int> constitution,
  Value<int> intelligence,
  Value<int> wisdom,
  Value<int> charisma,
  Value<int> creatureSizeIndex,
  Value<int> broodIndex,
  Value<String?> grimoireUuid,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<String?> trainedExpertisesIndexes,
  Value<int> aligmentIndex,
  Value<int> rowid,
});

class $$CharacterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CharacterTableTable,
    CharacterTableData,
    $$CharacterTableTableFilterComposer,
    $$CharacterTableTableOrderingComposer,
    $$CharacterTableTableCreateCompanionBuilder,
    $$CharacterTableTableUpdateCompanionBuilder> {
  $$CharacterTableTableTableManager(
      _$AppDatabase db, $CharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CharacterTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CharacterTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            Value<int?> divinityId = const Value.absent(),
            Value<int> perception = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> life = const Value.absent(),
            Value<int> mana = const Value.absent(),
            Value<int> strength = const Value.absent(),
            Value<int> dexterity = const Value.absent(),
            Value<int> constitution = const Value.absent(),
            Value<int> intelligence = const Value.absent(),
            Value<int> wisdom = const Value.absent(),
            Value<int> charisma = const Value.absent(),
            Value<int> creatureSizeIndex = const Value.absent(),
            Value<int> broodIndex = const Value.absent(),
            Value<String?> grimoireUuid = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<String?> trainedExpertisesIndexes = const Value.absent(),
            Value<int> aligmentIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterTableCompanion(
            uuid: uuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            senses: senses,
            divinityId: divinityId,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            creatureSizeIndex: creatureSizeIndex,
            broodIndex: broodIndex,
            grimoireUuid: grimoireUuid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            trainedExpertisesIndexes: trainedExpertisesIndexes,
            aligmentIndex: aligmentIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            Value<int?> divinityId = const Value.absent(),
            required int perception,
            required int defense,
            required int life,
            required int mana,
            required int strength,
            required int dexterity,
            required int constitution,
            required int intelligence,
            required int wisdom,
            required int charisma,
            required int creatureSizeIndex,
            required int broodIndex,
            Value<String?> grimoireUuid = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<String?> trainedExpertisesIndexes = const Value.absent(),
            required int aligmentIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterTableCompanion.insert(
            uuid: uuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            senses: senses,
            divinityId: divinityId,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            creatureSizeIndex: creatureSizeIndex,
            broodIndex: broodIndex,
            grimoireUuid: grimoireUuid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            trainedExpertisesIndexes: trainedExpertisesIndexes,
            aligmentIndex: aligmentIndex,
            rowid: rowid,
          ),
        ));
}

class $$CharacterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CharacterTableTable> {
  $$CharacterTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnFilters<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnFilters<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get grimoireUuid => $state.composableBuilder(
      column: $state.table.grimoireUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get trainedExpertisesIndexes =>
      $state.composableBuilder(
          column: $state.table.trainedExpertisesIndexes,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get aligmentIndex => $state.composableBuilder(
      column: $state.table.aligmentIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CharacterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CharacterTableTable> {
  $$CharacterTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnOrderings<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnOrderings<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get grimoireUuid => $state.composableBuilder(
      column: $state.table.grimoireUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get trainedExpertisesIndexes =>
      $state.composableBuilder(
          column: $state.table.trainedExpertisesIndexes,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get aligmentIndex => $state.composableBuilder(
      column: $state.table.aligmentIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ClasseCharacterTableTableCreateCompanionBuilder
    = ClasseCharacterTableCompanion Function({
  required String uuid,
  required String characterUuid,
  required int typeIndex,
  required int level,
  Value<int> rowid,
});
typedef $$ClasseCharacterTableTableUpdateCompanionBuilder
    = ClasseCharacterTableCompanion Function({
  Value<String> uuid,
  Value<String> characterUuid,
  Value<int> typeIndex,
  Value<int> level,
  Value<int> rowid,
});

class $$ClasseCharacterTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClasseCharacterTableTable,
    ClasseCharacterTableData,
    $$ClasseCharacterTableTableFilterComposer,
    $$ClasseCharacterTableTableOrderingComposer,
    $$ClasseCharacterTableTableCreateCompanionBuilder,
    $$ClasseCharacterTableTableUpdateCompanionBuilder> {
  $$ClasseCharacterTableTableTableManager(
      _$AppDatabase db, $ClasseCharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ClasseCharacterTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ClasseCharacterTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> characterUuid = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClasseCharacterTableCompanion(
            uuid: uuid,
            characterUuid: characterUuid,
            typeIndex: typeIndex,
            level: level,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String characterUuid,
            required int typeIndex,
            required int level,
            Value<int> rowid = const Value.absent(),
          }) =>
              ClasseCharacterTableCompanion.insert(
            uuid: uuid,
            characterUuid: characterUuid,
            typeIndex: typeIndex,
            level: level,
            rowid: rowid,
          ),
        ));
}

class $$ClasseCharacterTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ClasseCharacterTableTable> {
  $$ClasseCharacterTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ClasseCharacterTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ClasseCharacterTableTable> {
  $$ClasseCharacterTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$OriginTableTableCreateCompanionBuilder = OriginTableCompanion
    Function({
  required String uuid,
  required String characterUuid,
  required String name,
  required String desc,
  Value<int> rowid,
});
typedef $$OriginTableTableUpdateCompanionBuilder = OriginTableCompanion
    Function({
  Value<String> uuid,
  Value<String> characterUuid,
  Value<String> name,
  Value<String> desc,
  Value<int> rowid,
});

class $$OriginTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OriginTableTable,
    OriginTableData,
    $$OriginTableTableFilterComposer,
    $$OriginTableTableOrderingComposer,
    $$OriginTableTableCreateCompanionBuilder,
    $$OriginTableTableUpdateCompanionBuilder> {
  $$OriginTableTableTableManager(_$AppDatabase db, $OriginTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OriginTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OriginTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> characterUuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OriginTableCompanion(
            uuid: uuid,
            characterUuid: characterUuid,
            name: name,
            desc: desc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String characterUuid,
            required String name,
            required String desc,
            Value<int> rowid = const Value.absent(),
          }) =>
              OriginTableCompanion.insert(
            uuid: uuid,
            characterUuid: characterUuid,
            name: name,
            desc: desc,
            rowid: rowid,
          ),
        ));
}

class $$OriginTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $OriginTableTable> {
  $$OriginTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
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
}

class $$OriginTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $OriginTableTable> {
  $$OriginTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
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
}

typedef $$PowerTableTableCreateCompanionBuilder = PowerTableCompanion Function({
  required String uuid,
  required String name,
  required String desc,
  required String characterUuid,
  required int typeIndex,
  Value<int> rowid,
});
typedef $$PowerTableTableUpdateCompanionBuilder = PowerTableCompanion Function({
  Value<String> uuid,
  Value<String> name,
  Value<String> desc,
  Value<String> characterUuid,
  Value<int> typeIndex,
  Value<int> rowid,
});

class $$PowerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PowerTableTable,
    PowerTableData,
    $$PowerTableTableFilterComposer,
    $$PowerTableTableOrderingComposer,
    $$PowerTableTableCreateCompanionBuilder,
    $$PowerTableTableUpdateCompanionBuilder> {
  $$PowerTableTableTableManager(_$AppDatabase db, $PowerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PowerTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PowerTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> desc = const Value.absent(),
            Value<String> characterUuid = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PowerTableCompanion(
            uuid: uuid,
            name: name,
            desc: desc,
            characterUuid: characterUuid,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String name,
            required String desc,
            required String characterUuid,
            required int typeIndex,
            Value<int> rowid = const Value.absent(),
          }) =>
              PowerTableCompanion.insert(
            uuid: uuid,
            name: name,
            desc: desc,
            characterUuid: characterUuid,
            typeIndex: typeIndex,
            rowid: rowid,
          ),
        ));
}

class $$PowerTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PowerTableTable> {
  $$PowerTableTableFilterComposer(super.$state);
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

  ColumnFilters<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PowerTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PowerTableTable> {
  $$PowerTableTableOrderingComposer(super.$state);
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

  ColumnOrderings<String> get characterUuid => $state.composableBuilder(
      column: $state.table.characterUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CharacterBoardTableTableCreateCompanionBuilder
    = CharacterBoardTableCompanion Function({
  required String uuid,
  required String parentuuid,
  required String boarduuid,
  required String name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> senses,
  Value<int?> divinityId,
  required int initiative,
  required int perception,
  required int defense,
  required int life,
  required int mana,
  required int strength,
  required int dexterity,
  required int constitution,
  required int intelligence,
  required int wisdom,
  required int charisma,
  required int typeIndex,
  required int creatureSizeIndex,
  required int broodIndex,
  required int combateRoleIndex,
  Value<int?> treasureTypeIndex,
  Value<String?> grimoireUuid,
  required int createdAt,
  required int updatedAt,
  required bool isAlive,
  required int aligmentIndex,
  required int currentLife,
  required int currentMana,
  Value<String?> inLeftHand,
  Value<String?> inRightHand,
  Value<String?> inTwoHands,
  Value<String?> inWearableSlots,
  Value<int> rowid,
});
typedef $$CharacterBoardTableTableUpdateCompanionBuilder
    = CharacterBoardTableCompanion Function({
  Value<String> uuid,
  Value<String> parentuuid,
  Value<String> boarduuid,
  Value<String> name,
  Value<String?> imagePath,
  Value<String?> imageAsset,
  Value<String?> displacement,
  Value<String?> senses,
  Value<int?> divinityId,
  Value<int> initiative,
  Value<int> perception,
  Value<int> defense,
  Value<int> life,
  Value<int> mana,
  Value<int> strength,
  Value<int> dexterity,
  Value<int> constitution,
  Value<int> intelligence,
  Value<int> wisdom,
  Value<int> charisma,
  Value<int> typeIndex,
  Value<int> creatureSizeIndex,
  Value<int> broodIndex,
  Value<int> combateRoleIndex,
  Value<int?> treasureTypeIndex,
  Value<String?> grimoireUuid,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<bool> isAlive,
  Value<int> aligmentIndex,
  Value<int> currentLife,
  Value<int> currentMana,
  Value<String?> inLeftHand,
  Value<String?> inRightHand,
  Value<String?> inTwoHands,
  Value<String?> inWearableSlots,
  Value<int> rowid,
});

class $$CharacterBoardTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CharacterBoardTableTable,
    CharacterBoardTableData,
    $$CharacterBoardTableTableFilterComposer,
    $$CharacterBoardTableTableOrderingComposer,
    $$CharacterBoardTableTableCreateCompanionBuilder,
    $$CharacterBoardTableTableUpdateCompanionBuilder> {
  $$CharacterBoardTableTableTableManager(
      _$AppDatabase db, $CharacterBoardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CharacterBoardTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CharacterBoardTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uuid = const Value.absent(),
            Value<String> parentuuid = const Value.absent(),
            Value<String> boarduuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            Value<int?> divinityId = const Value.absent(),
            Value<int> initiative = const Value.absent(),
            Value<int> perception = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> life = const Value.absent(),
            Value<int> mana = const Value.absent(),
            Value<int> strength = const Value.absent(),
            Value<int> dexterity = const Value.absent(),
            Value<int> constitution = const Value.absent(),
            Value<int> intelligence = const Value.absent(),
            Value<int> wisdom = const Value.absent(),
            Value<int> charisma = const Value.absent(),
            Value<int> typeIndex = const Value.absent(),
            Value<int> creatureSizeIndex = const Value.absent(),
            Value<int> broodIndex = const Value.absent(),
            Value<int> combateRoleIndex = const Value.absent(),
            Value<int?> treasureTypeIndex = const Value.absent(),
            Value<String?> grimoireUuid = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<bool> isAlive = const Value.absent(),
            Value<int> aligmentIndex = const Value.absent(),
            Value<int> currentLife = const Value.absent(),
            Value<int> currentMana = const Value.absent(),
            Value<String?> inLeftHand = const Value.absent(),
            Value<String?> inRightHand = const Value.absent(),
            Value<String?> inTwoHands = const Value.absent(),
            Value<String?> inWearableSlots = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterBoardTableCompanion(
            uuid: uuid,
            parentuuid: parentuuid,
            boarduuid: boarduuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            senses: senses,
            divinityId: divinityId,
            initiative: initiative,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            typeIndex: typeIndex,
            creatureSizeIndex: creatureSizeIndex,
            broodIndex: broodIndex,
            combateRoleIndex: combateRoleIndex,
            treasureTypeIndex: treasureTypeIndex,
            grimoireUuid: grimoireUuid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isAlive: isAlive,
            aligmentIndex: aligmentIndex,
            currentLife: currentLife,
            currentMana: currentMana,
            inLeftHand: inLeftHand,
            inRightHand: inRightHand,
            inTwoHands: inTwoHands,
            inWearableSlots: inWearableSlots,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uuid,
            required String parentuuid,
            required String boarduuid,
            required String name,
            Value<String?> imagePath = const Value.absent(),
            Value<String?> imageAsset = const Value.absent(),
            Value<String?> displacement = const Value.absent(),
            Value<String?> senses = const Value.absent(),
            Value<int?> divinityId = const Value.absent(),
            required int initiative,
            required int perception,
            required int defense,
            required int life,
            required int mana,
            required int strength,
            required int dexterity,
            required int constitution,
            required int intelligence,
            required int wisdom,
            required int charisma,
            required int typeIndex,
            required int creatureSizeIndex,
            required int broodIndex,
            required int combateRoleIndex,
            Value<int?> treasureTypeIndex = const Value.absent(),
            Value<String?> grimoireUuid = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            required bool isAlive,
            required int aligmentIndex,
            required int currentLife,
            required int currentMana,
            Value<String?> inLeftHand = const Value.absent(),
            Value<String?> inRightHand = const Value.absent(),
            Value<String?> inTwoHands = const Value.absent(),
            Value<String?> inWearableSlots = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterBoardTableCompanion.insert(
            uuid: uuid,
            parentuuid: parentuuid,
            boarduuid: boarduuid,
            name: name,
            imagePath: imagePath,
            imageAsset: imageAsset,
            displacement: displacement,
            senses: senses,
            divinityId: divinityId,
            initiative: initiative,
            perception: perception,
            defense: defense,
            life: life,
            mana: mana,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            typeIndex: typeIndex,
            creatureSizeIndex: creatureSizeIndex,
            broodIndex: broodIndex,
            combateRoleIndex: combateRoleIndex,
            treasureTypeIndex: treasureTypeIndex,
            grimoireUuid: grimoireUuid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isAlive: isAlive,
            aligmentIndex: aligmentIndex,
            currentLife: currentLife,
            currentMana: currentMana,
            inLeftHand: inLeftHand,
            inRightHand: inRightHand,
            inTwoHands: inTwoHands,
            inWearableSlots: inWearableSlots,
            rowid: rowid,
          ),
        ));
}

class $$CharacterBoardTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CharacterBoardTableTable> {
  $$CharacterBoardTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentuuid => $state.composableBuilder(
      column: $state.table.parentuuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get boarduuid => $state.composableBuilder(
      column: $state.table.boarduuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnFilters<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnFilters<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get combateRoleIndex => $state.composableBuilder(
      column: $state.table.combateRoleIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get treasureTypeIndex => $state.composableBuilder(
      column: $state.table.treasureTypeIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get grimoireUuid => $state.composableBuilder(
      column: $state.table.grimoireUuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAlive => $state.composableBuilder(
      column: $state.table.isAlive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get aligmentIndex => $state.composableBuilder(
      column: $state.table.aligmentIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currentLife => $state.composableBuilder(
      column: $state.table.currentLife,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currentMana => $state.composableBuilder(
      column: $state.table.currentMana,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get inLeftHand => $state.composableBuilder(
      column: $state.table.inLeftHand,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get inRightHand => $state.composableBuilder(
      column: $state.table.inRightHand,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get inTwoHands => $state.composableBuilder(
      column: $state.table.inTwoHands,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get inWearableSlots => $state.composableBuilder(
      column: $state.table.inWearableSlots,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CharacterBoardTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CharacterBoardTableTable> {
  $$CharacterBoardTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentuuid => $state.composableBuilder(
      column: $state.table.parentuuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get boarduuid => $state.composableBuilder(
      column: $state.table.boarduuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnOrderings<String> get displacement => $state.composableBuilder(
      column: $state.table.displacement,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get senses => $state.composableBuilder(
      column: $state.table.senses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get divinityId => $state.composableBuilder(
      column: $state.table.divinityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get initiative => $state.composableBuilder(
      column: $state.table.initiative,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get perception => $state.composableBuilder(
      column: $state.table.perception,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defense => $state.composableBuilder(
      column: $state.table.defense,
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

  ColumnOrderings<int> get strength => $state.composableBuilder(
      column: $state.table.strength,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dexterity => $state.composableBuilder(
      column: $state.table.dexterity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get constitution => $state.composableBuilder(
      column: $state.table.constitution,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get intelligence => $state.composableBuilder(
      column: $state.table.intelligence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wisdom => $state.composableBuilder(
      column: $state.table.wisdom,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get charisma => $state.composableBuilder(
      column: $state.table.charisma,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get typeIndex => $state.composableBuilder(
      column: $state.table.typeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatureSizeIndex => $state.composableBuilder(
      column: $state.table.creatureSizeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get broodIndex => $state.composableBuilder(
      column: $state.table.broodIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get combateRoleIndex => $state.composableBuilder(
      column: $state.table.combateRoleIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get treasureTypeIndex => $state.composableBuilder(
      column: $state.table.treasureTypeIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get grimoireUuid => $state.composableBuilder(
      column: $state.table.grimoireUuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAlive => $state.composableBuilder(
      column: $state.table.isAlive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get aligmentIndex => $state.composableBuilder(
      column: $state.table.aligmentIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currentLife => $state.composableBuilder(
      column: $state.table.currentLife,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currentMana => $state.composableBuilder(
      column: $state.table.currentMana,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get inLeftHand => $state.composableBuilder(
      column: $state.table.inLeftHand,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get inRightHand => $state.composableBuilder(
      column: $state.table.inRightHand,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get inTwoHands => $state.composableBuilder(
      column: $state.table.inTwoHands,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get inWearableSlots => $state.composableBuilder(
      column: $state.table.inWearableSlots,
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
  $$BoardNoteTableTableTableManager get boardNoteTable =>
      $$BoardNoteTableTableTableManager(_db, _db.boardNoteTable);
  $$BoardCombatTableTableTableManager get boardCombatTable =>
      $$BoardCombatTableTableTableManager(_db, _db.boardCombatTable);
  $$MenaceTableTableTableManager get menaceTable =>
      $$MenaceTableTableTableManager(_db, _db.menaceTable);
  $$AdventureBackpackTableTableTableManager get adventureBackpackTable =>
      $$AdventureBackpackTableTableTableManager(
          _db, _db.adventureBackpackTable);
  $$EquipmentTableTableTableManager get equipmentTable =>
      $$EquipmentTableTableTableManager(_db, _db.equipmentTable);
  $$AmmunitionTableTableTableManager get ammunitionTable =>
      $$AmmunitionTableTableTableManager(_db, _db.ammunitionTable);
  $$ArmorTableTableTableManager get armorTable =>
      $$ArmorTableTableTableManager(_db, _db.armorTable);
  $$BackpackTableTableTableManager get backpackTable =>
      $$BackpackTableTableTableManager(_db, _db.backpackTable);
  $$GeneralItemTableTableTableManager get generalItemTable =>
      $$GeneralItemTableTableTableManager(_db, _db.generalItemTable);
  $$GeneralSkillTableTableTableManager get generalSkillTable =>
      $$GeneralSkillTableTableTableManager(_db, _db.generalSkillTable);
  $$MagicMenaceTableTableTableManager get magicMenaceTable =>
      $$MagicMenaceTableTableTableManager(_db, _db.magicMenaceTable);
  $$SaddlebagTableTableTableManager get saddlebagTable =>
      $$SaddlebagTableTableTableManager(_db, _db.saddlebagTable);
  $$ShieldTableTableTableManager get shieldTable =>
      $$ShieldTableTableTableManager(_db, _db.shieldTable);
  $$TibarsTableTableTableManager get tibarsTable =>
      $$TibarsTableTableTableManager(_db, _db.tibarsTable);
  $$WeaponTableTableTableManager get weaponTable =>
      $$WeaponTableTableTableManager(_db, _db.weaponTable);
  $$ActionTableTableTableManager get actionTable =>
      $$ActionTableTableTableManager(_db, _db.actionTable);
  $$ActionHandToHandTableTableTableManager get actionHandToHandTable =>
      $$ActionHandToHandTableTableTableManager(_db, _db.actionHandToHandTable);
  $$ActionDistanceAttackTableTableTableManager get actionDistanceAttackTable =>
      $$ActionDistanceAttackTableTableTableManager(
          _db, _db.actionDistanceAttackTable);
  $$ExpertiseTableTableTableManager get expertiseTable =>
      $$ExpertiseTableTableTableManager(_db, _db.expertiseTable);
  $$MenaceLinkBoardTableTableTableManager get menaceLinkBoardTable =>
      $$MenaceLinkBoardTableTableTableManager(_db, _db.menaceLinkBoardTable);
  $$ConfigTableTableTableManager get configTable =>
      $$ConfigTableTableTableManager(_db, _db.configTable);
  $$CharacterTableTableTableManager get characterTable =>
      $$CharacterTableTableTableManager(_db, _db.characterTable);
  $$ClasseCharacterTableTableTableManager get classeCharacterTable =>
      $$ClasseCharacterTableTableTableManager(_db, _db.classeCharacterTable);
  $$OriginTableTableTableManager get originTable =>
      $$OriginTableTableTableManager(_db, _db.originTable);
  $$PowerTableTableTableManager get powerTable =>
      $$PowerTableTableTableManager(_db, _db.powerTable);
  $$CharacterBoardTableTableTableManager get characterBoardTable =>
      $$CharacterBoardTableTableTableManager(_db, _db.characterBoardTable);
}
