import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/character_conditions.dart';
import 'package:tormenta20/src/shared/entities/dices/dice_adapters.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';

abstract class CharacterConditionsAdapters {
  static CharacterConditions fromDriftData(CharacterConditionTableData data) {
    List<ExpertiseBase> expertises = [];
    if (data.expertisesIndexes != null) {
      final indexSplitted = data.expertisesIndexes!.split(',');
      for (var split in indexSplitted) {
        expertises.add(
          ExpertisesBaseService().getExpertises().firstWhere(
            (ex) => ex.id == int.parse(split),
          ),
        );
      }
    }

    List<Atribute> atributes = [];
    if (data.atributesIndexes != null) {
      final atributesSplitted = data.atributesIndexes!.split(',');
      for (var atributeSplit in atributesSplitted) {
        atributes.add(Atribute.values[int.parse(atributeSplit)]);
      }
    }

    return CharacterConditions(
      uuid: data.uuid,
      atributes: atributes,
      conditionId: data.conditionId,
      desc: data.desc,
      dice: data.dice == null ? null : DiceAdapters.fromMacro(data.dice!),
      expertises: expertises,
      inAllExpertises: data.inAllExpertises,
      inAttack: data.inAttack,
      inDefense: data.inDefense,
      inDisplacment: data.inDisplacment,
      inMana: data.inMana,
      name: data.name,
      parentUuid: data.parentUuid,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  CharacterConditionTableCompanion toCompanion(CharacterConditions entity) {
    return CharacterConditionTableCompanion(
      uuid: Value(entity.uuid),
      atributesIndexes: Value(
        entity.atributes.map((a) => a.index).toSet().toString(),
      ),
      conditionId: Value(entity.conditionId),
      desc: Value(entity.desc),
      dice: Value(
        entity.dice == null ? null : DiceAdapters.toMacro(entity.dice!),
      ),
      expertisesIndexes: Value(
        entity.expertises.map((a) => a.id).toSet().toString(),
      ),
      inAllExpertises: Value(entity.inAllExpertises),
      inAttack: Value(entity.inAttack),
      inDefense: Value(entity.inDefense),
      inDisplacment: Value(entity.inDisplacment),
      inMana: Value(entity.inMana),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }
}
