import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/board/session_environment.dart';
import 'package:tormenta20/src/shared/utils/session_environment_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class EditSessionEnvironmentSelector extends StatelessWidget {
  const EditSessionEnvironmentSelector(
    this.store, {
    super.key,
    this.onChange,
    this.bodyColor,
    this.cardColor,
  });

  final SelectorOnlyStore<SessionEnvironment> store;
  final Function(SessionEnvironment?)? onChange;
  final Color? bodyColor;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<SessionEnvironment>(
      label: 'Terrenos',
      handleTitle: SessionEnvironmentUtils.handleTitle,
      itens: SessionEnvironment.values,
      store: store,
      onChange: onChange,
      isObrigatory: true,
      bodyColor: bodyColor,
      cardColor: cardColor,
    );
  }
}
