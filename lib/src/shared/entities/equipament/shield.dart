import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Shield extends Equipment implements Spaceable {
  final double _space;
  final ShieldType type;
  final double price;
  final int defenseBonus;
  final int penalty;
  final String? desc;

  Shield({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required this.type,
    required this.price,
    required this.defenseBonus,
    required this.penalty,
    this.desc,
    super.storedIn,
    super.improvements,
    super.specialMaterials,
  }) : _space = spaceOcuped;

  @override
  double get spaceOcuped => _space;

  @override
  bool operator ==(other) =>
      other is Shield &&
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
      other.specialMaterials == specialMaterials;

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
      specialMaterials.hashCode;
}
