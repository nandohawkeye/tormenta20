import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/services/divinities_service.dart';

class DivinityCard extends StatelessWidget {
  const DivinityCard(this.id, {super.key});

  final int? id;

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return const SizedBox.shrink();
    }

    final divinity =
        DivinitiesService().getDivinities().firstWhere((d) => d.id == id);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 30,
        width: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              divinity.assetPath,
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
