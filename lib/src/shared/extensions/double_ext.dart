extension DoubleExt on double {
  String get reduceFormatted =>
      (this % 1 == 0) ? toInt().toString() : toString();
}
