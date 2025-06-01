import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/widgets/add_edit_menace_create_expertise_bottomsheet_atribute_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/widgets/add_edit_menace_create_expertise_bottomsheet_atribute_store.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';
import 'package:tormenta20/src/shared/widgets/textfields/final_value_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:uuid/uuid.dart';

class AddEditMenaceCreateExpertiseBottomsheet extends StatefulWidget {
  const AddEditMenaceCreateExpertiseBottomsheet({
    super.key,
    required this.expertiseBase,
    this.valueFinal,
    required this.parentUuid,
    this.expertise,
  });

  final ExpertiseBase? expertiseBase;
  final String parentUuid;
  final Expertise? expertise;
  final int? valueFinal;

  @override
  State<AddEditMenaceCreateExpertiseBottomsheet> createState() =>
      _AddEditSelectedExpertiseBottomsheetState();
}

class _AddEditSelectedExpertiseBottomsheetState
    extends State<AddEditMenaceCreateExpertiseBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditMenaceCreateExpertiseBottomsheetAtributeStore
      _atributeStore;
  String? _name;
  void _setName(String? value) => _name = value;

  int? _value;
  void _setValue(String? value) {
    if (value?.isEmpty ?? true) return;

    _value = int.parse(value!);
  }

  @override
  void initState() {
    super.initState();
    _setValue(widget.valueFinal?.toString());
    _atributeStore = AddEditMenaceCreateExpertiseBottomsheetAtributeStore(
      widget.expertiseBase?.atribute,
    );
  }

  @override
  void dispose() {
    _atributeStore.dispose();
    super.dispose();
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
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    'Pericía',
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
                    padding: T20UI.horizontallScreenPadding,
                    child: Column(
                      children: [
                        NameTextField(
                          initialName: widget.expertiseBase?.name,
                          fillColor: palette.backgroundLevelTwo,
                          onchange: _setName,
                        ),
                        T20UI.spaceHeight,
                        FinalValueTextfield(
                          onchange: _setValue,
                          isObrigatory: true,
                          fillColor: palette.backgroundLevelTwo,
                          initialValue: widget.valueFinal,
                        ),
                        T20UI.spaceHeight,
                      ],
                    ),
                  ),
                  AddEditMenaceCreateExpertiseBottomsheetAtributeSelector(
                    _atributeStore,
                    cardColor: palette.backgroundLevelThree,
                    bodyColor: palette.backgroundLevelTwo,
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
                              final isValidate = _atributeStore.validate();

                              if (!isValidate) return;

                              final now = DateTime.now();

                              final expertise = Expertise(
                                id: widget.expertiseBase?.id ?? 0,
                                uuid:
                                    widget.expertise?.uuid ?? const Uuid().v4(),
                                name: _name!,
                                atribute: _atributeStore.data!,
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
