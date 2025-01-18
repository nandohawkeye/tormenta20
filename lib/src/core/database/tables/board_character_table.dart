import 'package:drift/drift.dart';

class BoardCharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get name => text()();
  TextColumn get playerName => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
