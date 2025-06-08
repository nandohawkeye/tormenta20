// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectGrimorieScreenCard extends StatelessWidget {
  const SelectGrimorieScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: T20UI.inputHeight,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                left: T20UI.smallSpaceSize,
                right: T20UI.spaceSize,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      T20UI.smallSpaceWidth,
                      SvgPicture.asset(
                        Assets.icons.book.path,
                        height: 20,
                        width: 20,
                        color: palette.icon,
                      ),
                      T20UI.smallSpaceWidth,
                      const Text('Grimório', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const CustomChecked(value: true, isEnabledToTap: false),
                ],
              ),
            ),
          ),
        ),
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
