import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

class ExpertiseBase extends EntityBase {
  final int id;
  final String name;
  final Atribute atribute;
  final bool onlyTrained;
  final bool armorPenalty;

  const ExpertiseBase({
    required this.id,
    required this.name,
    required this.atribute,
    required this.onlyTrained,
    required this.armorPenalty,
  });

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => id;

  @override
  bool operator ==(other) =>
      other is ExpertiseBase &&
      other.id == id &&
      other.name == name &&
      other.atribute == atribute;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ atribute.hashCode;
}
