import 'package:flutter/material.dart';

abstract class PerformanceUtils {
  static int? cacheImageSizeCalculated(BuildContext context, double? size) {
    if (size == null) return null;

    return (size * MediaQuery.of(context).devicePixelRatio).toInt();
  }
}
