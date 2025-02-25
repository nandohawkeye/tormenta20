import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_magic_menace/add_edit_magic_menace_desc_textfield.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_magic_menace/add_edit_magic_menace_select_magic_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_magic_menace/add_edit_magic_menace_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/cd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/medio_damage_value_textfield.dart';
import 'package:tormenta20/src/shared/widgets/pm_textfield.dart';

class AddEditMagicMenaceScreen extends StatefulWidget {
  const AddEditMagicMenaceScreen({
    super.key,
    this.magic,
    required this.menaceUuid,
  });

  final MagicMenace? magic;
  final String menaceUuid;

  @override
  State<AddEditMagicMenaceScreen> createState() =>
      _AddEditGeneralSkillsBottomSheetState();
}

class _AddEditGeneralSkillsBottomSheetState
    extends State<AddEditMagicMenaceScreen> {
  late final AddEditMagicMenaceStore _store;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _store = AddEditMagicMenaceStore(widget.magic, widget.menaceUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
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
            Expanded(
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AddEditMagicMenaceSelectMagicField(
                            onSelectMagic: (magic) {
                              _store.setMagicBaseId(magic.id);
                              _store.setMagicName(magic.name);
                            },
                            initialMagicBaseId: widget.magic?.magicBaseId,
                            hasError: _store.magicHasError,
                          ),
                          T20UI.spaceHeight,
                          AddEditMagicMenaceDescTextfield(
                            onchange: _store.setDesc,
                            initialDesc: widget.magic?.resumedDesc,
                          ),
                          T20UI.spaceHeight,
                          Row(
                            children: [
                              Expanded(
                                child: PmTextfield(
                                  onchange: _store.setPm,
                                  initialValue: widget.magic?.pm,
                                ),
                              ),
                              T20UI.spaceWidth,
                              Expanded(
                                child: CdTextfield(
                                  onchange: _store.setCd,
                                  initialValue: widget.magic?.cd,
                                ),
                              )
                            ],
                          ),
                          T20UI.spaceHeight,
                          AddEditDicesField(
                            initialValue: widget.magic?.damageDices,
                            onChangeValues: _store.onChangeDice,
                          ),
                          T20UI.spaceHeight,
                          AddEditDicesField(
                            isExtra: true,
                            initialValue: widget.magic?.extraDamageDices,
                            onChangeValues: _store.onChangeExtraDice,
                          ),
                          T20UI.spaceHeight,
                          MedioDamageValueTextfield(
                            onchange: _store.setMediumDamage,
                            initialValue: widget.magic?.mediumDamageValue,
                          )
                        ],
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
              ),
            ),
            AddEditGeneralSkillsMainButtons(
              onSave: () {
                final isMagicValid = _store.isMagicValid();

                if (!isMagicValid) return;

                if (_formKey.currentState!.validate()) {
                  final magic = _store.onSave();

                  Navigator.pop(context, magic);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
