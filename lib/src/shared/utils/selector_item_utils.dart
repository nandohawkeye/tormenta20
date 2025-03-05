import 'package:tormenta20/src/shared/entities/entity_base.dart';

abstract class SelectorItemUtils {
  static String title<T>(T type, String Function(String) handleTitle) {
    if (type is EntityBase) {
      return handleTitle(type.exibitionLabel);
    }

    if (type is Enum) {
      return handleTitle(type.name);
    }

    return handleTitle(type.toString());
  }
}
