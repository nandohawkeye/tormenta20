import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.foreground,
    this.icon,
    this.isEnable = true,
    this.fontFamily = FontFamily.tormenta,
  });

  final String label;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? foreground;
  final IconData? icon;
  final String? fontFamily;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: T20UI.borderRadius,
            color: (backgroundColor ?? palette.selected).withValues(
              alpha: isEnable ? 1 : 0.3,
            )),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            splashColor: palette.selected,
            onTap: isEnable ? onTap : null,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: icon != null ? 10 : 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          icon,
                          color: isEnable ? foreground : palette.textDisable,
                          size: 16,
                        ),
                      ),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        color: isEnable ? foreground : palette.textDisable,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
