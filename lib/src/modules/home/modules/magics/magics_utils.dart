import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

abstract class MagicsUtils {
  static List<MagicType> allTypes = [
    MagicType.Arcana,
    MagicType.Divina,
    MagicType.Universal
  ];

  static List<MagicSchool> allSchools = [
    MagicSchool.Abjuracao,
    MagicSchool.Adivinhacao,
    MagicSchool.Convocacao,
    MagicSchool.Encantamento,
    MagicSchool.Evocacao,
    MagicSchool.Ilusao,
    MagicSchool.Necromancia,
    MagicSchool.Transmutacao,
  ];

  static List<MagicRange> allRanges = [
    MagicRange.Curto,
    MagicRange.Ilimitado,
    MagicRange.Longo,
    MagicRange.Medio,
    MagicRange.Pessoal,
    MagicRange.Toque,
  ];

  static List<MagicCircle> allCircles = [
    firstCircle,
    secondCircle,
    thirdCircle,
    fourthCircle,
    fifthCircle,
  ];

  static List<MagicDuration> allDurations = [
    MagicDuration.Cena,
    MagicDuration.Instantanea,
    MagicDuration.Sustentada,
  ];

  static List<MagicExecution> allExecutions = [
    MagicExecution.Completa,
    MagicExecution.Livre,
    MagicExecution.Padrao,
    MagicExecution.Reacao,
  ];

  static List<String> allResistencies = [
    'Fortitude',
    'Reflexos',
    'Vontade',
    'Nenhuma',
  ];
}
