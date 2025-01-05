import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';

final MagicCircle firstCircle = MagicCircle(level: 1, pm: 1);
final MagicCircle secondCircle = MagicCircle(level: 2, pm: 3);
final MagicCircle thirdCircle = MagicCircle(level: 3, pm: 6);
final MagicCircle fourthCircle = MagicCircle(level: 4, pm: 10);
final MagicCircle fifthCircle = MagicCircle(level: 5, pm: 15);

MagicCircle magicCircleFromLevel(int level) {
  if (level == 1) {
    return firstCircle;
  } else if (level == 2) {
    return secondCircle;
  } else if (level == 3) {
    return thirdCircle;
  } else if (level == 4) {
    return fourthCircle;
  } else {
    return fifthCircle;
  }
}
