import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character/widgets/character_equipment_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_empty_itens.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';

class CharacterEquipments extends StatelessWidget {
  const CharacterEquipments(this.itens, {super.key});

  final List<Equipment> itens;

  @override
  Widget build(BuildContext context) {
    if (itens.isEmpty) {
      return const MenaceEmptyItens('Sem equipamentos');
    }

    print('itens: ${itens.length}');

    return AnimationConfiguration.synchronized(
      duration: T20UI.defaultDurationAnimation,
      child: FadeInAnimation(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...itens.map(CharacterEquipmentCard.new)],
        ),
      ),
    );
  }
}
