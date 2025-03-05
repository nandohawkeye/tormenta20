import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

class CreatureSize extends EntityBase {
  final CreatureSizeCategory category;
  final double space;
  final int stealthModifier;
  final int maneuverModifier;

  int get id => category.index;

  CreatureSize({
    required this.category,
    required this.space,
    required this.stealthModifier,
    required this.maneuverModifier,
  });

  @override
  bool operator ==(other) =>
      other is CreatureSize &&
      other.category == category &&
      other.space == space &&
      other.stealthModifier == stealthModifier &&
      other.maneuverModifier == maneuverModifier;

  @override
  int get hashCode =>
      category.hashCode ^
      space.hashCode ^
      stealthModifier.hashCode ^
      maneuverModifier.hashCode;

  @override
  String get exibitionLabel => category.name;

  @override
  get primaryKey => id;
}
