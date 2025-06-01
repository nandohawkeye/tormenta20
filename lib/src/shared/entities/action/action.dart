import 'package:tormenta20/src/shared/entities/action/action_type.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';

class ActionEnt extends EntityBase {
  final String uuid;
  final String parentUuid;
  final String name;
  final String desc;
  final ActionType type;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final String? extraDamageDices;
  final int? mediumDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final Equipment? equipament;
  final String? equipamentUuid;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ActionEnt({
    required this.uuid,
    required this.parentUuid,
    required this.name,
    required this.desc,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.pm,
    this.cd,
    this.damageDices,
    this.extraDamageDices,
    this.mediumDamageValue,
    this.critical,
    this.criticalMultiplier,
    this.equipament,
    this.equipamentUuid,
  });

  ActionEnt cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return ActionEnt(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      desc: desc,
      type: type,
      pm: pm,
      cd: cd,
      damageDices: damageDices,
      extraDamageDices: extraDamageDices,
      mediumDamageValue: mediumDamageValue,
      critical: critical,
      criticalMultiplier: criticalMultiplier,
      equipament: equipament,
      equipamentUuid: equipamentUuid,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  bool operator ==(other) =>
      other is ActionEnt &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
