import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';

class HandToHand extends ActionEnt {
  HandToHand({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required super.desc,
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
  HandToHand cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    return HandToHand(
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
    );
  }

  @override
  bool operator ==(other) =>
      other is HandToHand &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.desc == desc &&
      other.type == type &&
      other.pm == pm &&
      other.cd == cd &&
      other.damageDices == damageDices &&
      other.extraDamageDices == extraDamageDices &&
      other.mediumDamageValue == mediumDamageValue &&
      other.critical == critical &&
      other.criticalMultiplier == criticalMultiplier &&
      other.equipament == equipament &&
      other.equipamentUuid == equipamentUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      type.hashCode ^
      pm.hashCode ^
      cd.hashCode ^
      damageDices.hashCode ^
      extraDamageDices.hashCode ^
      mediumDamageValue.hashCode ^
      critical.hashCode ^
      criticalMultiplier.hashCode ^
      equipament.hashCode ^
      equipamentUuid.hashCode;
}
