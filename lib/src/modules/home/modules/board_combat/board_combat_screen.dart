// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_combat/board_combat_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_combat_bottomsheet/valid_create_close_combat_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardCombatScreen extends StatefulWidget {
  const BoardCombatScreen({super.key, required this.combat});

  final BoardCombat combat;

  @override
  State<BoardCombatScreen> createState() => _BoardCombatScreenState();
}

class _BoardCombatScreenState extends State<BoardCombatScreen> {
  late final BoardCombatStore _store;

  @override
  void initState() {
    super.initState();
    _store = BoardCombatStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Labels('Combate atual'),
              ),
              T20UI.spaceHeight,
            ],
          ),
          const Divider(),
          const Expanded(child: SizedBox()),
          const Divider(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColoredBox(
              color: palette.background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: T20UI.spaceSize,
                      left: T20UI.spaceSize,
                      right: T20UI.spaceSize,
                      bottom: MediaQuery.of(context).padding.bottom +
                          T20UI.spaceSize,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MainButton(
                            label: 'Encerrar combate',
                            onTap: () async {
                              await BottomsheetUtils.show<bool?>(
                                context: context,
                                child: const ValidCreateCloseCombatBottomsheet(
                                  hasInited: true,
                                ),
                              ).then((result) async {
                                if (result != null && result) {
                                  final currentCombat = widget.combat
                                      .copyWith(endAt: DateTime.now());
                                  await _store.saveCombat(currentCombat);
                                  Navigator.pop(context);
                                }
                              });
                            },
                          ),
                        ),
                        const SimpleCloseButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
