import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CharacterUtils {
  static String handleAllClassesTypeTitle(Iterable<ClasseType> types) {
    if (types.length == 1) {
      return handleClasseTypeTitle(types.first.name);
    } else {
      int index = 0;
      String value = '';
      for (var type in types) {
        if (index == 0) {
          value += handleClasseTypeTitle(type.name);
        } else {
          value += ' / ${handleClasseTypeTitle(type.name)}';
        }
        index++;
      }
      return value;
    }
  }

  static String handleClasseTypeTitle(String value) {
    if (value.contains('barbaro')) {
      return 'Bárbaro';
    } else if (value.contains('cacador')) {
      return 'Caçador';
    } else {
      final first = value.split('_').first;
      return first.capitalize().trim();
    }
  }

  static String handleBroodTitle(String value) {
    if (value.contains('meioelfo')) {
      return 'Meio-elfo';
    } else if (value.contains('meioorc')) {
      return 'Meio-orc';
    } else if (value == 'troganao') {
      return 'Trog-anão';
    } else if (value == 'elfodomar') {
      return 'Elfo-do-mar';
    } else if (value.contains('sereiatritao')) {
      return 'Sereia - Tritão';
    } else if (value.contains('silfide')) {
      return 'Sílfide';
    } else if (value.contains('suraggels')) {
      final last = value.split('_').last;
      return 'Suraggels ($last)';
    } else if (value.contains('anao')) {
      return 'Anão';
    } else {
      final first = value.split('_').first;
      return first.capitalize().trim();
    }
  }
}
