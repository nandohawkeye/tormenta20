import 'package:drift/drift.dart';

class ShieldTable extends Table {
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
  IntColumn get defenseBonus => integer()();
  IntColumn get penalty => integer()();
  BoolColumn get inUse => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
