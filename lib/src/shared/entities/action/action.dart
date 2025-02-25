import 'package:tormenta20/src/shared/entities/action/action_type.dart';

class Action {
  final String uuid;
  final String parentUuid;
  final String title;
  final String desc;
  final ActionType type;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final String? extraDamageDices;
  final int? mediumDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final String? equipament;

  Action({
    required this.uuid,
    required this.parentUuid,
    required this.title,
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
  });

  @override
  bool operator ==(other) =>
      other is Action &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.title == title &&
      other.desc == desc &&
      other.type == type &&
      other.pm == pm &&
      other.cd == cd &&
      other.damageDices == damageDices &&
      other.extraDamageDices == extraDamageDices &&
      other.mediumDamageValue == mediumDamageValue &&
      other.critical == critical &&
      other.criticalMultiplier == criticalMultiplier &&
      other.equipament == equipament;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      title.hashCode ^
      desc.hashCode ^
      type.hashCode ^
      pm.hashCode ^
      cd.hashCode ^
      damageDices.hashCode ^
      extraDamageDices.hashCode ^
      mediumDamageValue.hashCode ^
      critical.hashCode ^
      criticalMultiplier.hashCode ^
      equipament.hashCode;
}
