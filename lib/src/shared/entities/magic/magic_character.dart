import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicCharacter extends Magic {
  final String uuid;
  final String grimoireUuid;
  final int? pm;
  final int? cd;
  final String? damageDices;
  final String? extraDamageDices;
  final int? mediumDamageValue;
  MagicCharacter({
    required this.uuid,
    required this.grimoireUuid,
    required super.id,
    required super.name,
    required super.desc,
    required super.circle,
    required super.type,
    required super.school,
    required super.execution,
    required super.duration,
    required super.range,
    required super.resistence,
    required super.targetAreaEffect,
    required super.publication,
    this.pm,
    this.cd,
    this.damageDices,
    this.extraDamageDices,
    this.mediumDamageValue,
  });

  MagicCharacter copyWith({
    int? pm,
    int? cd,
    String? damageDices,
    String? extraDamageDices,
    int? mediumDamageValue,
  }) {
    return MagicCharacter(
      uuid: uuid,
      grimoireUuid: grimoireUuid,
      id: id,
      name: name,
      desc: desc,
      circle: circle,
      type: type,
      school: school,
      execution: execution,
      duration: duration,
      range: range,
      resistence: resistence,
      targetAreaEffect: targetAreaEffect,
      publication: publication,
      pm: pm ?? this.pm,
      cd: cd ?? this.cd,
      damageDices: damageDices ?? this.damageDices,
      extraDamageDices: extraDamageDices ?? this.extraDamageDices,
      mediumDamageValue: mediumDamageValue ?? this.mediumDamageValue,
    );
  }

  @override
  bool operator ==(other) =>
      other is MagicCharacter &&
      other.desc == desc &&
      other.name == name &&
      other.circle == circle &&
      other.type == type &&
      other.school == school &&
      other.execution == execution &&
      other.duration == duration &&
      other.range == range &&
      other.resistence == resistence &&
      other.targetAreaEffect == targetAreaEffect &&
      other.uuid == uuid &&
      other.id == id &&
      other.grimoireUuid == grimoireUuid &&
      other.pm == pm &&
      other.cd == cd &&
      other.damageDices == damageDices &&
      other.publication == publication &&
      other.extraDamageDices == extraDamageDices &&
      other.mediumDamageValue == mediumDamageValue;

  @override
  int get hashCode =>
      desc.hashCode ^
      name.hashCode ^
      circle.hashCode ^
      type.hashCode ^
      school.hashCode ^
      execution.hashCode ^
      duration.hashCode ^
      range.hashCode ^
      resistence.hashCode ^
      targetAreaEffect.hashCode ^
      id.hashCode ^
      uuid.hashCode ^
      grimoireUuid.hashCode ^
      publication.hashCode ^
      pm.hashCode ^
      cd.hashCode ^
      damageDices.hashCode ^
      extraDamageDices.hashCode ^
      mediumDamageValue.hashCode;

  @override
  get primaryKey => uuid;
}
