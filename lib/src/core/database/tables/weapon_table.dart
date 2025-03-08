import 'package:drift/drift.dart';

class WeaponTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get storedIn => text().nullable()();
  TextColumn get improvements => text().nullable()();
  IntColumn get specialMaterialIndex => integer().nullable()();
  RealColumn get price => real().nullable()();
  TextColumn get desc => text().nullable()();
  RealColumn get ocupedSpace => real()();
  IntColumn get wieldableIndex => integer()();
  IntColumn get purposeIndex => integer()();
  IntColumn get proficiencyIndex => integer()();
  IntColumn get typeIndex => integer()();
  IntColumn get rangeIndex => integer()();
  IntColumn get critical => integer()();
  IntColumn get criticalMultiplier => integer()();
  IntColumn get steps => integer().nullable()();
  TextColumn get dices => text()();
  TextColumn get skillIndexes => text().nullable()();
  BoolColumn get isNatural => boolean()();
  BoolColumn get isUnarmed => boolean()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
