import 'package:tormenta20/src/shared/entities/entity_base.dart';

class GeneralSkill extends EntityBase {
  final String uuid;
  final String name;
  final String desc;
  final String parentUuid;

  GeneralSkill({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.parentUuid,
  });

  @override
  bool operator ==(other) =>
      other is GeneralSkill &&
      other.uuid == uuid &&
      other.name == name &&
      other.desc == desc &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^ name.hashCode ^ desc.hashCode ^ parentUuid.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
