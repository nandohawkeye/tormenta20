import 'package:drift/drift.dart';

class BoardTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get adventureUuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
