import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_empty_itens.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_magic_card.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';

class MenaceMagics extends StatelessWidget {
  const MenaceMagics(this.itens, {super.key});

  final List<MagicMenace> itens;

  @override
  Widget build(BuildContext context) {
    if (itens.isEmpty) {
      return const MenaceEmptyItens('Sem magias');
    }

    return AnimationConfiguration.synchronized(
      duration: T20UI.defaultDurationAnimation,
      child: FadeInAnimation(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...itens.map(MenaceMagicCard.new)],
        ),
      ),
    );
  }
}
