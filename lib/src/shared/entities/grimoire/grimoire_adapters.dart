import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_drift_dto.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';

abstract class GrimoiteAdapters {
  static GrimoireTableCompanion toCompanion(Grimoire entity) {
    return GrimoireTableCompanion(
      uuid: Value<String>(entity.uuid),
      name: Value<String>(entity.name),
      desc: Value<String?>(entity.desc),
      imagePath: Value<String?>(entity.imagePath),
      createdAt: Value<DateTime>(entity.createdAt),
      updatedAt: Value<DateTime>(entity.updatedAt),
    );
  }

  static Grimoire fromDriftDto(GrimoireDriftDto dto) {
    return Grimoire(
      uuid: dto.grimoireData.uuid,
      name: dto.grimoireData.name,
      desc: dto.grimoireData.desc,
      imagePath: dto.grimoireData.imagePath,
      createdAt: dto.grimoireData.createdAt,
      updatedAt: dto.grimoireData.updatedAt,
      magicsCharacters:
          dto.magicsData.map(MagicCharacterAdapters.fromDriftData).toList(),
    );
  }
}
