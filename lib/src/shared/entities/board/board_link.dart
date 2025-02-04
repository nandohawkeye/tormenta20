class BoardLink {
  final String uuid;
  final String link;
  final String boardUuid;
  final String title;

  BoardLink({
    required this.uuid,
    required this.link,
    required this.boardUuid,
    required this.title,
  });

  @override
  bool operator ==(other) =>
      other is BoardLink &&
      other.uuid == uuid &&
      other.boardUuid == boardUuid &&
      other.link == link &&
      other.title == title;

  @override
  int get hashCode =>
      uuid.hashCode ^ boardUuid.hashCode ^ link.hashCode ^ title.hashCode;
}
