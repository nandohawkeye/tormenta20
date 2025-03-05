import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

class Expertise extends EntityBase {
  final int id;
  final String name;
  final Atribute atribute;
  final int? bonus;
  final bool isTrained;

  Expertise({
    required this.id,
    required this.name,
    required this.atribute,
    required this.bonus,
    required this.isTrained,
  });

  @override
  bool operator ==(other) =>
      other is Expertise &&
      other.id == id &&
      other.name == name &&
      other.atribute == atribute &&
      other.bonus == bonus &&
      other.isTrained == isTrained;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      atribute.hashCode ^
      bonus.hashCode ^
      isTrained.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => id;
}
