import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/widgets/view_fields/view_fields.dart';

class MenaceExpertises extends StatelessWidget {
  const MenaceExpertises(this.menace, {super.key});

  final Menace menace;

  @override
  Widget build(BuildContext context) {
    if (menace.expertises.isEmpty) {
      return const SizedBox.shrink();
    }

    return ViewFields<Expertise>(
      label: 'Pericías',
      itens: menace.expertises,
      handleTitle: (value) => value,
    );
  }
}
