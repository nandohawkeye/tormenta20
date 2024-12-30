import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

abstract class MagicCharacterAdapters {
  static MagicCharacter fromDriftData(MagicCharacterTableData data) {
    return MagicCharacter(
      uuid: data.uuid,
      grimoireUUid: data.grimoireUUid,
      id: data.magicId,
      name: data.name,
      desc: data.desc,
      circle: magicCircleFromLevel(data.circleLevel),
      type: MagicType.values[data.typeIndex],
      school: MagicSchool.values[data.schoolIndex],
      execution: MagicExecution.values[data.executionIndex],
      duration: MagicDuration.values[data.durationIndex],
      range: MagicRange.values[data.rangeIndex],
      resistence: data.resistence,
      targetAreaEfect: data.targetAreaEfect,
    );
  }

  static MagicCharacterTableCompanion toCompanion(MagicCharacter entity) {
    return MagicCharacterTableCompanion(
      magicId: Value<int>(entity.id),
      uuid: Value<String>(entity.uuid),
      grimoireUUid: Value<String>(entity.grimoireUUid),
      name: Value<String>(entity.name),
      desc: Value<String>(entity.desc),
      circleLevel: Value<int>(entity.circle.level),
      typeIndex: Value<int>(entity.type.index),
      schoolIndex: Value<int>(entity.school.index),
      executionIndex: Value<int>(entity.execution.index),
      durationIndex: Value<int>(entity.duration.index),
      rangeIndex: Value<int>(entity.range.index),
      resistence: Value<String>(entity.resistence),
      targetAreaEfect: Value<String>(entity.targetAreaEfect),
    );
  }
}
