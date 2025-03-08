import 'package:drift/drift.dart';

class GeneralSkillTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get parentUuid => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
