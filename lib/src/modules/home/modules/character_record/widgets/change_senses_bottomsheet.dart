import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';
import 'package:tormenta20/src/shared/widgets/textfields/senses_textfield.dart';

class ChangeSensesBottomsheet extends StatefulWidget {
  const ChangeSensesBottomsheet({super.key, required this.initialSenses});

  final String? initialSenses;

  @override
  State<ChangeSensesBottomsheet> createState() => _ChangeSensesBottomsheet();
}

class _ChangeSensesBottomsheet extends State<ChangeSensesBottomsheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.horizontalPadding,
            child: Text(
              'Escreva os sentidos',
              style: TextStyle(fontSize: 18, fontFamily: FontFamily.tormenta),
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontalPadding,
            child: Form(
              key: _formKey,

              child: SensesTextfield(
                initialValue: widget.initialSenses,
                onSaved: (value) {
                  Navigator.pop(context, value);
                },
                onFieldSubmitted: (value) {
                  Navigator.pop(context, value);
                },
              ),
            ),
          ),
          T20UI.spaceHeight,
          const DividerLevelTwo(verticalPadding: 0),
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              children: [
                Expanded(
                  child: MainButton(
                    label: 'Salvar',
                    onTap: () {
                      _formKey.currentState?.save();
                    },
                  ),
                ),
                const SimpleCloseButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
