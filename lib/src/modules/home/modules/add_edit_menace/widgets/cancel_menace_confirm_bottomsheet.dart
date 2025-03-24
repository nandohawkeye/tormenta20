import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/alert_bottomsheet.dart';

class CancelMenaceConfirmBottomsheet extends StatelessWidget {
  const CancelMenaceConfirmBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertBottomsheet(
      label: 'Fechar ameaça',
      mainButtonLabel: 'Sim, voltar',
      mensage:
          'Deseja realmente voltar? Se você voltar irá perder todo o seu progresso atual...',
      onTap: () => Navigator.pop(context, true),
    );
  }
}
