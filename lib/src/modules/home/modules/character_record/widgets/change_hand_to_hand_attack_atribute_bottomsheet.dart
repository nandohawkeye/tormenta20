import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class _AddEditAtributeStore extends SelectorOnlyStore<Atribute> {
  _AddEditAtributeStore(super.initialValue);
}

class ChangeHandToHandAttackAtributeBottomsheet extends StatefulWidget {
  const ChangeHandToHandAttackAtributeBottomsheet({
    super.key,
    required this.atribute,
  });

  final Atribute atribute;

  @override
  State<ChangeHandToHandAttackAtributeBottomsheet> createState() =>
      _ChangeHandToHandAttackAtributeBottomsheetState();
}

class _ChangeHandToHandAttackAtributeBottomsheetState
    extends State<ChangeHandToHandAttackAtributeBottomsheet> {
  late final _AddEditAtributeStore _atributeStore;

  @override
  void initState() {
    super.initState();

    _atributeStore = _AddEditAtributeStore(widget.atribute);
  }

  @override
  void dispose() {
    _atributeStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    'Ataque corpo-a-corpo',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.tormenta,
                    ),
                  ),
                ),
                T20UI.spaceHeight,
              ],
            ),
          ),
          SelectorOnlyField<Atribute>(
            label: 'Atributo',
            handleTitle: AtributeUtils.handleTitle,
            itens: Atribute.values,
            store: _atributeStore,
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
                      print('${_atributeStore.data}');
                      Navigator.pop(context, _atributeStore.data);
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
