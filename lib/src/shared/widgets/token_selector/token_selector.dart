import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/empty_token_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_file_image_selector.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card.dart';

class TokenSelector extends StatefulWidget {
  const TokenSelector({
    super.key,
    required this.size,
    required this.allTokens,
    required this.changeAsset,
    required this.changePath,
    this.initialImagePath,
    this.initalImageAsset,
    required this.isMenace,
    this.colorBase,
  });

  final double size;
  final List<String> allTokens;
  final Function(String?) changeAsset;
  final Function(String?) changePath;
  final String? initialImagePath;
  final String? initalImageAsset;
  final bool isMenace;
  final Color? colorBase;

  @override
  State<TokenSelector> createState() => _AddEditBoardPlayerTokensState();
}

class _AddEditBoardPlayerTokensState extends State<TokenSelector> {
  late final ValueNotifier<String?> _filePath;
  void _setFilePath(String value) {
    _assetPath.value = null;
    widget.changeAsset(null);
    _filePath.value = value;
    widget.changePath(value);
  }

  late final ValueNotifier<String?> _assetPath;
  void _setAssetPath(String value) {
    _filePath.value = null;
    widget.changePath(null);
    _assetPath.value = value;
    widget.changeAsset(value);
  }

  void _onEmpty() {
    _filePath.value = null;
    widget.changePath(null);
    _assetPath.value = null;
    widget.changeAsset(null);
  }

  @override
  void initState() {
    super.initState();
    _filePath = ValueNotifier<String?>(widget.initialImagePath);
    _assetPath = ValueNotifier<String?>(widget.initalImageAsset);
  }

  @override
  void dispose() {
    _filePath.dispose();
    _assetPath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size + 15,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: Listenable.merge([_filePath, _assetPath]),
        builder: (_, __) {
          final filePath = _filePath.value;
          final assetPath = _assetPath.value;
          final isEmpty = filePath == null && assetPath == null;

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: T20UI.horizontalPadding,
            itemCount: widget.allTokens.length + 2,
            itemExtent: widget.size + 10 + 4,
            itemBuilder: (_, index) {
              if (index == 0) {
                return EmptyTokenSelector(
                  isEmpty: isEmpty,
                  isMenace: widget.isMenace,
                  onEmpty: _onEmpty,
                  size: widget.size,
                  colorBase: widget.colorBase,
                );
              }

              if (index == 1) {
                return AddEditBoardPlayerFileImageSelector(
                  onSelectFile: _setFilePath,
                  filePath: filePath,
                  size: widget.size,
                  isMenace: widget.isMenace,
                  colorBase: widget.colorBase,
                );
              }

              return TokenCard(
                assetPath: widget.allTokens[index - 2],
                selected: assetPath,
                onTap: _setAssetPath,
                size: widget.size,
                isMenace: widget.isMenace,
              );
            },
          );
        },
      ),
    );
  }
}
