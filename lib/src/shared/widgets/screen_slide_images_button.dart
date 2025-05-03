import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class ScreenSlideImagesButton extends StatefulWidget {
  const ScreenSlideImagesButton({
    super.key,
    required this.imageAssets,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.imageSize = 60,
    this.titleSize = 18,
    this.subtitleSize = 14,
  });

  final List<String> imageAssets;
  final String title;
  final String subtitle;
  final Function() onTap;
  final double imageSize;
  final double titleSize;
  final double subtitleSize;

  @override
  State<ScreenSlideImagesButton> createState() =>
      _ScreenSlideImagesButtonState();
}

class _ScreenSlideImagesButtonState extends State<ScreenSlideImagesButton> {
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: widget.onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: T20UI.borderRadius,
            color: palette.cardBackground,
          ),
          child: Padding(
            padding: T20UI.allPadding,
            child: Row(
              children: [
                AnimatedSwitcher(
                  duration: T20UI.defaultDurationAnimation,
                  child: Image.asset(
                    key: Key(_image),
                    height: widget.imageSize,
                    width: widget.imageSize,
                    cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                        context, widget.imageSize),
                    cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                        context, widget.imageSize),
                    _image,
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: palette.accent,
                          fontFamily: FontFamily.tormenta,
                          fontSize: widget.titleSize,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.subtitle,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: widget.subtitleSize,
                          color: palette.textSecundary,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
