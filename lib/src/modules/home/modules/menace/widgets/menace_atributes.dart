import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_atribute_item.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class MenaceAtributes extends StatelessWidget {
  const MenaceAtributes(this.menace, {super.key});

  final Menace menace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenaceAtributeItem(
          value: menace.strength,
          label: 'FOR',
        ),
        MenaceAtributeItem(
          value: menace.dexterity,
          label: 'DES',
        ),
        MenaceAtributeItem(
          value: menace.constitution,
          label: 'CON',
        ),
        MenaceAtributeItem(
          value: menace.intelligence,
          label: 'INT',
        ),
        MenaceAtributeItem(
          value: menace.wisdom,
          label: 'SAB',
        ),
        MenaceAtributeItem(
          value: menace.charisma,
          label: 'CAR',
        ),
      ],
    );
  }
}
