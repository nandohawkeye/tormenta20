import 'package:flutter/material.dart';

class PaletteBase {
  PaletteBase({
    required this.onInput,
    required this.remove,
    required this.disable,
    required this.appBarShadown,
    required this.indicator,
    required this.iconDisable,
    required this.icon,
    required this.accent,
    required this.onAccent,
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
    required this.unselectedWidget,
    required this.appBar,
    required this.dividerLevelTwo,
    required this.selected,
    required this.onSelected,
    required this.backgroundLevelTwo,
    required this.backgroundLevelThree,
    required this.backgroundLevelFour,
    required this.backgroundLevelOne,
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
  final Color accent;
  final Color onAccent;
  final Color secundaryCTA;
  final Color onSecundaryCTA;
  final Color icon;
  final Color iconDisable;
  final Color indicator;
  final Color appBarShadown;
  final Color appBar;
  final Color disable;
  final Color remove;
  final Color onInput;
  final Color secondary;
  final Color textDisable;
  final Color popMenu;
  final Color divider;
  final Color dividerLevelTwo;
  final Color unselectedWidget;

  final Color selected;
  final Color onSelected;
  final Color backgroundLevelOne;
  final Color backgroundLevelTwo;
  final Color backgroundLevelThree;
  final Color backgroundLevelFour;
}

abstract class Palettes {
  static PaletteBase dark() => PaletteBase(
        onInput: const Color(0xFF262626),
        appBarShadown: const Color(0xFF191919),
        cardBackground: const Color(0xFF212121),
        appBar: Colors.transparent,
        icon: const Color(0xFFFAFAFA),
        indicator: const Color(0xFFFAFAFA),
        iconDisable: const Color(0xFF424242),
        background: const Color(0xFF000000),
        cardStroke: Colors.transparent,
        inputColor: const Color(0xFF212121),
        canceled: const Color(0xFFDC4740),
        concluded: const Color(0xFF328D43),
        error: const Color(0xFF7A0D19),
        onAccent: const Color(0xFFFFFFFF),
        secundaryCTA: Colors.transparent,
        onSecundaryCTA: const Color(0xFF000000),
        popMenu: const Color(0xFF262626),
        primary: const Color(0xFFCC152A),
        secondary: const Color(0xFF262626),
        success: const Color(0xFF65C466),
        disable: const Color(0xFF5E6064),
        textDisable: const Color(0xFF5E6064),
        textPrimary: const Color(0xFFFAFAFA),
        textSecundary: const Color(0xFFFAFAFA).withValues(alpha: .5),
        divider: const Color(0xFF212121).withValues(alpha: .6),
        dividerLevelTwo: const Color(0xFF424242).withValues(alpha: .6),
        unselectedWidget: const Color(0xFF616161),
        remove: const Color(0xFFDA0000),
        accent: const Color(0xFFCC152A),
        selected: const Color(0xFF7A0D19),
        onSelected: const Color(0xFFFFFFFF),
        backgroundLevelOne: const Color(0xFF212121),
        backgroundLevelTwo: const Color(0xFF424242),
        backgroundLevelThree: const Color(0xFF616161),
        backgroundLevelFour: const Color(0xFF757575),
      );
}
