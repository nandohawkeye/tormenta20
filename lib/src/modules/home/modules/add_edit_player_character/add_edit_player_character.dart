import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_controller.dart';
import 'package:tormenta20/src/shared/widgets/initiative_textfield.dart';
import 'package:tormenta20/src/shared/widgets/mana_textfield.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_classes_selector.dart';
import 'package:tormenta20/src/shared/widgets/defense_textfield.dart';
import 'package:tormenta20/src/shared/widgets/life_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_character_textfield.dart';
import 'package:tormenta20/src/shared/widgets/player_name_textfield.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_selector.dart';

class AddEditBoardPlayerCharacter extends StatefulWidget {
  const AddEditBoardPlayerCharacter({
    super.key,
    this.character,
    required this.boardUuid,
  });

  final BoardPlayer? character;
  final String boardUuid;

  @override
  State<AddEditBoardPlayerCharacter> createState() =>
      _AddEditBoardPlayerCharacterState();
}

class _AddEditBoardPlayerCharacterState
    extends State<AddEditBoardPlayerCharacter> {
  final _formKey = GlobalKey<FormState>();

  late final AddEditBoardPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEditBoardPlayerController(
      widget.character,
      widget.boardUuid,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Jogador / Personagem',
      onSave: () {
        if (_formKey.currentState!.validate()) {
          final result = _controller.onSave();
          if (result != null) {
            Navigator.pop(context, result);
          }
        }
      },
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          TokenSelector(
            allTokens: [
              ...Assets.tokensLendas.values.map((t) => t.path),
              ...Assets.tokens.values.map((t) => t.path)
            ],
            isMenace: false,
            changeAsset: _controller.onChangeAssetPath,
            changePath: _controller.onChangeFilePath,
            initalImageAsset: _controller.assetPath,
            initialImagePath: _controller.filePath,
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
                  padding: T20UI.horizontallScreenPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: PlayerNameTextField(
                          onchange: _controller.onChangePlayer,
                          initialTitle: _controller.player,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: NamecharacterTextField(
                          onchange: _controller.onChangeCharacter,
                          initialTitle: _controller.name,
                        ),
                      ),
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontallScreenPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: LifeTextField(
                          onchange: _controller.onChangeLife,
                          initialLife: _controller.life,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: ManaTextField(
                          onchange: _controller.onChangeMana,
                          initialMana: _controller.mana,
                        ),
                      ),
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontallScreenPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: InitiativeTextfield(
                          onchange: _controller.onChangeInitiative,
                          initialInitiative: _controller.initiative,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: DefenseTextField(
                          onchange: _controller.onChangeDefense,
                          initialDefense: _controller.defense,
                        ),
                      ),
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                AddEditBoardPlayerBroodSelector(
                  _controller.broodStore,
                ),
                T20UI.spaceHeight,
                AddEditBoardPlayerClassesSelector(
                  _controller.classesStore,
                  onTap: _controller.onAddClasse,
                ),
                T20UI.spaceHeight,
              ],
            ),
          )
        ],
      ),
    );
  }
}
