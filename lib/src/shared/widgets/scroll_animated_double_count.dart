import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class ScrollAnimatedDoubleCount extends StatefulWidget {
  const ScrollAnimatedDoubleCount({super.key, required this.count});

  final double count;

  @override
  State<ScrollAnimatedDoubleCount> createState() =>
      _ScrollAnimatedCaractersState();
}

class _ScrollAnimatedCaractersState extends State<ScrollAnimatedDoubleCount> {
  List<FixedExtentScrollController> _intControllers = [];
  List<FixedExtentScrollController> _decimalControllers = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    String countStr = widget.count.toStringAsFixed(2);
    List<String> parts = countStr.split(".");

    _intControllers = List.generate(
      parts[0].length,
      (index) =>
          FixedExtentScrollController(initialItem: int.parse(parts[0][index])),
    );

    _decimalControllers = List.generate(
      parts[1].length,
      (index) =>
          FixedExtentScrollController(initialItem: int.parse(parts[1][index])),
    );
  }

  @override
  void dispose() {
    for (var controller in _intControllers) {
      controller.dispose();
    }

    for (var controller in _decimalControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ScrollAnimatedDoubleCount oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _updateControllers();
    }
  }

  void _updateControllers() {
    String countStr = widget.count.toStringAsFixed(2);
    List<String> parts = countStr.split(".");

    if (_intControllers.length < parts[0].length ||
        _decimalControllers.length < parts[1].length) {
      _initializeControllers();
    }

    for (int i = 0; i < parts[0].length; i++) {
      int newValue = int.parse(parts[0][i]);
      _intControllers[i].animateToItem(
        newValue,
        duration: T20UI.defaultDurationAnimation,
        curve: Curves.easeOut,
      );
    }

    for (int i = 0; i < parts[1].length; i++) {
      int newValue = int.parse(parts[1][i]);
      _decimalControllers[i].animateToItem(
        newValue,
        duration: T20UI.defaultDurationAnimation,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String countStr = widget.count.toStringAsFixed(2);
    List<String> parts = countStr.split(".");

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < parts[0].length; i++)
            SizedBox(
              width: 40,
              height: 60,
              child: ListWheelScrollView.useDelegate(
                controller: _intControllers[i],
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: 60,
                perspective: 0.002,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List.generate(
                    10,
                    (digit) => Center(
                      child: Text(
                        digit.toString(),
                        key: ValueKey<int>(digit),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const Text(
            ".",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < parts[1].length; i++)
            SizedBox(
              width: 40,
              height: 60,
              child: ListWheelScrollView.useDelegate(
                controller: _decimalControllers[i],
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 60,
                perspective: 0.002,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List.generate(
                    10,
                    (digit) => Center(
                      child: Text(
                        digit.toString(),
                        key: ValueKey<int>(digit),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
