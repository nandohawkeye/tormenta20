import 'package:drift/drift.dart';

class BoardCharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get characterName => text()();
  TextColumn get playerName => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  IntColumn get broodIndex => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get classeIndexes => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
