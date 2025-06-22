import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:uuid/uuid.dart';

abstract class ExpertiseAdapters {
  static Expertise createfromBaseInMenace(
    ExpertiseBase base,
    String menaceUuid,
    int valueFinal,
  ) {
    final now = DateTime.now();
    return Expertise(
      id: base.id,
      name: base.name,
      isTrained: false,
      atribute: base.atribute,
      parentUuid: menaceUuid,
      uuid: const Uuid().v4(),
      valueFinal: valueFinal,
      createdAt: now,
      updatedAt: now,
      onlyTrained: base.onlyTrained,
      armorPenalty: base.armorPenalty,
    );
  }

  static Expertise createfromBaseCharacter(
    ExpertiseBase base,
    String characterUuid,
    bool isTrained,
  ) {
    final now = DateTime.now();
    return Expertise(
      id: base.id,
      name: base.name,
      isTrained: isTrained,
      atribute: base.atribute,
      parentUuid: characterUuid,
      uuid: const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      onlyTrained: base.onlyTrained,
      armorPenalty: base.armorPenalty,
    );
  }

  static Expertise fromDriftData(ExpertiseTableData data) {
    return Expertise(
      id: data.id,
      name: data.name,
      atribute: Atribute.values[data.atributeIndex],
      parentUuid: data.parentUuid,
      uuid: data.uuid,
      isTrained: data.isTrained,
      bonus: data.bonus,
      valueFinal: data.valueFinal,
      onlyTrained: data.onlyTrained ?? false,
      armorPenalty: data.armorPenalty ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static Expertise fromJson(Map<String, dynamic> data) {
    return Expertise(
      id: data['id'],
      name: data['name'],
      atribute: Atribute.values[data['atribute_index']],
      parentUuid: data['parent_uuid'],
      uuid: data['uuid'],
      isTrained: data['is_trained'],
      bonus: data['bonus'],
      valueFinal: data['value_final'],
      onlyTrained: data['only_trained'] ?? false,
      armorPenalty: data['armor_penalty'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Expertise entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'atribute_index': entity.atribute.index,
      'parent_uuid': entity.parentUuid,
      'uuid': entity.uuid,
      'is_trained': entity.isTrained,
      'bonus': entity.bonus,
      'value_final': entity.valueFinal,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
      'only_trained': entity.onlyTrained,
      'armor_penalty': entity.armorPenalty,
    };
  }

  static ExpertiseTableCompanion toDriftCompanion(Expertise entity) {
    return ExpertiseTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      id: Value(entity.id),
      atributeIndex: Value(entity.atribute.index),
      bonus: Value(entity.bonus),
      valueFinal: Value(entity.valueFinal),
      isTrained: Value(entity.isTrained),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
      onlyTrained: Value(entity.onlyTrained),
      armorPenalty: Value(entity.armorPenalty),
    );
  }
}
