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

  ActionEnt({
    required this.uuid,
    required this.parentUuid,
    required this.name,
    required this.desc,
    required this.type,
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

  @override
  bool operator ==(other) =>
      other is ActionEnt &&
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

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
