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
    this.textColor,
    this.icon,
    this.fontFamily = FontFamily.tormenta,
  });

  final String label;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: T20UI.borderRadius,
          color: backgroundColor ?? palette.selected,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            splashColor: palette.selected,
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: icon != null ? 10 : 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Icon(
                          icon,
                          size: 16,
                        ),
                      ),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
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
