import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_board/widgets/board_adventure_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_board/widgets/board_desc_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_board/widgets/board_level_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_board/widgets/board_name_field.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddBoardScreen extends StatefulWidget {
  const AddBoardScreen({super.key});

  @override
  State<AddBoardScreen> createState() => _AddBoardScreenState();
}

class _AddBoardScreenState extends State<AddBoardScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          T20UI.spaceHeight,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: T20UI.horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Labels('Criando mesa')],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: T20UI.spaceSize - 4,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: BoardNameField((_) {}),
                              ),
                              T20UI.spaceWidth,
                              Expanded(
                                child: BoardLevelField((_) {}),
                              )
                            ],
                          ),
                        ),
                        T20UI.spaceHeight,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: T20UI.spaceSize - 4,
                          ),
                          child: BoardAdventureField((_) {}),
                        ),
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.spaceSize - 4,
                    ),
                    child: BoardDescField((_) {}),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Labels('Banner'),
                        SimpleButton(
                          icon: FontAwesomeIcons.plus,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.spaceSize - 4,
                    ),
                    child: MainButton(
                      label: 'Selecionar banner',
                      backgroundColor: palette.cardBackground,
                      onTap: () {},
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Labels('Personagens'),
                        SimpleButton(
                          icon: FontAwesomeIcons.plus,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.spaceSize - 4,
                    ),
                    child: MainButton(
                      label: 'Adicionar personagem',
                      backgroundColor: palette.cardBackground,
                      onTap: () {},
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Labels('Materiais'),
                        SimpleButton(
                          icon: FontAwesomeIcons.plus,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.spaceSize - 4,
                    ),
                    child: MainButton(
                      label: 'Adicionar material',
                      backgroundColor: palette.cardBackground,
                      onTap: () {},
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: T20UI.horizontalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Labels('Links'),
                        SimpleButton(
                          icon: FontAwesomeIcons.plus,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  T20UI.spaceHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.spaceSize - 4,
                    ),
                    child: MainButton(
                      label: 'Adicionar link',
                      backgroundColor: palette.cardBackground,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: T20UI.spaceSize * 2),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Salvar',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    T20UI.spaceWidth,
                    SimpleCloseButton(
                      backgroundColor: palette.cardBackground,
                    )
                  ],
                ),
              ),
              T20UI.safeAreaBottom(context)
            ],
          )
        ],
      ),
    );
  }
}
