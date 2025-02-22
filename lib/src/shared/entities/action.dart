import 'package:tormenta20/src/shared/entities/action_type.dart';

class Action {
  final String uuid;
  final String parentUuid;
  final String title;
  final String desc;
  final ActionType type;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final String? extraDamageDices;
  final int? bonusDamageValue;
  final int? critical;
  final int? criticalMultiplier;
  final String? equipament;

  Action({
    required this.uuid,
    required this.parentUuid,
    required this.title,
    required this.desc,
    required this.type,
    this.pm,
    this.cd,
    this.damageDices,
    this.extraDamageDices,
    this.bonusDamageValue,
    this.critical,
    this.criticalMultiplier,
    this.equipament,
  });
}
