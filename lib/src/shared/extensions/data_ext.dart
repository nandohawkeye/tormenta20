extension DataExt on DateTime {
  String get toLabel =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year ás ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
