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
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static GeneralSkill fromJson(Map<String, dynamic> json) {
    return GeneralSkill(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      parentUuid: json['parent_uuid'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(GeneralSkill entity) {
    return {
      'uuid': entity.uuid,
      'name': entity.name,
      'desc': entity.desc,
      'parent_uuid': entity.parentUuid,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }

  static GeneralSkillTableCompanion toDriftCompanion(GeneralSkill entity) {
    return GeneralSkillTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      parentUuid: Value(entity.parentUuid),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }
}
