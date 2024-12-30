import 'package:flutter/material.dart';

class PaletteBase {
  PaletteBase({
    required this.onBottomsheetSelected,
    required this.onInput,
    required this.remove,
    required this.disable,
    required this.symbolAvatar,
    required this.cancelCTABorder,
    required this.lateWarning,
    required this.appBarShadown,
    required this.indicator,
    required this.iconDisable,
    required this.icon,
    required this.textSelection,
    required this.cancelCTA,
    required this.onCancelCTA,
    required this.primaryCTA,
    required this.onPrimaryCTA,
    required this.secundaryCTA,
    required this.onSecundaryCTA,
    required this.concluded,
    required this.canceled,
    required this.cardBackground,
    required this.success,
    required this.primary,
    required this.secondary,
    required this.error,
    required this.textPrimary,
    required this.textSecundary,
    required this.textDisable,
    required this.background,
    required this.cardStroke,
    required this.inputColor,
    required this.popMenu,
    required this.divider,
    required this.bottomSheetBackground,
    required this.unselectedWidget,
    required this.onBottomsheet,
    required this.appBar,
    required this.dividerBottomSheet,
  });
  final Color background;
  final Color cardStroke;
  final Color inputColor;
  final Color textPrimary;
  final Color cardBackground;
  final Color textSecundary;
  final Color concluded;
  final Color canceled;
  final Color success;
  final Color error;
  final Color primary;
  final Color primaryCTA;
  final Color onPrimaryCTA;
  final Color secundaryCTA;
  final Color onSecundaryCTA;
  final Color cancelCTA;
  final Color cancelCTABorder;
  final Color onCancelCTA;
  final Color textSelection;
  final Color icon;
  final Color iconDisable;
  final Color indicator;
  final Color appBarShadown;
  final Color lateWarning;
  final Color appBar;
  final Color symbolAvatar;
  final Color disable;
  final Color remove;
  final Color onInput;
  final Color secondary;
  final Color textDisable;
  final Color popMenu;
  final Color divider;
  final Color dividerBottomSheet;
  final Color bottomSheetBackground;
  final Color unselectedWidget;
  final Color onBottomsheet;
  final Color onBottomsheetSelected;
}

abstract class Palettes {
  static PaletteBase dark() => PaletteBase(
        onBottomsheetSelected: const Color(0xFF424242),
        onInput: const Color(0xFF262626),
        appBarShadown: const Color(0xFF191919),
        cardBackground: const Color(0xFF101010),
        appBar: const Color(0xFF000000),
        icon: const Color(0xFFFAFAFA),
        indicator: const Color(0xFFFAFAFA),
        iconDisable: const Color(0xFF424242),
        background: const Color(0xFF000000),
        symbolAvatar: const Color(0xFF0c0c0c),
        textSelection: const Color(0xFF000000),
        cardStroke: Colors.transparent,
        inputColor: const Color(0xFF212121),
        canceled: const Color(0xFFDC4740),
        lateWarning: const Color(0xFFF19F38),
        concluded: const Color(0xFF328D43),
        error: const Color(0xFFCB5247),
        primaryCTA: const Color(0xFFCC152A),
        onPrimaryCTA: const Color(0xFFFFFFFF),
        secundaryCTA: Colors.transparent,
        onSecundaryCTA: const Color(0xFF000000),
        cancelCTA: const Color(0xFF221210),
        cancelCTABorder: const Color(0xFF221210),
        onCancelCTA: const Color(0xFFEA4335),
        popMenu: const Color(0xFF262626),
        primary: const Color(0xFF1F6FEB),
        secondary: const Color(0xFF262626),
        success: const Color(0xFF65C466),
        disable: const Color(0xFF5E6064),
        textDisable: const Color(0xFF5E6064),
        textPrimary: const Color(0xFFFAFAFA),
        textSecundary: const Color(0xFFC9C9C9),
        divider: const Color(0xFF212121),
        dividerBottomSheet: const Color(0xFF424242),
        bottomSheetBackground: const Color(0xFF212121),
        unselectedWidget: const Color(0xFF616161),
        remove: const Color(0xFFDA0000),
        onBottomsheet: const Color(0xFF424242),
      );
}
