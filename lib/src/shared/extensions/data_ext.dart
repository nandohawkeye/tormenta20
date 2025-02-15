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

    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year ás $hourMinute';
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
}
