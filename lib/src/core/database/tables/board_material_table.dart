import 'package:drift/drift.dart';

class BoardMaterialTable extends Table {
  TextColumn get uuid => text()();
  IntColumn get typeIndex => integer()();
  TextColumn get path => text()();
  TextColumn get boardUuid => text()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
