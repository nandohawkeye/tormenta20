import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:uuid/uuid.dart';

abstract class ExpertiseAdapters {
  static Expertise fromBaseInMenace(
    ExpertiseBase base,
    String menaceUuid,
    int valueFinal,
  ) {
    return Expertise(
      id: base.id,
      name: base.name,
      isTrained: false,
      atribute: base.atribute,
      parentUuid: menaceUuid,
      uuid: const Uuid().v4(),
      valueFinal: valueFinal,
    );
  }
}
