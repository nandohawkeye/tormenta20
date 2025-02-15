import 'package:tormenta20/src/shared/entities/board/board_combat.dart';

extension BoardCombatExt on BoardCombat {
  bool get isOpen => endAt == null;

  Duration get duration {
    if (endAt == null) {
      return DateTime.now().difference(startedAt);
    }
    return endAt!.difference(startedAt);
  }
}
