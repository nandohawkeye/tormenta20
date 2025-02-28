import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_proficiency.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_purpose.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/wieldable.dart';

class Weapon extends Equipment implements Spaceable, Wieldable {
  final String? desc;
  final double _space;
  final WieldableType _wieldableType;
  final WeaponPurpose purpose;
  final double price;
  final WeaponProficiency proficiency;
  final String dicesDamage;
  final int critical;
  final int criticalMultiplier;
  final int range;
  final WeaponType type;
  final String skillsIndex;
  final bool isNatural;
  final bool isUnarmed;
  final int steps;

  Weapon({
    this.desc,
    super.storedIn,
    super.improvements,
    super.specialMaterials,
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required this.type,
    required this.steps,
    required this.critical,
    required this.range,
    required this.criticalMultiplier,
    required this.dicesDamage,
    required this.price,
    required this.purpose,
    required this.proficiency,
    required this.skillsIndex,
    required this.isNatural,
    required this.isUnarmed,
    required double spaceOcuped,
    required WieldableType wieldableType,
  })  : _space = spaceOcuped,
        _wieldableType = wieldableType;

  @override
  double get spaceOcuped => _space;

  @override
  WieldableType get wieldableType => _wieldableType;

  @override
  bool operator ==(other) =>
      other is Weapon &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.desc == desc &&
      other.type == type &&
      other.steps == steps &&
      other.spaceOcuped == spaceOcuped &&
      other.critical == critical &&
      other.range == range &&
      other.criticalMultiplier == criticalMultiplier &&
      other.price == price &&
      other.purpose == purpose &&
      other.proficiency == proficiency &&
      other.skillsIndex == skillsIndex &&
      other.isNatural == isNatural &&
      other.isUnarmed == isUnarmed &&
      other.spaceOcuped == spaceOcuped &&
      other._space == _space &&
      other._wieldableType == _wieldableType &&
      other.storedIn == storedIn &&
      other.improvements == improvements &&
      other.specialMaterials == specialMaterials;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      type.hashCode ^
      steps.hashCode ^
      spaceOcuped.hashCode ^
      critical.hashCode ^
      range.hashCode ^
      criticalMultiplier.hashCode ^
      price.hashCode ^
      purpose.hashCode ^
      proficiency.hashCode ^
      skillsIndex.hashCode ^
      isNatural.hashCode ^
      isUnarmed.hashCode ^
      spaceOcuped.hashCode ^
      _space.hashCode ^
      _wieldableType.hashCode ^
      storedIn.hashCode ^
      improvements.hashCode ^
      specialMaterials.hashCode;
}
