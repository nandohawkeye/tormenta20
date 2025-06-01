import 'package:tormenta20/src/shared/entities/equipament/defensible.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Shield extends Equipment implements Spaceable, Defensible {
  final double _space;
  final bool _inUse;
  final ShieldType type;
  final double? price;
  final int defenseBonus;
  final int penalty;
  final String? desc;

  const Shield({
    required super.uuid,
    required super.parentUuid,
    required super.name,
    required double spaceOcuped,
    required bool defenseInUse,
    required super.createdAt,
    required super.updatedAt,
    required this.type,
    this.price,
    required this.defenseBonus,
    required this.penalty,
    this.desc,
    super.storedIn,
    required super.improvements,
    super.specialMaterial,
  })  : _space = spaceOcuped,
        _inUse = defenseInUse;

  @override
  Shield cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Shield(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      spaceOcuped: _space,
      defenseInUse: _inUse,
      type: type,
      price: price,
      defenseBonus: defenseBonus,
      penalty: penalty,
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
      other is Shield &&
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

  @override
  bool get inUse => _inUse;
}
