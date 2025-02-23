import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_magic_menace_bottom_sheet/add_edit_magic_menace_desc_textfield.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_magic_menace_bottom_sheet/add_edit_magic_menace_select_magic_field.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/cd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/pm_textfield.dart';
import 'package:uuid/uuid.dart';

class AddEditMagicMenaceBottomSheet extends StatefulWidget {
  const AddEditMagicMenaceBottomSheet({
    super.key,
    this.magic,
    required this.menaceUuid,
  });

  final MagicMenace? magic;
  final String menaceUuid;

  @override
  State<AddEditMagicMenaceBottomSheet> createState() =>
      _AddEditGeneralSkillsBottomSheetState();
}

class _AddEditGeneralSkillsBottomSheetState
    extends State<AddEditMagicMenaceBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final ValueNotifier<bool> _magicHasError;
  int? _magicBaseId;
  void _setMagicBaseId(int? value) => _magicBaseId = value;

  String? _title;
  void _setTitle(String? value) => _title = value;

  String? _desc;
  void _setDesc(String? value) => _desc = value;

  String? _pm;
  void _setPm(String? value) {
    if (value?.isEmpty ?? true) {
      _pm = null;
    } else {
      _pm = value;
    }
  }

  String? _cd;
  void _setCd(String? value) {
    if (value?.isEmpty ?? true) {
      _cd = null;
    } else {
      _cd = value;
    }
  }

  @override
  void initState() {
    super.initState();
    _magicHasError = ValueNotifier<bool>(false);
    _setDesc(widget.magic?.resumedDesc);
    _setPm(widget.magic?.pm.toString());
    _setCd(widget.magic?.cd.toString());
    _setMagicBaseId(widget.magic?.magicBaseId);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Padding(
        padding: T20UI.allPaddingWithPaddingBottom(context),
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: palette.backgroundLevelOne,
                borderRadius: T20UI.borderRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: Text(
                        'Magia da ameaça',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontFamily.tormenta,
                        ),
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                const DividerLevelTwo(verticalPadding: 0),
                T20UI.spaceHeight,
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: T20UI.horizontalPadding,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AddEditMagicMenaceSelectMagicField(
                              onSelectMagic: (magic) =>
                                  _setMagicBaseId(magic.id),
                              initialMagicBaseId: widget.magic?.magicBaseId,
                              hasError: _magicHasError,
                            ),
                            T20UI.spaceHeight,
                            AddEditMagicMenaceDescTextfield(
                              onchange: _setDesc,
                              initialDesc: widget.magic?.resumedDesc,
                            ),
                            T20UI.spaceHeight,
                            Row(
                              children: [
                                Expanded(
                                  child: PmTextfield(
                                    onchange: _setPm,
                                    initialValue: widget.magic?.pm,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: CdTextfield(
                                    onchange: _setCd,
                                    initialValue: widget.magic?.cd,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      T20UI.spaceHeight,
                    ],
                  ),
                ),
                AddEditGeneralSkillsMainButtons(
                  onSave: () {
                    if (_formKey.currentState!.validate()) {
                      final newSkill = GeneralSkill(
                        parentUuid: widget.menaceUuid,
                        uuid: widget.magic?.uuid ?? const Uuid().v4(),
                        title: _title!,
                        desc: _desc!,
                      );

                      Navigator.pop(context, newSkill);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
