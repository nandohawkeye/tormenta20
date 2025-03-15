import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_empty_itens.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_card.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';

class MenaceEquipments extends StatelessWidget {
  const MenaceEquipments(this.itens, {super.key});

  final List<Equipment> itens;

  @override
  Widget build(BuildContext context) {
    if (itens.isEmpty) {
      return const MenaceEmptyItens('Sem equipamentos');
    }

    return AnimationConfiguration.synchronized(
      duration: T20UI.defaultDurationAnimation,
      child: FadeInAnimation(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...itens.map(MenaceEquipmentCard.new)],
        ),
      ),
    );
  }
}
