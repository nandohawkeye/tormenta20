import 'package:tormenta20/src/shared/entities/global_modifiers.dart';

extension GlobalModifiersExt on GlobalModifiers {
  GlobalModifiers erase() => GlobalModifiers(
    parentUuid: parentUuid,
    uuid: uuid,
    rool: 0,
    bonusAttack: 0,
    expertises: 0,
    resistances: 0,
    damage: 0,
    defense: 0,
    bonusArmor: 0,
    bonusShield: 0,
    others: 0,
  );

  GlobalModifiers copyWith({
    int? newRool,
    int? newBonusAttack,
    int? newExpertises,
    int? newResistances,
    int? newDamage,
    int? newDefense,
    int? newBonusArmor,
    int? newBonusShield,
    int? newOthers,
  }) => GlobalModifiers(
    parentUuid: parentUuid,
    uuid: uuid,
    rool: newRool ?? rool,
    bonusAttack: newBonusAttack ?? bonusAttack,
    expertises: newExpertises ?? expertises,
    resistances: newResistances ?? resistances,
    damage: newDamage ?? damage,
    defense: newDefense ?? defense,
    bonusArmor: newBonusArmor ?? bonusArmor,
    bonusShield: newBonusShield ?? bonusShield,
    others: newOthers ?? others,
  );
}
