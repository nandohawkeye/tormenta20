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
      iconAsset: Value<String>(entity.iconAsset),
      colorInt: Value<int>(entity.colorInt),
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
      colorInt: dto.grimoireData.colorInt,
      createdAt: dto.grimoireData.createdAt,
      updatedAt: dto.grimoireData.updatedAt,
      magicsCharacters:
          dto.magicsData.map(MagicCharacterAdapters.fromDriftData).toList(),
    );
  }
}
