import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/classe.dart';
import 'package:tormenta20/src/shared/entities/divinity.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';

class Character {
  final String uuid;
  final String name;
  final String? imagefilePath;
  final String? imageAsset;
  final List<Origin> origins;
  final Brood brood;
  final List<Classe> classes;
  final Divinity divinity;

  Character({
    required this.uuid,
    required this.name,
    required this.imagefilePath,
    required this.imageAsset,
    required this.origins,
    required this.brood,
    required this.classes,
    required this.divinity,
  });
}
