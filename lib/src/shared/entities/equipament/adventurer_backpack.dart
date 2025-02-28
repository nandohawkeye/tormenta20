import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';

class AdventurerBackpack extends Backpack {
  AdventurerBackpack({
    required super.uuid,
    required super.parentUuid,
    required super.price,
  }) : super(suffix: ' de aventureiro');

  @override
  int get maxSpaces => 28;

  @override
  int get normalSpaces => 12;

  @override
  bool operator ==(other) =>
      other is AdventurerBackpack &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.suffix == suffix &&
      other.price == price;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      suffix.hashCode ^
      price.hashCode;
}
