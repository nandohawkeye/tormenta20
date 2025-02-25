import 'package:tormenta20/src/shared/entities/atributes.dart';

class Expertise {
  final int id;
  final String label;
  final Atribute atribute;
  final int? bonus;
  final bool isTrained;

  Expertise({
    required this.id,
    required this.label,
    required this.atribute,
    required this.bonus,
    required this.isTrained,
  });

  @override
  bool operator ==(other) =>
      other is Expertise &&
      other.id == id &&
      other.label == label &&
      other.atribute == atribute &&
      other.bonus == bonus &&
      other.isTrained == isTrained;

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      atribute.hashCode ^
      bonus.hashCode ^
      isTrained.hashCode;
}
