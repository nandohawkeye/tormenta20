// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_desc_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_icon_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_name_field.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/screen_save_main_buttons.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';
import 'package:uuid/uuid.dart';

class AddGrimorieBottomsheet extends StatefulWidget {
  const AddGrimorieBottomsheet({super.key, this.initialGrimoire});

  final Grimoire? initialGrimoire;

  @override
  State<AddGrimorieBottomsheet> createState() => _AddGrimorieBottomsheetState();
}

class _AddGrimorieBottomsheetState extends State<AddGrimorieBottomsheet> {
  final _formKey = GlobalKey<FormState>();

  String? _uuid;
  DateTime? _createdAt;
  List<MagicCharacter> _magics = [];

  late final ValueNotifier<String?> _name;
  late final ValueNotifier<String?> _desc;
  late final ValueNotifier<String?> _errorName;
  late final ValueNotifier<String> _iconAsset;
  String? _validName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'obrigatório!';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _uuid = widget.initialGrimoire?.uuid ?? const Uuid().v4();
    _createdAt = widget.initialGrimoire?.createdAt;
    _magics.addAll(widget.initialGrimoire?.magicsCharacters ?? []);
    _name = ValueNotifier<String?>(widget.initialGrimoire?.name);
    _desc = ValueNotifier<String?>(widget.initialGrimoire?.desc);
    _errorName = ValueNotifier<String?>(null);

    _iconAsset =
        ValueNotifier<String>(widget.initialGrimoire?.iconAsset ?? 'book');
  }

  @override
  void dispose() {
    _name.dispose();
    _desc.dispose();
    _errorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
              label:
                  '${widget.initialGrimoire == null ? 'Criando' : 'Editando'} Grimório'),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: T20UI.verticalPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddGrimorieBottomsheetNameField(
                    validator: _validName,
                    formKey: _formKey,
                    name: _name,
                    errorName: _errorName,
                  ),
                  T20UI.spaceHeight,
                  AddGrimorieBottomsheetDescField(desc: _desc),
                  T20UI.spaceHeight,
                  AddGrimorieBottomsheetIconField(iconAsset: _iconAsset)
                ],
              ),
            ),
          ),
          ScreenSaveMainButtons(
            label: widget.initialGrimoire != null ? 'Salvar' : 'Criar',
            onSave: () {
              if (_formKey.currentState?.validate() ?? false) {
                final now = DateTime.now();
                final Grimoire grimoire = Grimoire(
                  uuid: _uuid!,
                  name: _name.value ?? '',
                  desc: _desc.value,
                  createdAt: _createdAt ?? now,
                  updatedAt: now,
                  magicsCharacters: _magics,
                  iconAsset: _iconAsset.value,
                  colorInt: 0xFFCC152A,
                );

                Navigator.pop(context, grimoire);
              }
            },
          ),
        ],
      ),
    );
  }
}
