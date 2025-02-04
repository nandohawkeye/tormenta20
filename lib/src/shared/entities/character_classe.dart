import 'package:tormenta20/src/shared/entities/classe_type.dart';

class CharacterClasse {
  final String uuid;
  final String characterUuid;
  final ClasseType type;

  CharacterClasse({
    required this.uuid,
    required this.characterUuid,
    required this.type,
  });

  @override
  bool operator ==(other) =>
      other is CharacterClasse &&
      other.uuid == uuid &&
      other.characterUuid == characterUuid &&
      other.type == type;

  @override
  int get hashCode => uuid.hashCode ^ characterUuid.hashCode ^ type.hashCode;
}
