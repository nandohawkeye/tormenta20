import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/botom_sheet_add_edit_board_charcter_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_file_image_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_token_card.dart';

class BottomSheetAddEditBoardCharacterTokens extends StatefulWidget {
  const BottomSheetAddEditBoardCharacterTokens(
      {super.key, required this.store});

  final BotomSheetAddEditBoardCharcterStore store;

  @override
  State<BottomSheetAddEditBoardCharacterTokens> createState() =>
      _BottomSheetAddEditBoardCharacterTokensState();
}

class _BottomSheetAddEditBoardCharacterTokensState
    extends State<BottomSheetAddEditBoardCharacterTokens> {
  late final ValueNotifier<String?> _filePath;
  void _setFilePath(String value) {
    _assetPath.value = null;
    widget.store.onChangeAssetPath(null);
    _filePath.value = value;
    widget.store.onChangeFilePath(value);
  }

  late final ValueNotifier<String?> _assetPath;
  void _setAssetPath(String value) {
    _filePath.value = null;
    widget.store.onChangeFilePath(null);
    _assetPath.value = value;
    widget.store.onChangeAssetPath(value);
  }

  @override
  void initState() {
    super.initState();
    _filePath = ValueNotifier<String?>(widget.store.filePath);
    _assetPath = ValueNotifier<String?>(widget.store.assetPath);
  }

  @override
  void dispose() {
    _filePath.dispose();
    _assetPath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Assets.tokens.values.map(
      (t) => t.path,
    );

    final legends = Assets.tokensLendas.values.map(
      (t) => t.path,
    );

    final List<String> allTokens = [...legends, ...tokens];

    return SizedBox(
      height: 95,
      width: double.infinity,
      child: AnimatedBuilder(
          animation: Listenable.merge([_filePath, _assetPath]),
          builder: (_, __) {
            final filePath = _filePath.value;
            final assetPath = _assetPath.value;

            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: T20UI.horizontalPadding,
              separatorBuilder: (_, __) => const SizedBox(width: 4),
              itemCount: allTokens.length + 1,
              itemBuilder: (_, index) {
                if (index == 0) {
                  return BottomSheetAddEditBoardCharacterFileImageSelector(
                    onSelectFile: _setFilePath,
                    filePath: filePath,
                  );
                }

                return BottomSheetAddEditBoardCharacterTokenCard(
                  assetPath: allTokens[index - 1],
                  selected: assetPath,
                  onTap: _setAssetPath,
                );
              },
            );
          }),
    );
  }
}
