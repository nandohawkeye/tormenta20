import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Ammunition extends Equipment implements Spaceable {
  final int quantity;
  final String? desc;
  final double? price;

  const Ammunition({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
    required this.quantity,
    required this.price,
    required super.createdAt,
    required super.updatedAt,
    this.desc,
  });

  @override
  Ammunition cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
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
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  double get spaceOcuped => (quantity / 20).floorToDouble();

  @override
  bool operator ==(other) =>
      other is Ammunition &&
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
