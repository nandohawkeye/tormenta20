import 'package:drift/drift.dart';

class BoardCombatTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get sessionUuid => text()();
  IntColumn get turn => integer()();
  IntColumn get startedAt => integer()();
  IntColumn get endAt => integer().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
