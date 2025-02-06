import 'package:drift/drift.dart';

class BoardClasseCharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get playerUuid => text()();
  IntColumn get typeIndex => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
