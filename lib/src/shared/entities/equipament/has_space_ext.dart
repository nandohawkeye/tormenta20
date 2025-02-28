import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';

extension HasSpaceExt on HasSpace {
  int totalSpaces(int modValue) {
    late int additional;
    if (modValue.isNegative) {
      additional = (modValue * -1);
    } else {
      additional = (modValue * 2);
    }

    return (normalSpaces + additional);
  }

  bool overloaded(int modValue, double ocupedSpaces) =>
      totalSpaces(modValue) < ocupedSpaces;

  bool limitePassed(double ocupedSpaces) => maxSpaces < ocupedSpaces;
}
