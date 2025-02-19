import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';

class CreatureSizeService {
  final _tiny = CreatureSize(
    space: 1.5,
    stealthModifier: 5,
    maneuverModifier: -5,
    category: CreatureSizeCategory.tiny,
  );

  final _small = CreatureSize(
    space: 1.5,
    stealthModifier: 2,
    maneuverModifier: -2,
    category: CreatureSizeCategory.small,
  );

  final _medium = CreatureSize(
    space: 1.5,
    stealthModifier: 0,
    maneuverModifier: 0,
    category: CreatureSizeCategory.medium,
  );

  final _big = CreatureSize(
    space: 3,
    stealthModifier: -2,
    maneuverModifier: 2,
    category: CreatureSizeCategory.big,
  );

  final _huge = CreatureSize(
    space: 4.5,
    stealthModifier: -5,
    maneuverModifier: 5,
    category: CreatureSizeCategory.huge,
  );

  final _colossal = CreatureSize(
    space: 9,
    stealthModifier: -10,
    maneuverModifier: 10,
    category: CreatureSizeCategory.colossal,
  );

  List<CreatureSize> getCreaturesSized() =>
      [_tiny, _small, _medium, _big, _huge, _colossal];
}
