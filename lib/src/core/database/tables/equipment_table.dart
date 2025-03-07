import 'package:drift/drift.dart';

class EquipmentTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get storedIn => text().nullable()();
  TextColumn get improvements => text().nullable()();
  IntColumn get specialMaterialIndex => integer().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
