import 'package:drift/drift.dart';

class MenaceLinkBoardTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get menaceUuid => text()();
  TextColumn get boardUuid => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
