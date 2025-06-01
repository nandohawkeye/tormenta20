import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';

class Saddlebag extends Equipment implements HasSpace {
  final double? price;

  const Saddlebag({
    required super.uuid,
    required super.parentUuid,
    required super.createdAt,
    required super.updatedAt,
    this.price,
    super.improvements = const [],
  }) : super(name: 'Alforja');

  @override
  Saddlebag cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Saddlebag(
      uuid: uuid,
      parentUuid: parentUuid,
      price: price,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  int get maxSpaces => 10;

  @override
  int get normalSpaces => 10;

  @override
  bool operator ==(other) =>
      other is Saddlebag &&
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
