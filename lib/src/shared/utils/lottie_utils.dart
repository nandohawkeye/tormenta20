// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:lottie/lottie.dart';

abstract class LottieUtils {
  static Future<LottieComposition?> lottieFormatDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhereOrNull(
          (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
    });
  }
}
