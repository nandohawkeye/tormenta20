import 'package:drift/drift.dart';

class OriginTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get characterUuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
