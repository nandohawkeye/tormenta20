import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditCriticalField extends StatelessWidget {
  const AddEditCriticalField({
    super.key,
    this.initialValue,
    required this.onChangeValue,
    this.initialMultiplier,
    required this.onChangeMultiplier,
  });

  final String? initialValue;
  final String? initialMultiplier;
  final Function(String) onChangeValue;
  final Function(String) onChangeMultiplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.backgroundLevelOne,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: T20UI.spaceSize,
              top: T20UI.spaceSize / 2,
              bottom: T20UI.spaceSize / 2,
            ),
            child: Text('Crítico'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: T20UI.spaceSize / 2,
                right: T20UI.spaceSize / 2,
                bottom: T20UI.spaceSize / 2),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: initialValue,
                    onChanged: onChangeValue,
                    style: const TextStyle(fontSize: 16),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      fillColor: palette.backgroundLevelTwo,
                      helperStyle: TextStyle(color: palette.textDisable),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: T20UI.spaceSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: T20UI.spaceSize / 2),
                Expanded(
                  child: TextFormField(
                    initialValue: initialMultiplier,
                    onChanged: onChangeMultiplier,
                    style: const TextStyle(fontSize: 16),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Multiplicador',
                      prefix: const Text('x', style: TextStyle(fontSize: 16)),
                      fillColor: palette.backgroundLevelTwo,
                      helperStyle: TextStyle(color: palette.textDisable),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: T20UI.spaceSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
