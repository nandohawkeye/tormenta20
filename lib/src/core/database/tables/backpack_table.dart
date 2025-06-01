import 'package:drift/drift.dart';

class BackpackTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get suffix => text().nullable()();
  RealColumn get price => real().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
