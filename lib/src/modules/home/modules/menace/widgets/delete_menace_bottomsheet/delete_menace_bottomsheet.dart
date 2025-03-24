import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/delete_bottomsheet_base.dart';

class DeleteMenaceBottomsheet extends StatelessWidget {
  const DeleteMenaceBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteBottomsheetBase(
      suffix: 'ameaça',
      mensage:
          'Deseja realmente deletar esta ameça? Ao fazer isso as sessões e combates das mesas associadas também serão impactados.',
    );
  }
}
