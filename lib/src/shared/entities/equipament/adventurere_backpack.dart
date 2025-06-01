import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';

class AdventureBackpack extends Backpack {
  AdventureBackpack({
    required super.uuid,
    required super.parentUuid,
    required super.createdAt,
    required super.updatedAt,
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
    final now = DateTime.now();
    return AdventureBackpack(
      uuid: uuid,
      parentUuid: parentUuid,
      price: price,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  bool operator ==(other) =>
      other is AdventureBackpack &&
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
