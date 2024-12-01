import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/palettes.dart';

final _palette = Palettes.dark();

final ThemeData theme = ThemeData(
  fontFamily: 'medieval',
  useMaterial3: false,
  brightness: Brightness.light,
  scaffoldBackgroundColor: _palette.background,
  primaryColor: _palette.inputColor,
  indicatorColor: _palette.indicator,
  canvasColor: _palette.inputColor,
  colorScheme: ColorScheme.light(
    primary: _palette.primary,
    secondary: _palette.secondary,
    primaryContainer: _palette.inputColor,
    surface: _palette.background,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: _palette.inputColor,
    titleTextStyle: TextStyle(color: _palette.textPrimary),
    elevation: 30,
    shape: T20UI.defaultShapeBorder(_palette),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    brightness: Brightness.light,
    primaryContrastingColor: _palette.inputColor,
    primaryColor: _palette.secondary,
    textTheme: CupertinoTextThemeData(
      pickerTextStyle: TextStyle(color: _palette.textPrimary),
      primaryColor: _palette.textPrimary,
      dateTimePickerTextStyle:
          TextStyle(fontSize: 16, color: _palette.textPrimary),
      actionTextStyle: TextStyle(
        fontSize: 10,
        color: _palette.background,
        fontWeight: FontWeight.normal,
        backgroundColor: _palette.background,
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: _palette.textSelection, // Change it later
    // cursorColor: palette.textSelection,
    selectionHandleColor: _palette.textSelection,
  ),
  dividerTheme: DividerThemeData(
    color: _palette.divider,
    space: 1,
    indent: 0,
    endIndent: 0,
    thickness: 1,
  ),
  iconTheme: IconThemeData(color: _palette.icon, size: T20UI.iconSize),
  cardTheme: CardTheme(
    shape: T20UI.defaultBorder(_palette),
    elevation: 0,
    margin: EdgeInsets.zero,
    color: _palette.inputColor,
    shadowColor: Colors.transparent,
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith((_) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: _palette.textDisable)),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (Set<WidgetState> states) {
      return RoundedRectangleBorder(borderRadius: T20UI.borderRadius);
    }),
    foregroundColor: WidgetStateColor.resolveWith((_) => _palette.primaryCTA),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    maximumSize: WidgetStateProperty.resolveWith(
        (_) => const Size.fromHeight(T20UI.inputHeight)),
    textStyle: WidgetStateProperty.resolveWith(
        (_) => const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    shadowColor: WidgetStateColor.resolveWith((_) => Colors.transparent),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (Set<WidgetState> states) {
      return RoundedRectangleBorder(borderRadius: T20UI.borderRadius);
    }),
    padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((_) =>
        const EdgeInsets.symmetric(
            horizontal: T20UI.spaceSize, vertical: T20UI.spaceSize)),
    backgroundColor: WidgetStateColor.resolveWith((_) => _palette.primaryCTA),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith<TextStyle>((_) =>
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
              (Set<WidgetState> states) {
            return RoundedRectangleBorder(
                side: const BorderSide(strokeAlign: -1),
                borderRadius: T20UI.borderRadius);
          }),
          padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((_) =>
              const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize, vertical: T20UI.spaceSize)),
          backgroundColor:
              WidgetStateColor.resolveWith((_) => Colors.transparent),
          foregroundColor:
              WidgetStateColor.resolveWith((_) => _palette.textPrimary),
          side: WidgetStateProperty.resolveWith<BorderSide>(
              (_) => BorderSide(width: 1, color: _palette.textPrimary)))),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _palette.inputColor,
    labelStyle: TextStyle(color: _palette.textPrimary, fontSize: 14),
    hintStyle: TextStyle(color: _palette.textPrimary, fontSize: 14),
    floatingLabelStyle: TextStyle(color: _palette.textPrimary, fontSize: 14),
    suffixStyle: TextStyle(color: _palette.textPrimary, fontSize: 14),
    prefixStyle: TextStyle(color: _palette.textPrimary, fontSize: 14),
    errorStyle: TextStyle(color: _palette.error, fontSize: 12),
    helperStyle: TextStyle(color: _palette.textPrimary, fontSize: 12),
    contentPadding: T20UI.formFieldContentPadding,
    suffixIconColor: _palette.textDisable,
    errorBorder: T20UI.errorBorder(_palette),
    enabledBorder: T20UI.defaultBorder(_palette),
    focusedBorder: T20UI.defaultBorder(_palette),
    outlineBorder: BorderSide(color: _palette.cardBackground),
    activeIndicatorBorder: BorderSide(color: _palette.cardStroke),
    disabledBorder: T20UI.defaultBorder(_palette),
    focusedErrorBorder: T20UI.errorBorder(_palette),
    border: T20UI.defaultBorder(_palette),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: _palette.bottomSheetBackground,
    headerForegroundColor: _palette.textPrimary,
    headerBackgroundColor: _palette.bottomSheetBackground,
    surfaceTintColor: _palette.bottomSheetBackground,
    dividerColor: _palette.dividerBottomSheet,
    shape: T20UI.defaultBorder(_palette),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: _palette.bottomSheetBackground,
    dialBackgroundColor: _palette.onBottomsheet,
    hourMinuteColor: _palette.onBottomsheet,
    hourMinuteTextColor: _palette.textPrimary,
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
        (_) => TextStyle(
            color: _palette.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
        (_) => TextStyle(
            color: _palette.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    ),
    hourMinuteShape: RoundedRectangleBorder(borderRadius: T20UI.borderRadius),
    shape: T20UI.defaultBorder(_palette),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: _palette.bottomSheetBackground,
    shape: T20UI.bottomSheetShape,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: TextStyle(
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: _palette.textPrimary,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: _palette.textPrimary,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: _palette.background,
    selectedIconTheme: IconThemeData(color: _palette.primaryCTA),
    selectedLabelTextStyle: TextStyle(color: _palette.textPrimary),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: _palette.appBar,
    shadowColor: Colors.black38,
    centerTitle: false,
    foregroundColor: _palette.textPrimary,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: _palette.textPrimary,
    ),
    titleSpacing: 12,
    elevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: _palette.appBar,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: _palette.appBar,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _palette.background,
    selectedItemColor: _palette.primaryCTA,
    unselectedItemColor: _palette.iconDisable, // 60% white
    elevation: 3,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: _palette.popMenu,
    enableFeedback: true,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _palette.inputColor;
      }
      return null;
    }),
    fillColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _palette.secondary;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _palette.secondary;
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _palette.secondary;
      }
      return null;
    }),
    trackColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return _palette.secondary;
      }
      return null;
    }),
  ),
);
