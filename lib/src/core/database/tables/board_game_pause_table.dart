import 'package:drift/drift.dart';

class BoardGamePauseTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardGameUuid => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
