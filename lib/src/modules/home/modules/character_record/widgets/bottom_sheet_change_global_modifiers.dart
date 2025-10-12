import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BottomSheetChangeGlobalModifiers extends StatefulWidget {
  const BottomSheetChangeGlobalModifiers({
    super.key,
    required this.label,
    required this.initialValue,
  });

  final String label;
  final int initialValue;

  @override
  State<BottomSheetChangeGlobalModifiers> createState() =>
      _BottomSheetChangeGlobalModifiersState();
}

class _BottomSheetChangeGlobalModifiersState
    extends State<BottomSheetChangeGlobalModifiers> {
  int? _value;
  void _setValue(String? value) {
    if (value == null || value.isEmpty) {
      _value = null;
    } else {
      _value = int.parse(value);
    }
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.only(
                    left: T20UI.spaceSize + 4,
                  ),
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.label,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: FontFamily.tormenta,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DividerLevelTwo(verticalPadding: 0),
          T20UI.spaceHeight,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: T20UI.horizontalPadding,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: _setValue,
                      initialValue: widget.initialValue.toString(),
                      style: const TextStyle(fontSize: 16),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,

                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Valor',
                        fillColor: palette.backgroundLevelOne,
                      ),
                    ),
                  ],
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          RepaintBoundary(
            child: AddEditGeneralSkillsMainButtons(
              onSave: () {
                Navigator.pop(context, _value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
