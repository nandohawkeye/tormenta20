import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/spaceable.dart';

//TODO inserir tibars ao criar characterBoard e seus adaptadores
class Tibars extends Equipment implements Spaceable {
  final int gold;
  final int silver;
  final int bronze;

  Tibars({
    super.storedIn,
    required this.gold,
    required this.silver,
    required this.bronze,
    required super.uuid,
    required super.parentUuid,
    super.improvements = const [],
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
      other.spaceOcuped == spaceOcuped &&
      other.storedIn == storedIn;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      gold.hashCode ^
      silver.hashCode ^
      bronze.hashCode ^
      spaceOcuped.hashCode ^
      storedIn.hashCode;
}
