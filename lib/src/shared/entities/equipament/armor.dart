import 'package:tormenta20/src/shared/entities/equipament/armor_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_skills.dart';

class Armor extends Equipment implements Spaceable {
  final double _space;
  final ArmorType type;
  final double? price;
  final int defenseBonus;
  final int penalty;
  final String? desc;
  final List<WeaponSkills> skills;

  Armor({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required this.type,
    this.price,
    required this.defenseBonus,
    required this.penalty,
    this.desc,
    super.storedIn,
    required super.improvements,
    required this.skills,
    super.specialMaterial,
  }) : _space = spaceOcuped;

  @override
  double get spaceOcuped => _space;

  @override
  bool operator ==(other) =>
      other is Armor &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other._space == _space &&
      other.type == type &&
      other.price == price &&
      other.defenseBonus == defenseBonus &&
      other.penalty == penalty &&
      other.desc == desc &&
      other.storedIn == storedIn &&
      other.improvements == improvements &&
      other.specialMaterial == specialMaterial &&
      other.skills == skills;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      _space.hashCode ^
      type.hashCode ^
      price.hashCode ^
      defenseBonus.hashCode ^
      penalty.hashCode ^
      desc.hashCode ^
      storedIn.hashCode ^
      improvements.hashCode ^
      specialMaterial.hashCode ^
      skills.hashCode;
}
