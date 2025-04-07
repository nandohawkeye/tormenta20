import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/power_type.dart';

class Power extends EntityBase {
  final String uuid;
  final String name;
  final String desc;
  final PowerType type;
  final String characterUuid;

  Power({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.type,
    required this.characterUuid,
  });

  Power copyWith({
    String? uuid,
    String? name,
    String? desc,
    PowerType? type,
    String? characterUuid,
  }) {
    return Power(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      type: type ?? this.type,
      characterUuid: characterUuid ?? this.characterUuid,
    );
  }

  @override
  String get exibitionLabel => name;

  @override
  String get primaryKey => uuid;

  @override
  bool operator ==(other) =>
      other is Power &&
      other.uuid == uuid &&
      other.name == name &&
      other.desc == desc &&
      other.type == type &&
      other.characterUuid == characterUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      type.hashCode ^
      characterUuid.hashCode;
}
