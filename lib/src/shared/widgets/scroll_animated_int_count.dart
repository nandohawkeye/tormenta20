import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class ScrollAnimatedIntCount extends StatefulWidget {
  const ScrollAnimatedIntCount({
    super.key,
    required this.count,
    required this.width,
    required this.height,
    this.textStyle,
  });

  final int count;
  final double width;
  final double height;
  final TextStyle? textStyle;

  @override
  State<ScrollAnimatedIntCount> createState() => _ScrollAnimatedIntCountState();
}

class _ScrollAnimatedIntCountState extends State<ScrollAnimatedIntCount> {
  List<FixedExtentScrollController> _controllers = [];
  bool _isNegative = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _isNegative = widget.count.isNegative;
    _controllers = List.generate(
      widget.count.abs().toString().length,
      (index) => FixedExtentScrollController(
          initialItem: int.parse(widget.count.abs().toString()[index])),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ScrollAnimatedIntCount oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _updateControllers();
    }
  }

  void _updateControllers() {
    _isNegative = widget.count.isNegative;
    String countStr = widget.count.abs().toString();

    if (_controllers.length < countStr.length) {
      _initializeControllers();
    }

    for (int i = 0; i < countStr.length; i++) {
      int newValue = int.parse(countStr[i]);
      _controllers[i].animateToItem(
        newValue,
        duration: T20UI.defaultDurationAnimation,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String countStr = widget.count.abs().toString();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isNegative)
            SizedBox(
              width: widget.width,
              height: widget.height,
              child: Center(
                child: Text(
                  '-',
                  style: widget.textStyle,
                ),
              ),
            ),
          ...List.generate(countStr.length, (index) {
            return SizedBox(
              width: widget.width,
              height: widget.height,
              child: ListWheelScrollView.useDelegate(
                controller: _controllers[index],
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
                        style: widget.textStyle,
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
