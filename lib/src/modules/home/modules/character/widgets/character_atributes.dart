import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_atribute_item.dart';
import 'package:tormenta20/src/shared/entities/character.dart';

class CharacterAtributes extends StatelessWidget {
  const CharacterAtributes(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenaceAtributeItem(
          value: character.strength ?? 0,
          label: 'FOR',
        ),
        MenaceAtributeItem(
          value: character.dexterity ?? 0,
          label: 'DES',
        ),
        MenaceAtributeItem(
          value: character.constitution ?? 0,
          label: 'CON',
        ),
        MenaceAtributeItem(
          value: character.intelligence ?? 0,
          label: 'INT',
        ),
        MenaceAtributeItem(
          value: character.wisdom ?? 0,
          label: 'SAB',
        ),
        MenaceAtributeItem(
          value: character.charisma ?? 0,
          label: 'CAR',
        ),
      ],
    );
  }
}
