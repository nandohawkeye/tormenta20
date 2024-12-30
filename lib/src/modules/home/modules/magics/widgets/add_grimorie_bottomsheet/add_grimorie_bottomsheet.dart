// ignore_for_file: prefer_final_fields

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_desc_field.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_header.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_image_field.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_name_field.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
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
  late final ValueNotifier<String?> _imagePath;
  late final ValueNotifier<String?> _errorName;
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
    _imagePath = ValueNotifier<String?>(widget.initialGrimoire?.imagePath);
    _errorName = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _name.dispose();
    _desc.dispose();
    _imagePath.dispose();
    _errorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .6);

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.primaryCTA.withOpacity(.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
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
                      color: palette.bottomSheetBackground,
                      borderRadius: T20UI.borderRadius),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddGrimorieBottomsheetHeader(widget.initialGrimoire),
                      const BottomSheetDivider(verticalPadding: 0),
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
                              const AddGrimorieBottomsheetImageField(),
                              T20UI.spaceHeight,
                              AddGrimorieBottomsheetDescField(desc: _desc),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BottomSheetDivider(verticalPadding: 0),
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
