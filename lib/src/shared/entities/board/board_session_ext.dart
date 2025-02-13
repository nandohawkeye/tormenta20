import 'package:tormenta20/src/shared/entities/board/board_session.dart';

extension BoardSessionExt on BoardSession {
  bool get isOpen => endAt == null;

  Duration get duration {
    if (endAt == null) {
      return DateTime.now().difference(startedAt);
    }
    return endAt!.difference(startedAt);
  }
}
