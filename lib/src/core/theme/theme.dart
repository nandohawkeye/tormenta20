import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/palettes.dart';

final palette = Palettes.dark();

final ThemeData theme = ThemeData(
  useMaterial3: false,
  fontFamily: 'merriweathersans',
  brightness: Brightness.light,
  scaffoldBackgroundColor: palette.background,
  primaryColor: palette.inputColor,
  indicatorColor: palette.indicator,
  canvasColor: Colors.transparent,
  splashColor: palette.accent.withValues(alpha: .4),
  colorScheme: ColorScheme.light(
    primary: palette.primary,
    secondary: palette.secondary,
    primaryContainer: palette.inputColor,
    surface: palette.background,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: palette.inputColor,
    titleTextStyle: TextStyle(color: palette.textPrimary),
    elevation: 30,
    shape: T20UI.defaultShapeBorder(palette),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    brightness: Brightness.light,
    primaryContrastingColor: palette.inputColor,
    primaryColor: palette.secondary,
    textTheme: CupertinoTextThemeData(
      pickerTextStyle: TextStyle(color: palette.textPrimary),
      primaryColor: palette.textPrimary,
      dateTimePickerTextStyle:
          TextStyle(fontSize: 16, color: palette.textPrimary),
      actionTextStyle: TextStyle(
        fontSize: 10,
        color: palette.background,
        fontWeight: FontWeight.normal,
        backgroundColor: palette.background,
      ),
    ),
  ),
  dividerTheme: DividerThemeData(
    color: palette.divider,
    space: 1,
    indent: T20UI.screenContentSpaceSize,
    thickness: 1,
    endIndent: T20UI.screenContentSpaceSize,
  ),
  iconTheme: IconThemeData(color: palette.icon, size: T20UI.iconSize),
  cardTheme: CardTheme(
    shape: T20UI.defaultBorder(palette),
    elevation: 0,
    margin: EdgeInsets.zero,
    color: palette.cardBackground,
    shadowColor: Colors.transparent,
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith((_) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: palette.textDisable)),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (Set<WidgetState> states) {
      return RoundedRectangleBorder(borderRadius: T20UI.borderRadius);
    }),
    foregroundColor: WidgetStateColor.resolveWith((_) => palette.accent),
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
    backgroundColor: WidgetStateColor.resolveWith((_) => palette.accent),
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
              WidgetStateColor.resolveWith((_) => palette.textPrimary),
          side: WidgetStateProperty.resolveWith<BorderSide>(
              (_) => BorderSide(width: 1, color: palette.textPrimary)))),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: palette.inputColor,
    labelStyle: TextStyle(color: palette.textPrimary, fontSize: 14),
    hintStyle: TextStyle(color: palette.textPrimary, fontSize: 14),
    floatingLabelStyle: TextStyle(color: palette.textPrimary, fontSize: 14),
    suffixStyle: TextStyle(color: palette.textPrimary, fontSize: 14),
    prefixStyle: TextStyle(color: palette.textPrimary, fontSize: 14),
    errorStyle: TextStyle(
        color: palette.accent, fontSize: 12, fontWeight: FontWeight.bold),
    helperStyle: TextStyle(
      color: palette.textSecundary,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: T20UI.formFieldContentPadding,
    suffixIconColor: palette.textDisable,
    errorBorder: T20UI.errorBorder(palette),
    enabledBorder: T20UI.defaultBorder(palette),
    focusedBorder: T20UI.defaultBorder(palette),
    outlineBorder: BorderSide(color: palette.cardBackground),
    activeIndicatorBorder: BorderSide(color: palette.cardStroke),
    disabledBorder: T20UI.defaultBorder(palette),
    focusedErrorBorder: T20UI.errorBorder(palette),
    border: T20UI.defaultBorder(palette),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: palette.backgroundLevelOne,
    headerForegroundColor: palette.textPrimary,
    headerBackgroundColor: palette.backgroundLevelOne,
    surfaceTintColor: palette.backgroundLevelOne,
    dividerColor: palette.dividerLevelTwo,
    shape: T20UI.defaultBorder(palette),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: palette.backgroundLevelOne,
    dialBackgroundColor: palette.backgroundLevelTwo,
    hourMinuteColor: palette.backgroundLevelTwo,
    hourMinuteTextColor: palette.textPrimary,
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
        (_) => TextStyle(
            color: palette.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
        (_) => TextStyle(
            color: palette.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    ),
    hourMinuteShape: RoundedRectangleBorder(borderRadius: T20UI.borderRadius),
    shape: T20UI.defaultBorder(palette),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    dragHandleColor: Colors.transparent,
    modalBarrierColor: Colors.transparent,
    elevation: 0,
    modalElevation: 0,
    showDragHandle: false,
    shape: T20UI.bottomSheetShape,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: TextStyle(
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: palette.textPrimary,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: palette.textPrimary,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: palette.textPrimary,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: palette.background,
    selectedIconTheme: IconThemeData(color: palette.accent),
    selectedLabelTextStyle: TextStyle(color: palette.textPrimary),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: palette.appBar,
    shadowColor: Colors.black38,
    centerTitle: false,
    foregroundColor: palette.textPrimary,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: palette.textPrimary,
      fontFamily: FontFamily.tormenta,
    ),
    titleSpacing: 12,
    elevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: palette.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: palette.appBar,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: palette.background,
    selectedItemColor: palette.accent,
    unselectedItemColor: palette.iconDisable,
    elevation: 3,
    selectedIconTheme:
        IconThemeData(color: palette.accent, size: T20UI.iconSize),
    unselectedIconTheme:
        IconThemeData(color: palette.iconDisable, size: T20UI.iconSize),
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: palette.popMenu,
    enableFeedback: true,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return palette.inputColor;
      }
      return null;
    }),
    fillColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return palette.secondary;
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
        return palette.secondary;
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
        return palette.secondary;
      }
      return null;
    }),
    trackColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return palette.secondary;
      }
      return null;
    }),
  ),
);
