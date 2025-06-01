import 'package:drift/drift.dart';

class OriginTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get characterUuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
