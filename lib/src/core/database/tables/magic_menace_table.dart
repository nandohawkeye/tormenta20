import 'package:drift/drift.dart';

class MagicMenaceTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get resumedDesc => text()();
  TextColumn get menaceUuid => text()();
  IntColumn get magicBaseId => integer()();
  IntColumn get pm => integer().nullable()();
  IntColumn get cd => integer().nullable()();
  IntColumn get mediumDamageValue => integer().nullable()();
  TextColumn get damageDices => text().nullable()();
  TextColumn get extraDamageDices => text().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
