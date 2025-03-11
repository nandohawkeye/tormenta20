import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/menace_card/menace_card_image.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/widgets/divinity_card.dart';

class MenaceHeaderImage extends StatelessWidget {
  const MenaceHeaderImage(this.menace, {super.key});

  final Menace menace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105 + 10,
      width: 105 + 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          MenaceCardImage(
            menace,
            size: 105,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: DivinityCard(menace.divinityId),
          )
        ],
      ),
    );
  }
}
