import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_warning.dart';

class AddEditCriticalField extends StatelessWidget {
  const AddEditCriticalField({
    super.key,
    this.initialValue,
    required this.onChangeValue,
    this.initialMultiplier,
    this.hasError = false,
    this.isObrigatory = false,
    required this.onChangeMultiplier,
  });

  final bool isObrigatory;
  final bool hasError;
  final String? initialValue;
  final String? initialMultiplier;
  final Function(String) onChangeValue;
  final Function(String) onChangeMultiplier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: palette.backgroundLevelOne,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: T20UI.screenContentSpaceSize,
                  top: T20UI.smallSpaceSize,
                  bottom: T20UI.smallSpaceSize,
                ),
                child: Text('Crítico'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: T20UI.smallSpaceSize,
                  right: T20UI.smallSpaceSize,
                  bottom: T20UI.smallSpaceSize,
                ),
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
                    const SizedBox(width: T20UI.smallSpaceSize),
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
                          prefix:
                              const Text('x', style: TextStyle(fontSize: 16)),
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
        ),
        SelectorWarning(
          isObrigatory: isObrigatory,
          hasError: hasError,
        )
      ],
    );
  }
}
