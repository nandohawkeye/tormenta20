import 'package:tormenta20/src/shared/entities/entity_base.dart';

class MagicCircle extends EntityBase {
  final int level;
  final int pm;

  MagicCircle({required this.level, required this.pm});

  @override
  bool operator ==(other) =>
      other is MagicCircle && other.level == level && other.pm == pm;

  @override
  int get hashCode => level.hashCode ^ pm.hashCode;

  @override
  String get exibitionLabel => '$level˚';

  @override
  get primaryKey => level;
}
