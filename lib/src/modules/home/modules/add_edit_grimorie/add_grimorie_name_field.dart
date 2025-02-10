import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddGrimorieBottomsheetNameField extends StatelessWidget {
  const AddGrimorieBottomsheetNameField({
    super.key,
    required this.validator,
    required this.formKey,
    required this.name,
    required this.errorName,
  });

  final String? Function(String?) validator;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<String?> name;
  final ValueNotifier<String?> errorName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: T20UI.horizontalPadding,
        child: ValueListenableBuilder(
          valueListenable: errorName,
          builder: (_, error, __) => TextFormField(
            onChanged: (value) {
              name.value = value;
              errorName.value = validator(value);
            },
            initialValue: name.value,
            validator: validator,
            style: const TextStyle(fontSize: 16),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: 'Nome',
              errorText: error,
              fillColor: palette.backgroundLevelOne,
              hintStyle: TextStyle(fontSize: 16, color: palette.textPrimary),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: T20UI.spaceSize,
              ),
              helperText: 'obrigatório',
              helperStyle: TextStyle(
                color: palette.textDisable,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
