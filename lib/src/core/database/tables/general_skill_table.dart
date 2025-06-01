import 'package:drift/drift.dart';

class GeneralSkillTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get parentUuid => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
