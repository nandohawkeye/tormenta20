import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

class Grimoire {
  final String uuid;
  final String name;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String iconAsset;
  final List<MagicCharacter> magicsCharacters;

  Grimoire({
    required this.uuid,
    required this.name,
    this.desc,
    required this.createdAt,
    required this.updatedAt,
    required this.magicsCharacters,
    required this.iconAsset,
  });

  @override
  bool operator ==(other) =>
      other is Grimoire &&
      other.desc == desc &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.uuid == uuid &&
      other.iconAsset == iconAsset &&
      other.magicsCharacters == magicsCharacters;

  @override
  int get hashCode =>
      desc.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      uuid.hashCode ^
      magicsCharacters.hashCode ^
      iconAsset.hashCode;
}
