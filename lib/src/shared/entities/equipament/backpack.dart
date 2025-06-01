import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';

class Backpack extends Equipment implements HasSpace {
  final double? price;
  final String? suffix;

  const Backpack({
    required super.uuid,
    required super.parentUuid,
    required super.createdAt,
    required super.updatedAt,
    this.price,
    this.suffix,
    super.improvements = const [],
  }) : super(name: 'Mochila${suffix ?? ''}');

  @override
  Backpack cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Backpack(
      uuid: uuid,
      parentUuid: parentUuid,
      price: price,
      suffix: suffix,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  int get normalSpaces => 10;

  @override
  int get maxSpaces => 28;

  @override
  bool operator ==(other) =>
      other is Backpack &&
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
