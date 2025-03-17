import 'package:tormenta20/src/shared/entities/entity_base.dart';

class Origin extends EntityBase {
  final String uuid;
  final String name;
  final String desc;
  final String characterUuid;

  Origin({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.characterUuid,
  });

  @override
  String get exibitionLabel => name;

  @override
  String get primaryKey => uuid;

  @override
  bool operator ==(other) =>
      other is Origin &&
      other.uuid == uuid &&
      other.name == name &&
      other.desc == desc &&
      other.characterUuid == characterUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^ name.hashCode ^ desc.hashCode ^ characterUuid.hashCode;
}
