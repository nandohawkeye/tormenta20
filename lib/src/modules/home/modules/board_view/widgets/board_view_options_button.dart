// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_options_bottomsheet/board_view_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/confirm_delete_board_bottomsheet.dart/confirm_delete_board_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class BoardViewOptionsButton extends StatefulWidget {
  const BoardViewOptionsButton(this.board, {super.key});

  final Board board;

  @override
  State<BoardViewOptionsButton> createState() => _BoardViewOptionsButtonState();
}

class _BoardViewOptionsButtonState extends State<BoardViewOptionsButton> {
  late final ValueNotifier<bool> _started;

  @override
  void initState() {
    super.initState();
    _started = ValueNotifier<bool>(false);
    _start();
  }

  @override
  void dispose() {
    _started.dispose();
    super.dispose();
  }

  void _start() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(T20UI.defaultDurationAnimation)
          .then((_) => _started.value = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _started,
      builder: (_, started, __) => AnimatedPositioned(
        duration: T20UI.defaultDurationAnimation,
        top: kTextTabBarHeight,
        right: started ? T20UI.spaceSize : -50,
        child: SizedBox(
          height: T20UI.inputHeight,
          width: T20UI.inputHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: T20UI.borderRadius,
              color: palette.backgroundLevelTwo,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: T20UI.borderRadius,
                splashColor: palette.accent.withValues(alpha: .4),
                onTap: () async {
                  BottomsheetUtils.show<BordViewOptionType?>(
                    context: context,
                    child: const BoardViewOptionsBottomsheet(),
                  ).then((result) async {
                    if (result == BordViewOptionType.edit) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              AddEditBoardScreen(initialBoard: widget.board),
                        ),
                      );
                    }

                    if (result == BordViewOptionType.delete) {
                      await BottomsheetUtils.show<bool?>(
                        context: context,
                        child: const ConfirmDeleteBoardBottomsheet(),
                      ).then((result) async {
                        if (result != null) {
                          await GetIt.I<AppDatabase>()
                              .boardDAO
                              .deleteBoard(widget.board)
                              .then((failure) {
                            if (failure == null) {
                              Navigator.pop(context);
                            }
                          });
                        }
                      });
                    }

                    if (result == BordViewOptionType.material) {
                      await Share.shareXFiles([
                        ...widget.board.materials.map((m) => XFile(m.path)),
                        if (widget.board.bannerPath != null)
                          XFile(widget.board.bannerPath!)
                      ]);
                    }
                  });
                },
                child: Icon(FontAwesomeIcons.bars, color: palette.icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
