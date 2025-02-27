class Equipment {
  final String uuid;
  final String parentUuid;
  final String name;

  Equipment({
    required this.uuid,
    required this.parentUuid,
    required this.name,
  });

  @override
  bool operator ==(other) =>
      other is Equipment &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name;

  @override
  int get hashCode => uuid.hashCode ^ parentUuid.hashCode ^ name.hashCode;
}
