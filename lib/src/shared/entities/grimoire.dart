class Grimoire {
  final String uuid;
  final String name;
  final String? desc;
  final DateTime createdAt;
  final DateTime updatedAt;

  Grimoire({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });
}
