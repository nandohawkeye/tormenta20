import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';

class Saddlebag extends Equipment implements HasSpace {
  final double price;

  Saddlebag({
    required super.uuid,
    required super.parentUuid,
    required this.price,
  }) : super(name: 'Alforja');

  @override
  int get maxSpaces => 10;

  @override
  int get normalSpaces => 10;

  @override
  bool operator ==(other) =>
      other is Saddlebag &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.price == price;

  @override
  int get hashCode =>
      uuid.hashCode ^ parentUuid.hashCode ^ name.hashCode ^ price.hashCode;
}
