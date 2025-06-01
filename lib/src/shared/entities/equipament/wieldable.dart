import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';

abstract class Wieldable {
  final WieldableType wieldableType;

  const Wieldable({required this.wieldableType});
}
