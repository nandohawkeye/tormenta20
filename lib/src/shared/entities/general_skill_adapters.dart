import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';

abstract class GeneralSkillAdapters {
  static GeneralSkill fromDriftData(GeneralSkillTableData data) {
    return GeneralSkill(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      parentUuid: data.parentUuid,
    );
  }

  static GeneralSkill fromJson(Map<String, dynamic> json) {
    return GeneralSkill(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      parentUuid: json['parent_uuid'] as String,
    );
  }

  static Map<String, dynamic> toJson(GeneralSkill entity) {
    return {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'parent_uuid': entity.parentUuid,
    };
  }

  static GeneralSkillTableCompanion toDriftCompanion(GeneralSkill entity) {
    return GeneralSkillTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      parentUuid: Value(entity.parentUuid),
    );
  }
}
