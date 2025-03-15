import 'package:tormenta20/src/shared/entities/entity_base.dart';

class MagicMenace extends EntityBase {
  final String uuid;
  final String resumedDesc;
  final String menaceUuid;
  final String name;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final String? extraDamageDices;
  final int? mediumDamageValue;
  final int magicBaseId;

  MagicMenace({
    this.pm,
    this.cd,
    this.damageDices,
    this.mediumDamageValue,
    this.extraDamageDices,
    required this.name,
    required this.uuid,
    required this.menaceUuid,
    required this.resumedDesc,
    required this.magicBaseId,
  });

  MagicMenace cloneWith({
    required String uuid,
    required String menaceUuid,
  }) {
    return MagicMenace(
      uuid: uuid,
      menaceUuid: menaceUuid,
      name: name,
      resumedDesc: resumedDesc,
      magicBaseId: magicBaseId,
      pm: pm,
      cd: cd,
      damageDices: damageDices,
      extraDamageDices: extraDamageDices,
      mediumDamageValue: mediumDamageValue,
    );
  }

  @override
  bool operator ==(other) =>
      other is MagicMenace &&
      other.pm == pm &&
      other.cd == cd &&
      other.damageDices == damageDices &&
      other.mediumDamageValue == mediumDamageValue &&
      other.uuid == uuid &&
      other.menaceUuid == menaceUuid &&
      other.resumedDesc == resumedDesc &&
      other.magicBaseId == magicBaseId &&
      other.name == name &&
      other.extraDamageDices == extraDamageDices;

  @override
  int get hashCode =>
      pm.hashCode ^
      cd.hashCode ^
      damageDices.hashCode ^
      mediumDamageValue.hashCode ^
      uuid.hashCode ^
      menaceUuid.hashCode ^
      resumedDesc.hashCode ^
      magicBaseId.hashCode ^
      name.hashCode ^
      extraDamageDices.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
