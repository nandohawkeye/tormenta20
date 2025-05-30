import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';

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
  final int? initialValue;
  final int? initialMultiplier;
  final Function(String) onChangeValue;
  final Function(String) onChangeMultiplier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: AnimatedContainer(
            duration: T20UI.defaultDurationAnimation,
            decoration: BoxDecoration(
              color: palette.backgroundLevelOne,
              borderRadius: T20UI.borderRadius,
              border: Border.all(
                width: 2,
                color: hasError ? palette.accent : palette.backgroundLevelOne,
              ),
            ),
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
                          initialValue: initialValue?.toString(),
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
                          ),
                        ),
                      ),
                      const SizedBox(width: T20UI.smallSpaceSize),
                      Expanded(
                        child: TextFormField(
                          initialValue: initialMultiplier?.toString(),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        WarningWidget(
          isObrigatory: isObrigatory,
          hasError: hasError,
        )
      ],
    );
  }
}
