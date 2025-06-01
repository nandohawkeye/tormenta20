import 'package:drift/drift.dart';

class AmmunitionTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  IntColumn get quantity => integer()();
  TextColumn get storedIn => text().nullable()();
  RealColumn get price => real().nullable()();
  TextColumn get desc => text().nullable()();
  TextColumn get improvements => text().nullable()();
  IntColumn get specialMaterialIndex => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
