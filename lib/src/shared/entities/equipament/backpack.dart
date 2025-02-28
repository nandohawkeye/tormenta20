import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';

class Backpack extends Equipment implements HasSpace {
  final double price;
  final String? suffix;

  Backpack({
    required super.uuid,
    required super.parentUuid,
    required this.price,
    this.suffix,
  }) : super(name: 'Mochila${suffix ?? ''}');

  @override
  int get normalSpaces => 10;

  @override
  int get maxSpaces => 28;

  @override
  bool operator ==(other) =>
      other is Backpack &&
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
