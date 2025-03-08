import 'package:drift/drift.dart';

class GeneralItemTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get storedIn => text().nullable()();
  TextColumn get improvements => text().nullable()();
  IntColumn get specialMaterialIndex => integer().nullable()();
  RealColumn get price => real().nullable()();
  TextColumn get desc => text().nullable()();
  RealColumn get ocupedSpace => real()();
  IntColumn get typeIndex => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
