import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

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

  Expertise cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    return Expertise(
      id: id,
      name: name,
      atribute: atribute,
      bonus: bonus,
      valueFinal: valueFinal,
      uuid: uuid,
      parentUuid: parentUuid,
      isTrained: isTrained,
    );
  }

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
  String get exibitionLabel {
    if (valueFinal == null) {
      return name;
    }

    return '${name.capitalize()} $valueFinal';
  }

  @override
  get primaryKey => uuid;
}
