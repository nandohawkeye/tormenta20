import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_origin_bottomsheet/add_edit_origin_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';

class AddEditCharacterOriginsSelector extends StatelessWidget {
  const AddEditCharacterOriginsSelector({
    super.key,
    required this.store,
    required this.onAddDeleteList,
    required this.characterUuid,
  });

  final AddMultiStore<Origin> store;
  final Function(Origin) onAddDeleteList;
  final String characterUuid;

  @override
  Widget build(BuildContext context) {
    void onAdd(Origin? origin) async {
      await BottomsheetUtils.show<Origin?>(
        context: context,
        child: AddEditOriginBottomsheet(
          initialOrigin: origin,
          parentUuid: '',
        ),
      ).then(store.put);
    }

    return AddMultiField(
      label: 'Origens',
      store: store,
      onAdd: onAdd,
      onRemove: (value) {
        onAddDeleteList(value);
        store.remove(value);
      },
    );
  }
}
