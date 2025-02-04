import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/shared/utils/lottie_utils.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, this.size = 90});

  final double size;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      height: widget.size,
      width: widget.size,
      Assets.lottie.loading,
      controller: _controller,
      repeat: true,
      fit: BoxFit.cover,
      decoder: LottieUtils.lottieFormatDecoder,
    );
  }
}
