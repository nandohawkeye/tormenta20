import 'package:drift/drift.dart';

class BoardCombatTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get sessionUuid => text()();
  IntColumn get turn => integer()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
