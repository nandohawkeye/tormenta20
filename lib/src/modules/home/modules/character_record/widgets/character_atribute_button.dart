import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/atribute_item.dart';

class CharacterAtributeButton extends StatelessWidget {
  const CharacterAtributeButton({
    super.key,
    required this.value,
    required this.label,
  });

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Card(
        color: palette.backgroundLevelOne,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AtributeItem(value: value, label: label, fontSize: 20),
        ),
      ),
    );
  }
}
