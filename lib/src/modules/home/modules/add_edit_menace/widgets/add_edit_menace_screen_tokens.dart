import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_file_image_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_token_card.dart';

class AddEditMenaceScreenTokens extends StatefulWidget {
  const AddEditMenaceScreenTokens({
    super.key,
    required this.controller,
    required this.size,
  });

  final AddEditMenaceController controller;
  final double size;

  @override
  State<AddEditMenaceScreenTokens> createState() =>
      _AddEditBoardPlayerTokensState();
}

class _AddEditBoardPlayerTokensState extends State<AddEditMenaceScreenTokens> {
  late final ValueNotifier<String?> _filePath;
  void _setFilePath(String value) {
    _assetPath.value = null;
    widget.controller.changeAsset(null);
    _filePath.value = value;
    widget.controller.changePath(value);
  }

  late final ValueNotifier<String?> _assetPath;
  void _setAssetPath(String value) {
    _filePath.value = null;
    widget.controller.changePath(null);
    _assetPath.value = value;
    widget.controller.changeAsset(value);
  }

  @override
  void initState() {
    super.initState();
    _filePath = ValueNotifier<String?>(widget.controller.imagePath);
    _assetPath = ValueNotifier<String?>(widget.controller.imageAsset);
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

    final List<String> allTokens = [...tokens];

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
                  return AddEditBoardPlayerFileImageSelector(
                    onSelectFile: _setFilePath,
                    filePath: filePath,
                    size: widget.size,
                    isMenace: true,
                  );
                }

                return AddEditBoardPlayerTokenCard(
                  assetPath: allTokens[index - 1],
                  selected: assetPath,
                  onTap: _setAssetPath,
                  size: widget.size,
                  isMenace: true,
                );
              },
            );
          }),
    );
  }
}
