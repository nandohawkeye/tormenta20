import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';
import 'package:tormenta20/src/shared/widgets/textfields/final_value_textfield.dart';
import 'package:uuid/uuid.dart';

class AddEditMenaceSelectedExpertiseBottomsheet extends StatefulWidget {
  const AddEditMenaceSelectedExpertiseBottomsheet({
    super.key,
    required this.expertiseBase,
    this.valueFinal,
    required this.parentUuid,
    this.expertise,
  });

  final ExpertiseBase expertiseBase;
  final String parentUuid;
  final Expertise? expertise;
  final int? valueFinal;

  @override
  State<AddEditMenaceSelectedExpertiseBottomsheet> createState() =>
      _AddEditSelectedExpertiseBottomsheetState();
}

class _AddEditSelectedExpertiseBottomsheetState
    extends State<AddEditMenaceSelectedExpertiseBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  int? _value;
  void _setValue(String? value) {
    if (value?.isEmpty ?? true) return;

    _value = int.parse(value!);
  }

  @override
  void initState() {
    super.initState();
    _setValue(widget.valueFinal?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.expertise == null,
      child: BottomSheetBase(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    widget.expertiseBase.name.capitalize(),
                    style: const TextStyle(
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
                        FinalValueTextfield(
                          onchange: _setValue,
                          isObrigatory: true,
                          fillColor: palette.backgroundLevelTwo,
                          initialValue: widget.valueFinal,
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DividerLevelTwo(verticalPadding: 0),
                Padding(
                  padding: T20UI.allPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                          label: 'Salvar',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              final now = DateTime.now();
                              final expertise = Expertise(
                                id: widget.expertiseBase.id,
                                uuid:
                                    widget.expertise?.uuid ?? const Uuid().v4(),
                                name: widget.expertiseBase.name,
                                atribute: widget.expertiseBase.atribute,
                                parentUuid: widget.parentUuid,
                                valueFinal: _value,
                                isTrained: false,
                                createdAt: widget.expertise?.createdAt ?? now,
                                updatedAt: now,
                              );

                              Navigator.pop(context, expertise);
                            }
                          },
                        ),
                      ),
                      const SimpleCloseButton()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
