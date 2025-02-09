// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_color_field.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_desc_field.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_icon_field.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_name_field.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/default_brackdrop_filter.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';
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
  late final ValueNotifier<int> _colorInt;
  late final ValueNotifier<String> _iconAsset;
  String? _validName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'O nome é obrigatório!';
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
    _colorInt =
        ValueNotifier<int>(widget.initialGrimoire?.colorInt ?? 0xFFCC152A);
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
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .9);

    return Stack(
      children: [
        const DefaultBrackdropFilter(),
        DraggableScrollableSheet(
          maxChildSize: limite,
          initialChildSize: initialSize,
          builder: (context, scrollController) {
            return Padding(
              padding: T20UI.allPaddingWithPaddingBottom(context,
                  extra: MediaQuery.of(context).padding.bottom),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: palette.backgroundLevelOne,
                      borderRadius: T20UI.borderRadius),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddGrimorieBottomsheetHeader(widget.initialGrimoire),
                      const DividerLevelTwo(verticalPadding: 0),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
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
                              AddGrimorieBottomsheetColorField(
                                  colorInt: _colorInt),
                              T20UI.spaceHeight,
                              AddGrimorieBottomsheetIconField(
                                  iconAsset: _iconAsset)
                            ],
                          ),
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
                                    label: widget.initialGrimoire != null
                                        ? 'Salvar'
                                        : 'Criar',
                                    onTap: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final now = DateTime.now();
                                        final Grimoire grimoire = Grimoire(
                                          uuid: _uuid!,
                                          name: _name.value ?? '',
                                          desc: _desc.value,
                                          createdAt: _createdAt ?? now,
                                          updatedAt: now,
                                          magicsCharacters: _magics,
                                          iconAsset: _iconAsset.value,
                                          colorInt: _colorInt.value,
                                        );

                                        Navigator.pop(context, grimoire);
                                      }
                                    },
                                  ),
                                ),
                                T20UI.spaceWidth,
                                const SimpleCloseButton()
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
