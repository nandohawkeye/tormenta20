import 'package:drift/drift.dart';

class BoardLinkTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get link => text()();
  TextColumn get boardUuid => text()();
  TextColumn get title => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
