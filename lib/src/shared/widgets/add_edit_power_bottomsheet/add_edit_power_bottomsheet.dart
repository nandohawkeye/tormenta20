import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_type.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet_desc.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet_title.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet_type_selector.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_power_bottomsheet/add_edit_power_bottomsheet_type_store.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:uuid/uuid.dart';

class AddEditPowerBottomsheet extends StatefulWidget {
  const AddEditPowerBottomsheet({
    super.key,
    this.initial,
    required this.parentUuid,
  });

  final Power? initial;
  final String parentUuid;

  @override
  State<AddEditPowerBottomsheet> createState() =>
      _AddEditGeneralSkillsBottomSheetState();
}

class _AddEditGeneralSkillsBottomSheetState
    extends State<AddEditPowerBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  void _setTitle(String? value) => _title = value;

  String? _desc;
  void _setDesc(String? value) => _desc = value;

  @override
  void initState() {
    super.initState();
    _setTitle(widget.initial?.name);
    _setDesc(widget.initial?.desc);
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
                        'Poder',
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
                          children: [
                            AddEditPowerBottomsheetTitle(
                              onchange: _setTitle,
                              initialTitle: widget.initial?.name,
                            ),
                            T20UI.spaceHeight,
                            AddEditPowerBottomsheetDesc(
                              onchange: _setDesc,
                              initialDesc: widget.initial?.desc,
                            ),
                          ],
                        ),
                      ),
                      T20UI.spaceHeight,
                      AddEditPowerBottomsheetTypeSelector(
                        AddEditPowerBottomsheetTypeStore(
                          widget.initial?.type,
                        ),
                      ),
                      T20UI.spaceHeight,
                    ],
                  ),
                ),
                AddEditGeneralSkillsMainButtons(
                  onSave: () {
                    if (_formKey.currentState!.validate()) {
                      final power = Power(
                        characterUuid: widget.parentUuid,
                        uuid: widget.initial?.uuid ?? const Uuid().v4(),
                        name: _title!,
                        desc: _desc!,
                        type: PowerType.general,
                      );

                      Navigator.pop(context, power);
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
