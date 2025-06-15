import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CharacterBoardUtils {
  static String handleAllClassesTypeTitle(Iterable<ClasseTypeCharacter> types) {
    if (types.length == 1) {
      return _handleClasseTypeTitle(types.first);
    } else {
      int index = 0;
      String value = '';
      for (var type in types) {
        if (index == 0) {
          value += _handleClasseTypeTitle(type);
        } else {
          value += ' / ${_handleClasseTypeTitle(type)}';
        }
        index++;
      }
      return value;
    }
  }

  static String _handleClasseTypeTitle(ClasseTypeCharacter value) {
    if (value.type.name.contains('barbaro')) {
      return 'Bárbaro (${value.level.toString().padLeft(2, '0')})';
    } else if (value.type.name.contains('cacador')) {
      return 'Caçador (${value.level.toString().padLeft(2, '0')})';
    } else {
      final first = value.type.name.split('_').first;
      return '${first.capitalize().trim()} (${value.level.toString().padLeft(2, '0')})';
    }
  }
}
