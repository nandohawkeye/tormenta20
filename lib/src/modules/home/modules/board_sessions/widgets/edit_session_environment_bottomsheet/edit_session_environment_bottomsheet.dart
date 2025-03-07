import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/edit_session_environment_bottomsheet/edit_session_environment_selector.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/edit_session_environment_bottomsheet/edit_session_environment_store.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class EditSessionEnvironmentBottomsheet extends StatefulWidget {
  const EditSessionEnvironmentBottomsheet({
    super.key,
    required this.session,
  });

  final BoardSession session;

  @override
  State<EditSessionEnvironmentBottomsheet> createState() =>
      _AddEditSelectedExpertiseBottomsheetState();
}

class _AddEditSelectedExpertiseBottomsheetState
    extends State<EditSessionEnvironmentBottomsheet> {
  late final EditSessionEnvironmentStore _store;

  @override
  void initState() {
    super.initState();
    _store = EditSessionEnvironmentStore(widget.session.environment);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Padding(
        padding: T20UI.allPaddingWithPaddingBottom(context),
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: palette.backgroundLevelOne,
                borderRadius: T20UI.borderRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: Text(
                        'Selecione o terreno',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontFamily.tormenta,
                        ),
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                const DividerLevelTwo(verticalPadding: 0),
                T20UI.spaceHeight,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EditSessionEnvironmentSelector(
                      _store,
                      cardColor: palette.backgroundLevelThree,
                      bodyColor: palette.backgroundLevelTwo,
                    ),
                    T20UI.spaceHeight,
                  ],
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
                              label: 'Confirmar',
                              onTap: () {
                                final result = _store.data;

                                Navigator.pop(context, result);
                              },
                            ),
                          ),
                          T20UI.spaceWidth,
                          SimpleCloseButton(
                            backgroundColor: palette.backgroundLevelTwo,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
