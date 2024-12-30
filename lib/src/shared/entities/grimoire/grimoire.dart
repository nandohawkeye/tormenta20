import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

class Grimoire {
  final String uuid;
  final String name;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? imagePath;
  final List<MagicCharacter> magicsCharacters;

  Grimoire({
    required this.uuid,
    required this.name,
    this.desc,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.magicsCharacters,
  });

  @override
  bool operator ==(other) =>
      other is Grimoire &&
      other.desc == desc &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.imagePath == imagePath &&
      other.uuid == uuid &&
      other.magicsCharacters == magicsCharacters;

  @override
  int get hashCode =>
      desc.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      imagePath.hashCode ^
      uuid.hashCode ^
      magicsCharacters.hashCode;
}
