import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/divinity.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';

class Character {
  final String uuid;
  final String name;
  final String? imagefilePath;
  final String? imageAsset;
  final List<Origin> origins;
  final Brood brood;
  final List<CharacterClasse> classes;
  final Divinity? divinity;

  Character({
    required this.uuid,
    required this.name,
    required this.origins,
    required this.brood,
    required this.classes,
    this.imagefilePath,
    this.imageAsset,
    this.divinity,
  });

  @override
  bool operator ==(other) =>
      other is Character &&
      other.uuid == uuid &&
      other.classes == classes &&
      other.imagefilePath == imagefilePath &&
      other.name == name &&
      other.brood == brood &&
      other.divinity == divinity &&
      other.origins == origins &&
      other.imageAsset == imageAsset;

  @override
  int get hashCode =>
      uuid.hashCode ^
      classes.hashCode ^
      imagefilePath.hashCode ^
      name.hashCode ^
      divinity.hashCode ^
      origins.hashCode ^
      brood.hashCode ^
      imageAsset.hashCode;
}
