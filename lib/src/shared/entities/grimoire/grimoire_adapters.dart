import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/character_adapters.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_drift_dto.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';

abstract class GrimoireAdapters {
  static GrimoireTableCompanion toCompanion(Grimoire entity) {
    return GrimoireTableCompanion(
      uuid: Value<String>(entity.uuid),
      name: Value<String>(entity.name),
      desc: Value<String?>(entity.desc),
      iconAsset: Value<String>(entity.iconAsset),
      createdAt: Value<int>(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value<int>(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static Grimoire fromDriftData(GrimoireTableData data) {
    return Grimoire(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      iconAsset: data.iconAsset,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      magicsCharacters: [],
      characters: [],
    );
  }

  static Grimoire fromDriftDto(GrimoireDriftDto dto) {
    return Grimoire(
      uuid: dto.grimoireData.uuid,
      name: dto.grimoireData.name,
      desc: dto.grimoireData.desc,
      iconAsset: dto.grimoireData.iconAsset,
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(dto.grimoireData.createdAt),
      updatedAt:
          DateTime.fromMillisecondsSinceEpoch(dto.grimoireData.updatedAt),
      magicsCharacters:
          dto.magicsData.map(MagicCharacterAdapters.fromDriftData).toList(),
      characters:
          dto.charactersData.map(CharacterAdapters.fromDriftData).toList(),
    );
  }

  static Grimoire fromJson(Map<String, dynamic> data) {
    List<MagicCharacter> magicsCharacters = [];

    if (data.containsKey('magics')) {
      magicsCharacters.addAll((data['magics'] as List)
          .map((magic) => MagicCharacterAdapters.fromJson(magic)));
    }

    final now = DateTime.now();

    return Grimoire(
      uuid: data['uuid'],
      name: data['name'],
      desc: data['desc'],
      iconAsset: data['icon_asset'],
      createdAt: now,
      updatedAt: now,
      magicsCharacters: magicsCharacters,
      characters: [],
    );
  }

  static Map<String, dynamic> toJson(Grimoire entity) {
    List<Map<String, dynamic>> magicsData = [];
    if (entity.magicsCharacters.isNotEmpty) {
      magicsData
          .addAll(entity.magicsCharacters.map(MagicCharacterAdapters.toJson));
    }

    Map<String, dynamic> data = {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'icon_asset': entity.iconAsset,
    };

    if (magicsData.isNotEmpty) {
      data.addAll({'magics': magicsData});
    }

    return data;
  }

  static Grimoire copyWithNewMagics(
      Grimoire other, List<MagicCharacter> magicsCharacters) {
    return Grimoire(
      uuid: other.uuid,
      name: other.name,
      desc: other.desc,
      createdAt: other.createdAt,
      updatedAt: DateTime.now(),
      magicsCharacters: magicsCharacters,
      iconAsset: other.iconAsset,
      characters: [],
    );
  }
}
