extension DurationExt on Duration {
  String toFormattedString() {
    final minutes = inMinutes;
    final seconds = inSeconds.remainder(60);
    final twoDigitSeconds = seconds.toString().padLeft(2, '0');
    return '$minutes:$twoDigitSeconds';
  }

  String toFormattedStringWithHours() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final twoDigitHours = hours.toString().padLeft(2, '0');
    final twoDigitMinutes = minutes.toString().padLeft(2, '0');
    final twoDigitSeconds = seconds.toString().padLeft(2, '0');
    return '${twoDigitHours}Hs : ${twoDigitMinutes}Min : ${twoDigitSeconds}s';
  }

  String get formatted => toString().split('.').first.padLeft(8, "0");
}
