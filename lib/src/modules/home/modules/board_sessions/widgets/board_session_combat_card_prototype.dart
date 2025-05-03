import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';

class BoardSessionCombatCardPrototype extends StatelessWidget {
  const BoardSessionCombatCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: T20UI.borderRadius,
              side: BorderSide(color: palette.backgroundLevelTwo)),
          color: palette.backgroundLevelOne,
          child: Padding(
            padding: T20UI.allPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duração: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.tormenta,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${1}º turno',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.tormenta,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                Row(
                  children: [
                    Text(
                      DateTime.now().formatted,
                      style:
                          TextStyle(fontSize: 12, color: palette.textSecundary),
                    ),
                    Text(
                      ' até ${DateTime.now().formattedHourAndMinute}',
                      style:
                          TextStyle(fontSize: 12, color: palette.textSecundary),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
