import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_bottom_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_tokens.dart';
import 'package:tormenta20/src/shared/widgets/defense_textfield.dart';
import 'package:tormenta20/src/shared/widgets/initiative_textfield.dart';
import 'package:tormenta20/src/shared/widgets/life_textfield.dart';
import 'package:tormenta20/src/shared/widgets/mana_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/nd_textfield.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class AddEditMenaceScreen extends StatefulWidget {
  const AddEditMenaceScreen({super.key, this.menace});

  final Menace? menace;

  @override
  State<AddEditMenaceScreen> createState() => _AddEditMenaceScreenState();
}

class _AddEditMenaceScreenState extends State<AddEditMenaceScreen> {
  final _formKey = GlobalKey<FormState>();

  late final AddEditMenaceStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditMenaceStore(widget.menace);
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
            const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
            const AddEditMenaceScreenHeader(),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    AddEditMenaceScreenTokens(
                      store: _store,
                      size: 80,
                    ),
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: NameTextField(
                                    onchange: (_) {},
                                    initialName: null,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: NDTextField(
                                    onchange: (_) {},
                                    initialND: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: LifeTextField(
                                    onchange: (_) {},
                                    initialLife: null,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: ManaTextField(
                                    onchange: (_) {},
                                    initialMana: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InitiativeTextfield(
                                    onchange: (_) {},
                                    initialInitiative: null,
                                  ),
                                ),
                                T20UI.spaceWidth,
                                Expanded(
                                  child: DefenseTextField(
                                    onchange: (_) {},
                                    initialDefense: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          T20UI.spaceHeight,
                          // AddEditBoardPlayerBroodSelector(
                          //   store: _store,
                          // ),
                          // T20UI.spaceHeight,
                          // AddEditBoardPlayerClassesSelector(
                          //   store: _store,
                          // ),
                          // T20UI.spaceHeight,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AddEditMenaceScreenBottomButtons(
              onSave: () {
                // if (_formKey.currentState!.validate()) {
                //   final result = _store.onSave();
                //   if (result != null) {
                //     Navigator.pop(context, result);
                //   }
                // }
              },
            ),
            T20UI.safeAreaBottom(context)
          ],
        ),
      ),
    );
  }
}
