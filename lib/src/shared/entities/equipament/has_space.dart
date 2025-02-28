class HasSpace {
  final int maxSpaces;
  final int normalSpaces;

  HasSpace({
    required this.maxSpaces,
    required this.normalSpaces,
  });

  @override
  bool operator ==(other) =>
      other is HasSpace &&
      other.maxSpaces == maxSpaces &&
      other.normalSpaces == normalSpaces;

  @override
  int get hashCode => maxSpaces.hashCode ^ normalSpaces.hashCode;
}
