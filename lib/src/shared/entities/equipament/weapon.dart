import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_weapon_range_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_proficiency.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_purpose.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_skills.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/wieldable.dart';

class Weapon extends Equipment implements Spaceable, Wieldable {
  final String? desc;
  final double _space;
  final WieldableType _wieldableType;
  final WeaponPurpose purpose;
  final double? price;
  final WeaponProficiency proficiency;
  final String dices;
  final int critical;
  final int criticalMultiplier;
  final EquipmentWeaponRangeType range;
  final WeaponType type;
  final List<WeaponSkills> skills;
  final bool isNatural;
  final bool isUnarmed;
  final int? steps;

  const Weapon({
    this.desc,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
    required this.type,
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required this.purpose,
    required super.createdAt,
    required super.updatedAt,
    required WieldableType wieldableType,
    required this.proficiency,
    required this.skills,
    this.steps,
    required this.critical,
    required this.criticalMultiplier,
    required this.range,
    required this.dices,
    this.price,
    required this.isNatural,
    required this.isUnarmed,
    required double spaceOcuped,
  })  : _space = spaceOcuped,
        _wieldableType = wieldableType;

  @override
  Weapon cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Weapon(
      desc: desc,
      storedIn: storedIn,
      improvements: improvements,
      specialMaterial: specialMaterial,
      type: type,
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      purpose: purpose,
      wieldableType: _wieldableType,
      proficiency: proficiency,
      skills: skills,
      steps: steps,
      critical: critical,
      criticalMultiplier: criticalMultiplier,
      range: range,
      dices: dices,
      price: price,
      isNatural: isNatural,
      isUnarmed: isUnarmed,
      spaceOcuped: _space,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  double get spaceOcuped => _space;

  @override
  WieldableType get wieldableType => _wieldableType;

  @override
  bool operator ==(other) =>
      other is Weapon &&
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
