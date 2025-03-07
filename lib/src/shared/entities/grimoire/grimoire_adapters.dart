import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
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
      createdAt: Value<DateTime>(entity.createdAt),
      updatedAt: Value<DateTime>(entity.updatedAt),
    );
  }

  static Grimoire fromDriftDto(GrimoireDriftDto dto) {
    return Grimoire(
      uuid: dto.grimoireData.uuid,
      name: dto.grimoireData.name,
      desc: dto.grimoireData.desc,
      iconAsset: dto.grimoireData.iconAsset,
      createdAt: dto.grimoireData.createdAt,
      updatedAt: dto.grimoireData.updatedAt,
      magicsCharacters:
          dto.magicsData.map(MagicCharacterAdapters.fromDriftData).toList(),
    );
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
    );
  }
}
