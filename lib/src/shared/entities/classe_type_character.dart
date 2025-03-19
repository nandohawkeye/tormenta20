import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class ClasseTypeCharacter extends EntityBase {
  final String uuid;
  final String characterUuid;
  final ClasseType type;
  final int level;

  ClasseTypeCharacter({
    required this.uuid,
    required this.type,
    required this.level,
    required this.characterUuid,
  });

  @override
  String get exibitionLabel =>
      '${CharacterUtils.handleClasseTypeTitle(type.name)} $level˚';

  @override
  String get primaryKey => uuid;

  @override
  bool operator ==(other) =>
      other is ClasseTypeCharacter &&
      other.uuid == uuid &&
      other.characterUuid == characterUuid &&
      other.type == type &&
      other.level == level;

  @override
  int get hashCode =>
      uuid.hashCode ^ type.hashCode ^ characterUuid.hashCode ^ level.hashCode;
}
