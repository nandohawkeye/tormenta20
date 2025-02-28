import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/screen_save_main_buttons.dart';

import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class AddEditEquipaments extends StatefulWidget {
  const AddEditEquipaments(
      {super.key, this.equipament, required this.menaceUuid});

  final Equipment? equipament;
  final String menaceUuid;

  @override
  State<AddEditEquipaments> createState() => _AddEditActionScreenState();
}

class _AddEditActionScreenState extends State<AddEditEquipaments> {
  final _formKey = GlobalKey<FormState>();
  // late final AddEditActionStore _store;

  @override
  void initState() {
    super.initState();
    // _store = AddEditActionStore();
  }

  @override
  void dispose() {
    // _store.dispose();
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
            const ScreenHeader(label: 'Equipamento'),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      T20UI.spaceHeight,
                      AddEditEquipamentType(),
                    ],
                  ),
                ),
              ),
            ),
            ScreenSaveMainButtons(
              onSave: () {
                // final isMagicValid = _store.isMagicValid();

                // if (!isMagicValid) return;

                // if (_formKey.currentState!.validate()) {
                //   final magic = _store.onSave();

                //   Navigator.pop(context, magic);
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
