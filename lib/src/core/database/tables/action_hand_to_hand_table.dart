import 'package:drift/drift.dart';

class ActionHandToHandTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get desc => text()();
  TextColumn get damageDices => text().nullable()();
  TextColumn get extraDamageDices => text().nullable()();
  IntColumn get pm => integer().nullable()();
  IntColumn get cd => integer().nullable()();
  TextColumn get equipamentUuid => text().nullable()();
  IntColumn get mediumDamageValue => integer().nullable()();
  IntColumn get critical => integer().nullable()();
  IntColumn get criticalMultiplier => integer().nullable()();
  IntColumn get typeIndex => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
