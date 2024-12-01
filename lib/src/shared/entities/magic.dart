import 'package:tormenta20/src/shared/entities/magic_circle.dart';

class Magic {
  final String name;
  final String desc;
  final MagicCircle circle;
  final String type;
  final String school;
  final String execution;
  final String duration;
  final String range;
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
