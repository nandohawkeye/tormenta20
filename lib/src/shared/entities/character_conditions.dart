import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';

class CharacterConditions {
  final String uuid;
  final int conditionId;
  final String parentUuid;
  final String name;
  final String desc;
  final Dice? dice;
  final bool inAllExpertises;
  final bool inMana;
  final bool inAttack;
  final bool inDefense;
  final bool inDisplacment;
  final List<Atribute> atributes;
  final List<ExpertiseBase> expertises;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CharacterConditions({
    required this.uuid,
    required this.conditionId,
    required this.parentUuid,
    required this.name,
    required this.desc,
    required this.dice,
    required this.inMana,
    required this.inAttack,
    required this.inDefense,
    required this.atributes,
    required this.expertises,
    required this.inDisplacment,
    required this.inAllExpertises,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(other) =>
      other is CharacterConditions &&
      other.conditionId == conditionId &&
      other.name == name &&
      other.uuid == uuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      conditionId.hashCode ^
      name.hashCode ^
      uuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      parentUuid.hashCode;
}
