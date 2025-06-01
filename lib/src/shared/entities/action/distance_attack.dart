import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';

class DistanceAttack extends ActionEnt {
  const DistanceAttack({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required super.desc,
    required super.createdAt,
    required super.updatedAt,
    super.cd,
    super.pm,
    super.critical,
    super.criticalMultiplier,
    super.damageDices,
    super.equipament,
    super.extraDamageDices,
    super.mediumDamageValue,
    super.equipamentUuid,
  }) : super(type: ActionType.standard);

  @override
  DistanceAttack cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return DistanceAttack(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      desc: desc,
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
      other is DistanceAttack &&
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
}
