import 'package:drift/drift.dart';

class BoardSessionTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  IntColumn get environmentIndex => integer().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
