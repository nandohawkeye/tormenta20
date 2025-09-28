import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_main_buttons.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_origin_bottomsheet/add_edit_origin_bottomsheet_title.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';
import 'package:uuid/uuid.dart';

class _AddEditAtributeStore extends SelectorOnlyStore<Atribute> {
  _AddEditAtributeStore(super.initialValue);
}

class AddEditOfficeExpertiseBottomsheet extends StatefulWidget {
  const AddEditOfficeExpertiseBottomsheet({
    super.key,
    this.initialExpertise,
    required this.parentUuid,
  });

  final Expertise? initialExpertise;
  final String parentUuid;

  @override
  State<AddEditOfficeExpertiseBottomsheet> createState() =>
      _AddEditOfficeExpertiseBottomSheetState();
}

class _AddEditOfficeExpertiseBottomSheetState
    extends State<AddEditOfficeExpertiseBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  void _setTitle(String? value) => _name = value;
  late final ValueNotifier<bool> _armorPenalty;
  late final _AddEditAtributeStore _atributeStore;

  @override
  void initState() {
    super.initState();
    _setTitle(widget.initialExpertise?.name);
    _armorPenalty = ValueNotifier<bool>(
      widget.initialExpertise?.armorPenalty ?? false,
    );
    _atributeStore = _AddEditAtributeStore(
      widget.initialExpertise?.atribute ?? Atribute.strength,
    );
  }

  @override
  void dispose() {
    _armorPenalty.dispose();
    _atributeStore.dispose();
    super.dispose();
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
                    'Ofício',
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
                    padding: T20UI.horizontallScreenPadding,
                    child: Column(
                      children: [
                        AddEditOriginBottomsheetTitle(
                          onchange: _setTitle,
                          initialTitle: widget.initialExpertise?.name,
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  SelectorOnlyField<Atribute>(
                    label: 'Atributo base',
                    handleTitle: AtributeUtils.handleTitle,
                    itens: Atribute.values,
                    store: _atributeStore,
                    isObrigatory: true,
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: InkWell(
                      onTap: () {
                        _armorPenalty.value = !_armorPenalty.value;
                      },
                      child: Row(
                        children: [
                          ListenableBuilder(
                            listenable: _armorPenalty,
                            builder: (_, _) {
                              final value = _armorPenalty.value;
                              return CustomChecked(
                                value: value,
                                isEnabledToTap: false,
                              );
                            },
                          ),
                          T20UI.smallSpaceWidth,
                          const Text('Penalidade de armadura'),
                        ],
                      ),
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
                  final expertise = Expertise(
                    id: 0,
                    name: _name!,
                    atribute: _atributeStore.data ?? Atribute.strength,
                    onlyTrained: false,
                    armorPenalty: _armorPenalty.value,
                    parentUuid: widget.parentUuid,
                    uuid: widget.initialExpertise?.uuid ?? const Uuid().v4(),
                    isTrained: true,
                    createdAt: widget.initialExpertise?.createdAt ?? now,
                    updatedAt: now,
                    isOffice: true,
                  );

                  Navigator.pop(context, expertise);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
