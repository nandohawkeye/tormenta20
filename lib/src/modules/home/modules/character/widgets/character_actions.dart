import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_action_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_empty_itens.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';

class CharacterActions extends StatelessWidget {
  const CharacterActions(this.actions, {super.key});

  final List<ActionEnt> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) {
      return const MenaceEmptyItens('Sem ações');
    }

    return AnimationConfiguration.synchronized(
      duration: T20UI.defaultDurationAnimation,
      child: FadeInAnimation(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...actions.map(CharacterActionCard.new)],
        ),
      ),
    );
  }
}
