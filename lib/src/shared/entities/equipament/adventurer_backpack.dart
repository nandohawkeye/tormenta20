import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';

class AdventureBackpack extends Backpack {
  AdventureBackpack({
    required super.uuid,
    required super.parentUuid,
    super.price,
  }) : super(suffix: ' de aventureiro');

  @override
  int get maxSpaces => 28;

  @override
  int get normalSpaces => 12;

  @override
  AdventureBackpack cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    return AdventureBackpack(
      uuid: uuid,
      parentUuid: parentUuid,
      price: price,
    );
  }

  @override
  bool operator ==(other) =>
      other is AdventureBackpack &&
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
