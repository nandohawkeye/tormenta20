import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_color_field_item.dart';

class AddGrimorieBottomsheetColorField extends StatelessWidget {
  const AddGrimorieBottomsheetColorField({super.key, required this.colorInt});

  final ValueNotifier<int> colorInt;

  @override
  Widget build(BuildContext context) {
    final List<int> colors = [
      0xFFCC152A,
      0xFF76FF03,
      0xFF651FFF,
      0xFFFF5722,
      0xFF00B0FF,
      0xFFEC407A,
    ];
    return Padding(
      padding: T20UI.horizontalPadding,
      child: Card(
        color: palette.backgroundLevelTwo,
        child: Padding(
          padding: const EdgeInsets.only(
            top: T20UI.spaceSize / 2,
            bottom: T20UI.spaceSize - 4,
            left: T20UI.spaceSize - 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cor de destaque',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: T20UI.spaceSize - 4),
              ValueListenableBuilder(
                valueListenable: colorInt,
                builder: (_, colorSelected, __) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colors
                      .map(
                        (color) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: T20UI.spaceSize - 4),
                            child: AddGrimorieBottomsheetColorFieldItem(
                              colorInt: color,
                              colorSelected: colorSelected,
                              onSelectColor: (value) => colorInt.value = value,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
