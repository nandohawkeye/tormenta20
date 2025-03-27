import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class ImageFadeSlide extends StatefulWidget {
  const ImageFadeSlide(
      {super.key, required this.imageAssets, this.imageSize = 60});

  final List<String> imageAssets;
  final double imageSize;

  @override
  State<ImageFadeSlide> createState() => _ImageFadeSlideState();
}

class _ImageFadeSlideState extends State<ImageFadeSlide> {
  late String _image;

  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.imageAssets.shuffle();
    _image = widget.imageAssets.first;
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      widget.imageAssets.shuffle();
      setState(() {
        _image = widget.imageAssets.first;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: T20UI.defaultDurationAnimation,
      child: Image.asset(
        key: Key(_image),
        height: widget.imageSize,
        width: widget.imageSize,
        _image,
      ),
    );
  }
}
