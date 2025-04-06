import 'package:tormenta20/src/shared/entities/equipament/armor_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/defensible.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Armor extends Equipment implements Spaceable, Defensible {
  final double _space;
  final bool _inUse;
  final ArmorType type;
  final double? price;
  final int defenseBonus;
  final int penalty;
  final String? desc;

  Armor({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required bool defenseInUse,
    required this.type,
    this.price,
    required this.defenseBonus,
    required this.penalty,
    this.desc,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
  })  : _space = spaceOcuped,
        _inUse = defenseInUse;

  @override
  Armor cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    return Armor(
        uuid: uuid,
        parentUuid: parentUuid,
        name: name,
        spaceOcuped: _space,
        type: type,
        price: price,
        defenseBonus: defenseBonus,
        penalty: penalty,
        desc: desc,
        storedIn: storedIn,
        improvements: improvements,
        specialMaterial: specialMaterial,
        defenseInUse: _inUse);
  }

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
      other.inUse == inUse &&
      other.storedIn == storedIn &&
      other.improvements == improvements &&
      other.specialMaterial == specialMaterial;

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
      inUse.hashCode ^
      storedIn.hashCode ^
      improvements.hashCode ^
      specialMaterial.hashCode;

  @override
  bool get inUse => _inUse;
}
