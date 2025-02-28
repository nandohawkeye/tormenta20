import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_icon_field_item.dart';

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
          color: palette.backgroundLevelOne,
          child: Padding(
            padding: const EdgeInsets.only(
              top: T20UI.smallSpaceSize,
              bottom: T20UI.screenContentSpaceSize,
              left: T20UI.screenContentSpaceSize,
              right: T20UI.screenContentSpaceSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Icone',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: T20UI.screenContentSpaceSize,
                ),
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
