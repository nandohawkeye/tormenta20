import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

class Tibars extends Equipment implements Spaceable {
  final int gold;
  final int silver;
  final int bronze;

  Tibars(
    this.gold,
    this.silver,
    this.bronze, {
    required super.uuid,
    required super.parentUuid,
  }) : super(name: 'Tibares');

  @override
  double get spaceOcuped => ((gold + silver + bronze) / 1000).floorToDouble();

  @override
  bool operator ==(other) =>
      other is Tibars &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.gold == gold &&
      other.silver == silver &&
      other.bronze == bronze &&
      other.spaceOcuped == spaceOcuped;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      gold.hashCode ^
      silver.hashCode ^
      bronze.hashCode ^
      spaceOcuped.hashCode;
}
