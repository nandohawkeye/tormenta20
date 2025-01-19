import 'package:drift/drift.dart';

class BoardGameTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
