import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';

class ConditionsBase {
  final int id;
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

  ConditionsBase({
    required this.id,
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
  });

  @override
  bool operator ==(other) =>
      other is ConditionsBase &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.expertises == expertises &&
      other.dice == dice &&
      other.inAllExpertises == inAllExpertises &&
      other.inMana == inMana &&
      other.inAttack == inAttack &&
      other.inDefense == inDefense &&
      other.inDisplacment == inDisplacment &&
      other.atributes == atributes;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      expertises.hashCode ^
      dice.hashCode ^
      inAllExpertises.hashCode ^
      inMana.hashCode ^
      inAttack.hashCode ^
      inDefense.hashCode ^
      atributes.hashCode ^
      inDisplacment.hashCode;
}
