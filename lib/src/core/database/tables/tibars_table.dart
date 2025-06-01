import 'package:drift/drift.dart';

class TibarsTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get parentUuid => text()();
  TextColumn get storedIn => text().nullable()();
  IntColumn get gold => integer()();
  IntColumn get silver => integer()();
  IntColumn get bronze => integer()();
  BoolColumn get hasInitialRoll => boolean()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
