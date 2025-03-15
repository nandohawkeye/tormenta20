import 'package:drift/drift.dart';

class BoardNoteTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get note => text()();
  BoolColumn get isFavorited => boolean()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
