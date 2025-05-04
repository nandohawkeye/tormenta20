import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_utils.dart';
import 'package:tormenta20/src/shared/widgets/whatsapp_svg_icon.dart';

class BottomSheetBoardShortcutField extends StatefulWidget {
  const BottomSheetBoardShortcutField({
    super.key,
    required this.type,
    this.initialValue,
    this.helperText,
    required this.onChange,
  });

  final BoardShortcutsType type;
  final String? initialValue;
  final String? helperText;
  final Function(String?) onChange;

  @override
  State<BottomSheetBoardShortcutField> createState() =>
      _BottomSheetBoardShortcutFieldState();
}

class _BottomSheetBoardShortcutFieldState
    extends State<BottomSheetBoardShortcutField>
    with SingleTickerProviderStateMixin {
  late final ValueNotifier<String?> _url;
  void _setUrl(String? value) {
    _url.value = value;
    widget.onChange(value);
    if ((value ?? '').isEmpty) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _url = ValueNotifier<String?>(widget.initialValue);
    _controller = AnimationController(
      duration: T20UI.defaultDurationAnimation,
      vsync: this,
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: palette.textPrimary,
      end: palette.selected,
    ).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setUrl(widget.initialValue);
    });
  }

  @override
  void dispose() {
    _url.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: T20UI.horizontalPadding,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: _setUrl,
                    initialValue: widget.initialValue,
                    style: const TextStyle(fontSize: 16),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      labelText: BoardShortcutsUtils.handleLabel(widget.type),
                      fillColor: palette.backgroundLevelOne,
                      suffixIcon: ListenableBuilder(
                        listenable: Listenable.merge([_url, _animation]),
                        builder: (_, __) {
                          return widget.type == BoardShortcutsType.whats
                              ? WhatsappSvgIcon(
                                  color:
                                      _animation.value ?? palette.textPrimary,
                                )
                              : Icon(
                                  BoardShortcutsUtils.handleIcon(
                                      widget.type, _url.value ?? ''),
                                  size: T20UI.iconSize,
                                  color: _animation.value,
                                );
                        },
                      ),
                      helperText: widget.helperText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
