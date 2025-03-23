import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CharacterAlignmentTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('LealBondoso')) {
      return 'Leal e Bondoso';
    } else if (value.contains('NeutroBondoso')) {
      return 'Neutro e Bondoso';
    } else if (value.contains('CaoticoBondoso')) {
      return 'Caótico e Bondoso';
    } else if (value.contains('LealNeutro')) {
      return 'Leal e Neutro';
    } else if (value.contains('CaoticoNeutro')) {
      return 'Caótico e Neutro';
    } else if (value.contains('LealMaligno')) {
      return 'Leal e Maligno';
    } else if (value.contains('NeutroMaligno')) {
      return 'Neutro e Maligno';
    } else if (value.contains('CaoticoMaligno')) {
      return 'Caótico e Maligno';
    } else {
      return value.capitalize().trim();
    }
  }

  static IconData handleIcon(String value) {
    if (value.contains('Maligno')) {
      return FontAwesomeIcons.solidFaceAngry;
    } else if (value.contains('Bondoso')) {
      return FontAwesomeIcons.solidFaceLaughBeam;
    } else {
      return FontAwesomeIcons.solidFaceSmileWink;
    }
  }
}
