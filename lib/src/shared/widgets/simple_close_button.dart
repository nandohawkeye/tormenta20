import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';

class SimpleCloseButton extends StatefulWidget {
  const SimpleCloseButton({
    super.key,
    this.backgroundColor,
    this.onTap,
    this.isObrigatory = false,
  });

  final Color? backgroundColor;
  final Function()? onTap;
  final bool isObrigatory;

  @override
  State<SimpleCloseButton> createState() => _SimpleCloseButtonState();
}

class _SimpleCloseButtonState extends State<SimpleCloseButton> {
  late final ConfigStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<ConfigStore>();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final isEnable = _store.config?.enableBottomBackButton ?? false;

        if (!isEnable && !widget.isObrigatory) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(left: T20UI.spaceSize),
          child: SizedBox(
            height: T20UI.inputHeight,
            width: T20UI.inputHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: T20UI.borderRadius,
                color: widget.backgroundColor ?? palette.backgroundLevelOne,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: T20UI.borderRadius,
                  splashColor: palette.accent.withValues(alpha: .4),
                  onTap: widget.onTap ?? () => Navigator.pop(context),
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: palette.icon,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
