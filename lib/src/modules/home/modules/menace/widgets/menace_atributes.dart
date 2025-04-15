import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/atribute_item.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class MenaceAtributes extends StatelessWidget {
  const MenaceAtributes(this.menace, {super.key});

  final Menace menace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AtributeItem(
          value: menace.strength ?? 0,
          label: 'FOR',
        ),
        AtributeItem(
          value: menace.dexterity ?? 0,
          label: 'DES',
        ),
        AtributeItem(
          value: menace.constitution ?? 0,
          label: 'CON',
        ),
        AtributeItem(
          value: menace.intelligence ?? 0,
          label: 'INT',
        ),
        AtributeItem(
          value: menace.wisdom ?? 0,
          label: 'SAB',
        ),
        AtributeItem(
          value: menace.charisma ?? 0,
          label: 'CAR',
        ),
      ],
    );
  }
}
