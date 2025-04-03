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
    return Expertise(
      id: base.id,
      name: base.name,
      isTrained: false,
      atribute: base.atribute,
      parentUuid: menaceUuid,
      uuid: const Uuid().v4(),
      valueFinal: valueFinal,
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
    );
  }
}
