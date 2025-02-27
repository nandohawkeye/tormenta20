import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class GeneralItem extends Equipment implements Spaceable {
  final String? desc;
  final double _space;
  final double price;

  GeneralItem({
    this.desc,
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required this.price,
  }) : _space = spaceOcuped;

  @override
  double get spaceOcuped => _space;

  @override
  bool operator ==(other) =>
      other is GeneralItem &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other._space == _space &&
      other.desc == desc &&
      other.price == price;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      _space.hashCode ^
      desc.hashCode ^
      price.hashCode;
}
