import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectorCheckable extends StatefulWidget {
  const SelectorCheckable({
    super.key,
    required this.label,
    required this.initialValue,
    required this.changeValue,
  });

  final String label;
  final bool initialValue;
  final Function(bool) changeValue;

  @override
  State<SelectorCheckable> createState() => _SelectorCheckableState();
}

class _SelectorCheckableState extends State<SelectorCheckable> {
  late final ValueNotifier<bool> _checked;
  void _setCheck() {
    _checked.value = !_checked.value;
    widget.changeValue(_checked.value);
  }

  @override
  void initState() {
    super.initState();
    _checked = ValueNotifier<bool>(widget.initialValue);
  }

  @override
  void dispose() {
    _checked.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: T20UI.inputHeight,
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: _setCheck,
          child: Padding(
            padding: T20UI.horizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.label),
                ValueListenableBuilder(
                  valueListenable: _checked,
                  builder: (_, checked, __) {
                    return CustomChecked(
                      value: checked,
                      isEnabledToTap: false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
