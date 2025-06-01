import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Tibars extends Equipment implements Spaceable {
  final int gold;
  final int silver;
  final int bronze;
  final bool hasInitialRoll;

  const Tibars({
    super.storedIn,
    required this.gold,
    required this.silver,
    required this.bronze,
    required super.uuid,
    required super.createdAt,
    required super.updatedAt,
    required super.parentUuid,
    this.hasInitialRoll = false,
    super.improvements = const [],
  }) : super(name: 'Tibares');

  @override
  double get spaceOcuped => ((gold + silver + bronze) / 1000).floorToDouble();

  @override
  bool operator ==(other) =>
      other is Tibars &&
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
