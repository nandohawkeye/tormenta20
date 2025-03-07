extension DataExt on DateTime {
  String get formatted {
    final String hourMinute =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    if (isToday()) {
      return 'Hoje ás $hourMinute';
    }

    if (isYesterday()) {
      return 'Ontem ás $hourMinute';
    }

    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${resumedYear(year)} ás $hourMinute';
  }

  bool isToday() {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool isYesterday() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    return day == yesterday.day &&
        month == yesterday.month &&
        year == yesterday.year;
  }

  String get formattedHourAndMinute =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  String resumedYear(int year) => '${year.toString()[2]}${year.toString()[3]}';

  bool isTheSameDay(DateTime? other) =>
      day == other?.day && month == other?.month && year == other?.year;
}
