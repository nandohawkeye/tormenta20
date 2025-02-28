import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/palettes.dart';

abstract class T20UI {
  static const double inputHeight = 48;
  static const double inputBorderRadius = 12;
  static const double smallSpaceSize = 8;
  static const double spaceSize = 16;
  static const double screenContentSpaceSize = spaceSize - 4;
  static const double iconSize = 18;
  static const Duration defaultDurationAnimation = Duration(milliseconds: 200);
  static ShapeBorder bottomSheetShape =
      ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0));

  static const EdgeInsets horizontallScreenPadding =
      EdgeInsets.symmetric(horizontal: screenContentSpaceSize);

  static const EdgeInsets formFieldContentPadding =
      EdgeInsets.symmetric(horizontal: spaceSize, vertical: 14.8);

  static ShapeBorder defaultShapeBorder(PaletteBase palette) =>
      RoundedRectangleBorder(
        side: BorderSide(color: palette.cardStroke),
        borderRadius: borderRadius,
      );

  static InputBorder errorBorder(PaletteBase palette) => OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: palette.error),
        gapPadding: 0,
      );

  static InputBorder defaultBorder(PaletteBase palette) => OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: palette.cardStroke),
        gapPadding: 0,
      );

  static const Widget spaceWidth = SizedBox(width: spaceSize);
  static const Widget spaceHeight = SizedBox(height: spaceSize);

  static const Widget spaceWidthList = SizedBox(width: smallSpaceSize);
  static const Widget spaceHeightList = SizedBox(height: smallSpaceSize);

  static const EdgeInsets allPadding = EdgeInsets.all(spaceSize);

  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: spaceSize);

  static const EdgeInsets verticalPadding =
      EdgeInsets.symmetric(vertical: spaceSize);

  static EdgeInsets allPaddingWithPaddingBottom(BuildContext context,
          {double extra = 0}) =>
      EdgeInsets.only(
          top: spaceSize,
          left: spaceSize,
          right: spaceSize,
          bottom: spaceSizePaddingBottom(context, extra: extra));

  static double spaceSizePaddingBottom(BuildContext context,
          {double extra = 0}) =>
      extra + spaceSize + MediaQuery.of(context).padding.bottom;

  static Widget separatorBuilderVertical(_, __) =>
      const SizedBox(height: spaceSize);
  static Widget separatorBuilderHorizontal(_, __) =>
      const SizedBox(width: smallSpaceSize);
  static Border cardBorder(PaletteBase pallete) =>
      Border.all(color: pallete.cardStroke);
  static BorderRadius borderRadius = BorderRadius.circular(inputBorderRadius);

  static Widget safeAreaBottom(BuildContext context,
          {double additionalHeight = 0}) =>
      SizedBox(
          height: additionalHeight + MediaQuery.of(context).padding.bottom);
}
