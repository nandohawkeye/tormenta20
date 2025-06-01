import 'package:drift/drift.dart';

class PowerTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get characterUuid => text()();
  IntColumn get typeIndex => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
