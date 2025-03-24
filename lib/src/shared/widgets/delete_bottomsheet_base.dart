import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/alert_bottomsheet.dart';

class DeleteBottomsheetBase extends StatelessWidget {
  const DeleteBottomsheetBase({
    super.key,
    required this.suffix,
    required this.mensage,
  });

  final String suffix;
  final String mensage;

  @override
  Widget build(BuildContext context) {
    return AlertBottomsheet(
      label: 'Deletar $suffix',
      mainButtonLabel: 'Sim, deletar',
      mensage: mensage,
      onTap: () => Navigator.pop(context, true),
    );
  }
}
