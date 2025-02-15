extension DurationExt on Duration {
  String toFormattedStringWithHours() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final twoDigitHours = hours.toString().padLeft(2, '0');
    final twoDigitMinutes = minutes.toString().padLeft(2, '0');
    final twoDigitSeconds = seconds.toString().padLeft(2, '0');
    return '${twoDigitHours}Hs : ${twoDigitMinutes}Min : ${twoDigitSeconds}s';
  }
}
