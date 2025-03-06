import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';

class Expertise extends ExpertiseBase {
  final String uuid;
  final String parentUuid;
  final int? bonus;
  final bool isTrained;
  final int? valueFinal;

  Expertise({
    this.bonus,
    this.valueFinal,
    required super.id,
    required super.name,
    required super.atribute,
    required this.parentUuid,
    required this.uuid,
    required this.isTrained,
  });

  @override
  bool operator ==(other) =>
      other is Expertise &&
      other.id == id &&
      other.name == name &&
      other.atribute == atribute &&
      other.bonus == bonus &&
      other.isTrained == isTrained &&
      other.uuid == uuid &&
      other.valueFinal == valueFinal &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      atribute.hashCode ^
      bonus.hashCode ^
      isTrained.hashCode ^
      uuid.hashCode ^
      valueFinal.hashCode ^
      parentUuid.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
