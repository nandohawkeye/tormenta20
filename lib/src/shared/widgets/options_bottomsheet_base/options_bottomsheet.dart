import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_card.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class OptionsBottomsheet<TOutput> extends StatelessWidget {
  const OptionsBottomsheet({super.key, required this.itens});

  final List<OptionsBottomsheetEntity<TOutput>> itens;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          for (var item in itens)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: OptionsBottomsheetCard<TOutput>(item: item),
                ),
                T20UI.spaceHeight,
              ],
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DividerLevelTwo(verticalPadding: 0),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        label: 'Voltar',
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

enum MenaceOption { edit, clone, export, delete }
