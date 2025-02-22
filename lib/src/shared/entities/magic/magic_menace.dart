class MagicMenace {
  final String uuid;
  final String resumedDesc;
  final String menaceUuid;
  final String name;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final int? bonusDamageValue;
  final int magicBaseId;

  MagicMenace({
    this.pm,
    this.cd,
    this.damageDices,
    this.bonusDamageValue,
    required this.name,
    required this.uuid,
    required this.menaceUuid,
    required this.resumedDesc,
    required this.magicBaseId,
  });

  @override
  bool operator ==(other) =>
      other is MagicMenace &&
      other.pm == pm &&
      other.cd == cd &&
      other.damageDices == damageDices &&
      other.bonusDamageValue == bonusDamageValue &&
      other.uuid == uuid &&
      other.menaceUuid == menaceUuid &&
      other.resumedDesc == resumedDesc &&
      other.magicBaseId == magicBaseId &&
      other.name == name;

  @override
  int get hashCode =>
      pm.hashCode ^
      cd.hashCode ^
      damageDices.hashCode ^
      bonusDamageValue.hashCode ^
      uuid.hashCode ^
      menaceUuid.hashCode ^
      resumedDesc.hashCode ^
      magicBaseId.hashCode ^
      name.hashCode;
}
