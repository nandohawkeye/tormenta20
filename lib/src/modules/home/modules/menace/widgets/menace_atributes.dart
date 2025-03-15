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
          value: menace.strength ?? 0,
          label: 'FOR',
        ),
        MenaceAtributeItem(
          value: menace.dexterity ?? 0,
          label: 'DES',
        ),
        MenaceAtributeItem(
          value: menace.constitution ?? 0,
          label: 'CON',
        ),
        MenaceAtributeItem(
          value: menace.intelligence ?? 0,
          label: 'INT',
        ),
        MenaceAtributeItem(
          value: menace.wisdom ?? 0,
          label: 'SAB',
        ),
        MenaceAtributeItem(
          value: menace.charisma ?? 0,
          label: 'CAR',
        ),
      ],
    );
  }
}
