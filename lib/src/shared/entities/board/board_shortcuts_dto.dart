class BoardShortcutsDto {
  final String? whatsLink;
  final String? dicordLink;
  final String? drivefilesLink;
  final String? telegramLink;

  BoardShortcutsDto({
    required this.whatsLink,
    required this.dicordLink,
    required this.drivefilesLink,
    required this.telegramLink,
  });

  bool get isEmpty =>
      whatsLink == null &&
      dicordLink == null &&
      drivefilesLink == null &&
      telegramLink == null;

  @override
  bool operator ==(other) =>
      other is BoardShortcutsDto &&
      other.whatsLink == whatsLink &&
      other.dicordLink == dicordLink &&
      other.drivefilesLink == drivefilesLink &&
      other.telegramLink == telegramLink;

  @override
  int get hashCode =>
      whatsLink.hashCode ^
      dicordLink.hashCode ^
      drivefilesLink.hashCode ^
      telegramLink.hashCode;
}
