import 'package:drift/drift.dart';

class AdventureBackpackTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  TextColumn get suffix => text().nullable()();
  RealColumn get price => real().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
