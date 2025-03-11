import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

extension MagicCharacterExt on MagicCharacter {
  bool get needSetup => pm == null && cd == null;
}
