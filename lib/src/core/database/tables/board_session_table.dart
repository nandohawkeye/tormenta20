import 'package:drift/drift.dart';

class BoardSessionTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  IntColumn get environmentIndex => integer().nullable()();
  IntColumn get startedAt => integer()();
  IntColumn get endAt => integer().nullable()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
