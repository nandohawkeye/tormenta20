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

  static GeneralSkillTableCompanion toDriftCompanion(GeneralSkill entity) {
    return GeneralSkillTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      parentUuid: Value(entity.parentUuid),
    );
  }
}
