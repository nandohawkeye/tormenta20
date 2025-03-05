import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

class CharacterClasse extends EntityBase {
  final String uuid;
  final String playerUuid;
  final ClasseType type;

  CharacterClasse({
    required this.uuid,
    required this.playerUuid,
    required this.type,
  });

  @override
  bool operator ==(other) =>
      other is CharacterClasse &&
      other.uuid == uuid &&
      other.playerUuid == playerUuid &&
      other.type == type;

  @override
  int get hashCode => uuid.hashCode ^ playerUuid.hashCode ^ type.hashCode;

  @override
  String get exibitionLabel => type.name;

  @override
  get primaryKey => uuid;
}
