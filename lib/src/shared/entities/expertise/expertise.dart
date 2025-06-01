import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class Expertise extends ExpertiseBase {
  final String uuid;
  final String parentUuid;
  final int? bonus;
  final bool isTrained;
  final int? valueFinal;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Expertise({
    this.bonus,
    this.valueFinal,
    required super.id,
    required super.name,
    required super.atribute,
    required this.parentUuid,
    required this.uuid,
    required this.isTrained,
    required this.createdAt,
    required this.updatedAt,
  });

  Expertise cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Expertise(
      id: id,
      name: name,
      atribute: atribute,
      bonus: bonus,
      valueFinal: valueFinal,
      uuid: uuid,
      parentUuid: parentUuid,
      isTrained: isTrained,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  bool operator ==(other) =>
      other is Expertise &&
      other.id == id &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
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
