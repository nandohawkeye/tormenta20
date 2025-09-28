import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class _CreatureSizeStore extends SelectorOnlyStore<CreatureSizeCategory> {
  _CreatureSizeStore(super.initialValue);
}

class ChangeCreatureSizeBottomsheet extends StatefulWidget {
  const ChangeCreatureSizeBottomsheet({super.key, required this.initialSize});

  final CreatureSizeCategory initialSize;

  @override
  State<ChangeCreatureSizeBottomsheet> createState() =>
      _ChangeCreatureSizeBottomsheetState();
}

class _ChangeCreatureSizeBottomsheetState
    extends State<ChangeCreatureSizeBottomsheet> {
  late final SelectorOnlyStore<CreatureSizeCategory> _store;

  @override
  void initState() {
    super.initState();
    _store = _CreatureSizeStore(widget.initialSize);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.horizontalPadding,
            child: Text(
              'Selecione o tamanho',
              style: TextStyle(fontSize: 18, fontFamily: FontFamily.tormenta),
            ),
          ),
          T20UI.spaceHeight,
          SelectorOnlyField<CreatureSizeCategory>(
            label: 'Tamanho',
            handleTitle: CreatureSizeUtils.handleTitle,
            itens: CreatureSizeCategory.values,
            store: _store,
            isObrigatory: true,
          ),
          T20UI.spaceHeight,
          const DividerLevelTwo(verticalPadding: 0),
          Padding(
            padding: T20UI.allPadding,
            child: Row(
              children: [
                Expanded(
                  child: MainButton(
                    label: 'Salvar',
                    onTap: () {
                      Navigator.pop(context, _store.data);
                    },
                  ),
                ),
                const SimpleCloseButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
