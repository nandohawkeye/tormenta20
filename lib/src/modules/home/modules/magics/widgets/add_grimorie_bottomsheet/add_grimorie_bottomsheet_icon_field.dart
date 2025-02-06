import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet_icon_field_item.dart';

class AddGrimorieBottomsheetIconField extends StatelessWidget {
  const AddGrimorieBottomsheetIconField({super.key, required this.iconAsset});

  final ValueNotifier<String> iconAsset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: palette.backgroundLevelTwo,
          child: Padding(
            padding: const EdgeInsets.only(
              top: T20UI.spaceSize / 2,
              bottom: T20UI.spaceSize - 4,
              left: T20UI.spaceSize - 4,
              right: T20UI.spaceSize - 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Icone',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: T20UI.spaceSize - 4),
                Center(
                  child: ValueListenableBuilder(
                    valueListenable: iconAsset,
                    builder: (_, assetSelected, __) => Wrap(
                      spacing: T20UI.spaceSize - 2,
                      runSpacing: T20UI.spaceSize - 2,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: Assets.icons.values
                          .map(
                            (asset) => AddGrimorieBottomsheetIconFieldItem(
                              asset: asset,
                              assetSelected: assetSelected,
                              onSelectedAsset: (value) =>
                                  iconAsset.value = value,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
