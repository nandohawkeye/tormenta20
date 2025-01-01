import 'package:tormenta20/src/modules/home/modules/magics/magics_service.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

extension MagicCharacterExt on MagicCharacter {
  Magic getMagicBase() =>
      MagicsService().getAllMagics().firstWhere((m) => m.id == id);
}
