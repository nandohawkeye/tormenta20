class Divinity {
  final int id;
  final String name;
  final String assetPath;

  Divinity({
    required this.id,
    required this.name,
    required this.assetPath,
  });

  @override
  bool operator ==(other) =>
      other is Divinity &&
      other.id == id &&
      other.assetPath == assetPath &&
      other.name == name;

  @override
  int get hashCode => id.hashCode ^ assetPath.hashCode ^ name.hashCode;
}
