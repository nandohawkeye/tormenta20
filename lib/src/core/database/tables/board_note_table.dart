import 'package:drift/drift.dart';

class BoardNoteTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get note => text()();
  BoolColumn get isFavorited => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
