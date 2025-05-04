import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/animated_vertical_count_text.dart';

class IncrementDecremetInput extends StatefulWidget {
  const IncrementDecremetInput({
    super.key,
    this.label,
    this.initialValue,
    required this.onChangeValue,
  });

  final String? label;
  final int? initialValue;
  final Function(int) onChangeValue;

  @override
  State<IncrementDecremetInput> createState() => _IncrementDecremetInputState();
}

class _IncrementDecremetInputState extends State<IncrementDecremetInput> {
  late final ValueNotifier<int> _valueNotifier;
  void _increment() {
    _valueNotifier.value++;
    widget.onChangeValue(_valueNotifier.value);
  }

  void _decrement() {
    _valueNotifier.value--;
    widget.onChangeValue(_valueNotifier.value);
  }

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<int>(widget.initialValue ?? 0);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 6),
              child: Text(widget.label!),
            ),
          Card(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                child: Card(
                  child: InkWell(
                    borderRadius: T20UI.borderRadius,
                    onTap: _decrement,
                    child: const SizedBox(
                      height: T20UI.inputHeight,
                      width: T20UI.inputHeight,
                      child: Icon(FontAwesomeIcons.minus),
                    ),
                  ),
                ),
              ),
              RepaintBoundary(
                child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, value, __) {
                    return AnimatedVerticalCountText(value);
                  },
                ),
              ),
              RepaintBoundary(
                child: Card(
                  child: InkWell(
                    borderRadius: T20UI.borderRadius,
                    onTap: _increment,
                    child: const SizedBox(
                      height: T20UI.inputHeight,
                      width: T20UI.inputHeight,
                      child: Icon(FontAwesomeIcons.plus),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
