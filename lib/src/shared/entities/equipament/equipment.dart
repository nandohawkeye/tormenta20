class Equipment {
  final String uuid;
  final String parentUuid;
  final String name;
  final String? storedIn;
  final String? improvements;
  final String? specialMaterials;

  Equipment({
    required this.uuid,
    required this.parentUuid,
    required this.name,
    this.storedIn,
    this.improvements,
    this.specialMaterials,
  });

  @override
  bool operator ==(other) =>
      other is Equipment &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.storedIn == storedIn &&
      other.improvements == improvements &&
      other.specialMaterials == specialMaterials;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      storedIn.hashCode ^
      improvements.hashCode ^
      specialMaterials.hashCode;
}
