import 'package:drift/drift.dart';

class BoardLinkTable extends Table {
  TextColumn get uuid => text()();
  IntColumn get typeIndex => integer()();
  TextColumn get link => text()();
  TextColumn get boardUuid => text()();
  TextColumn get title => text().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
