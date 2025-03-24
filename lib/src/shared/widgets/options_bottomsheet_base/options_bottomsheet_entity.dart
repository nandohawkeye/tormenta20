import 'package:flutter/widgets.dart';

class OptionsBottomsheetEntity<TOutput> {
  final String label;
  final String mensage;
  final IconData icon;
  final TOutput type;

  OptionsBottomsheetEntity({
    required this.label,
    required this.mensage,
    required this.icon,
    required this.type,
  });

  @override
  bool operator ==(other) =>
      other is OptionsBottomsheetEntity &&
      other.label == label &&
      other.mensage == mensage &&
      other.type == type &&
      other.icon == icon;

  @override
  int get hashCode =>
      label.hashCode ^ mensage.hashCode ^ type.hashCode ^ icon.hashCode;
}
