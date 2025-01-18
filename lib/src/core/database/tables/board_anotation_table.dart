import 'package:drift/drift.dart';

class BoardAnotationTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  IntColumn get level => integer()();
  TextColumn get desc => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
