import 'package:tormenta20/src/shared/entities/board/board_shortcuts_dto.dart';

class BottomSheetBoardShortcutsStore {
  BottomSheetBoardShortcutsStore({
    String? whatsLink,
    String? dicordLink,
    String? drivefilesLink,
    String? telegramLink,
  })  : _telegramLink = telegramLink,
        _drivefilesLink = drivefilesLink,
        _dicordLink = dicordLink,
        _whatsLink = whatsLink;

  String? _whatsLink;
  void onChangeWhats(String? value) {
    if ((value ?? '').isEmpty) {
      _whatsLink = null;
    } else {
      _whatsLink = value;
    }
  }

  String? _dicordLink;
  void onChangeDicordLink(String? value) {
    if ((value ?? '').isEmpty) {
      _dicordLink = null;
    } else {
      _dicordLink = value;
    }
  }

  String? _drivefilesLink;
  void onChangeDrivefilesLink(String? value) {
    if ((value ?? '').isEmpty) {
      _drivefilesLink = null;
    } else {
      _drivefilesLink = value;
    }
  }

  String? _telegramLink;
  void onChangeTelegramLink(String? value) {
    if ((value ?? '').isEmpty) {
      _telegramLink = null;
    } else {
      _telegramLink = value;
    }
  }

  BoardShortcutsDto toData() {
    return BoardShortcutsDto(
      whatsLink: _whatsLink,
      dicordLink: _dicordLink,
      telegramLink: _telegramLink,
      drivefilesLink: _drivefilesLink,
    );
  }
}
