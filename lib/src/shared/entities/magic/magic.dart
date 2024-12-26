import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class Magic {
  final String name;
  final String desc;
  final MagicCircle circle;
  final MagicType type;
  final MagicSchool school;
  final String execution;
  final String duration;
  final MagicRange range;
  final String resistence;
  final String targetAreaEfect;

  Magic({
    required this.name,
    required this.desc,
    required this.circle,
    required this.type,
    required this.school,
    required this.execution,
    required this.duration,
    required this.range,
    required this.resistence,
    required this.targetAreaEfect,
  });
}
