import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicCharacter extends Magic {
  final String uuid;
  final String grimoireUUid;
  MagicCharacter({
    required this.uuid,
    required this.grimoireUUid,
    required super.name,
    required super.desc,
    required super.circle,
    required super.type,
    required super.school,
    required super.execution,
    required super.duration,
    required super.range,
    required super.resistence,
    required super.targetAreaEfect,
  });
}
