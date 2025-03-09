import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_bottom_sheet.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditMenaceScreenGeneralSkillsField extends StatelessWidget {
  const AddEditMenaceScreenGeneralSkillsField({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.menaceUuid,
  });

  final AddMultiStore<GeneralSkill> store;
  final Function(String) onAddDeleteList;
  final String menaceUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(GeneralSkill? skill) async {
      await BottomsheetUtils.show<GeneralSkill?>(
        context: context,
        child: AddEditGeneralSkillsBottomSheet(
          skill: skill,
          menaceUuid: menaceUuid,
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Hábilidades gerais',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value.primaryKey);
        store.remove(value);
      },
    );
  }
}
