import 'package:drift/drift.dart';

class ClasseCharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get characterUuid => text()();
  IntColumn get typeIndex => integer()();
  IntColumn get level => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
