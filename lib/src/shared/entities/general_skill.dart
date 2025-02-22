class GeneralSkill {
  final String uuid;
  final String title;
  final String desc;
  final String parentUuid;

  GeneralSkill({
    required this.uuid,
    required this.title,
    required this.desc,
    required this.parentUuid,
  });

  @override
  bool operator ==(other) =>
      other is GeneralSkill &&
      other.uuid == uuid &&
      other.title == title &&
      other.desc == desc &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^ title.hashCode ^ desc.hashCode ^ parentUuid.hashCode;
}
