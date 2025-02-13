import 'package:tormenta20/src/shared/entities/board/board_combat.dart';

extension BoardCombatExt on BoardCombat {
  bool get isOpen => endAt == null;
}
