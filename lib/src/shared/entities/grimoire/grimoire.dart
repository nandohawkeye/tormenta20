import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

class Grimoire extends EntityBase {
  final String uuid;
  final String name;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String iconAsset;
  final List<MagicCharacter> magicsCharacters;
  final List<Character> characters;

  Grimoire({
    required this.uuid,
    required this.name,
    this.desc,
    required this.createdAt,
    required this.updatedAt,
    required this.magicsCharacters,
    required this.iconAsset,
    required this.characters,
  });

  @override
  bool operator ==(other) =>
      other is Grimoire &&
      other.uuid == uuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode => uuid.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
