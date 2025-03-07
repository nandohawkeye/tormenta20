import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditMenaceCreateExpertiseBottomsheetAtributeSelector
    extends StatelessWidget {
  const AddEditMenaceCreateExpertiseBottomsheetAtributeSelector(
    this.store, {
    super.key,
    this.onChange,
    this.bodyColor,
    this.cardColor,
  });

  final SelectorOnlyStore<Atribute> store;
  final Function(Atribute?)? onChange;
  final Color? bodyColor;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<Atribute>(
      label: 'Atributos',
      handleTitle: AtributeUtils.handleTitle,
      itens: Atribute.values,
      store: store,
      onChange: onChange,
      isObrigatory: true,
      bodyColor: bodyColor,
      cardColor: cardColor,
    );
  }
}
