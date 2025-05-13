import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';

class CharacterRecordScreen extends StatelessWidget {
  const CharacterRecordScreen({super.key, required this.character});

  final CharacterBoard character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ficha completa')),
    );
  }
}
