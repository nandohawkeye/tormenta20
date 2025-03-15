import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Ammunition extends Equipment implements Spaceable {
  final int quantity;
  final String? desc;
  final double? price;

  Ammunition({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
    required this.quantity,
    required this.price,
    this.desc,
  });

  @override
  Ammunition cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    return Ammunition(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      storedIn: storedIn,
      improvements: improvements,
      specialMaterial: specialMaterial,
      quantity: quantity,
      price: price,
      desc: desc,
    );
  }

  @override
  double get spaceOcuped => (quantity / 20).floorToDouble();

  @override
  bool operator ==(other) =>
      other is Ammunition &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.quantity == quantity &&
      other.price == price &&
      other.desc == desc &&
      other.storedIn == storedIn;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      desc.hashCode ^
      storedIn.hashCode;
}
