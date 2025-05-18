class GlobalModifiers {
  final String parentUuid;
  final String uuid;
  final int rool;
  final int bonusAttack;
  final int expertises;
  final int resistances;
  final int damage;
  final int defense;
  final int bonusArmor;
  final int bonusShield;
  final int others;

  GlobalModifiers({
    required this.parentUuid,
    required this.uuid,
    required this.rool,
    required this.bonusAttack,
    required this.expertises,
    required this.resistances,
    required this.damage,
    required this.defense,
    required this.bonusArmor,
    required this.bonusShield,
    required this.others,
  });

  @override
  bool operator ==(other) =>
      other is GlobalModifiers &&
      other.uuid == uuid &&
      other.rool == rool &&
      other.bonusAttack == bonusAttack &&
      other.expertises == expertises &&
      other.resistances == resistances &&
      other.damage == damage &&
      other.defense == defense &&
      other.bonusArmor == bonusArmor &&
      other.bonusShield == bonusShield &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^
      rool.hashCode ^
      bonusAttack.hashCode ^
      expertises.hashCode ^
      resistances.hashCode ^
      damage.hashCode ^
      defense.hashCode ^
      bonusArmor.hashCode ^
      bonusShield.hashCode ^
      parentUuid.hashCode;
}
