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
  bool operator ==(other) => other is ConditionsBase && other.id == id;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
