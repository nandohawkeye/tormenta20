import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class GeneralItem extends Equipment implements Spaceable {
  final String? desc;
  final double _space;
  final double? price;
  final GeneralItemType type;

  const GeneralItem({
    this.desc,
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required super.createdAt,
    required super.updatedAt,
    this.price,
    required this.type,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
  }) : _space = spaceOcuped;

  @override
  GeneralItem cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return GeneralItem(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      spaceOcuped: _space,
      price: price,
      type: type,
      desc: desc,
      storedIn: storedIn,
      improvements: improvements,
      specialMaterial: specialMaterial,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  double get spaceOcuped => _space;

  @override
  bool operator ==(other) =>
      other is GeneralItem &&
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
