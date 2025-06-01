import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_desc_textfield.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_title_textfield.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:uuid/uuid.dart';

class AddEditGeneralSkillsBottomSheet extends StatefulWidget {
  const AddEditGeneralSkillsBottomSheet({
    super.key,
    this.skill,
    required this.menaceUuid,
  });

  final GeneralSkill? skill;
  final String menaceUuid;

  @override
  State<AddEditGeneralSkillsBottomSheet> createState() =>
      _AddEditGeneralSkillsBottomSheetState();
}

class _AddEditGeneralSkillsBottomSheetState
    extends State<AddEditGeneralSkillsBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  void _setTitle(String? value) => _title = value;

  String? _desc;
  void _setDesc(String? value) => _desc = value;

  @override
  void initState() {
    super.initState();
    _setTitle(widget.skill?.name);
    _setDesc(widget.skill?.desc);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    'Habilidade geral',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.tormenta,
                    ),
                  ),
                ),
                T20UI.spaceHeight,
              ],
            ),
          ),
          const DividerLevelTwo(verticalPadding: 0),
          T20UI.spaceHeight,
          RepaintBoundary(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: Column(
                      children: [
                        AddEditGeneralSkillsTitleTextfield(
                          onchange: _setTitle,
                          initialTitle: widget.skill?.name,
                        ),
                        T20UI.spaceHeight,
                        AddEditGeneralSkillsDescTextfield(
                          onchange: _setDesc,
                          initialDesc: widget.skill?.desc,
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                ],
              ),
            ),
          ),
          RepaintBoundary(
            child: AddEditGeneralSkillsMainButtons(
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  final now = DateTime.now();
                  final newSkill = GeneralSkill(
                    parentUuid: widget.menaceUuid,
                    uuid: widget.skill?.uuid ?? const Uuid().v4(),
                    name: _title!,
                    desc: _desc!,
                    createdAt: widget.skill?.createdAt ?? now,
                    updatedAt: now,
                  );

                  Navigator.pop(context, newSkill);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
