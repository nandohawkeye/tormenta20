import 'package:tormenta20/src/shared/entities/creature_size.dart';

abstract class SelectorItemUtils {
  static String title<T>(T type, String Function(String) handleTitle) {
    if (type is CreatureSize) {
      return handleTitle(type.category.name);
    }

    if (type is Enum) {
      return handleTitle(type.name);
    }

    return handleTitle(type.toString());
  }
}
