import 'package:drift/drift.dart';

class BoardPlayerTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get characterName => text()();
  TextColumn get playerName => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  IntColumn get broodIndex => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get life => integer()();
  IntColumn get mana => integer()();
  IntColumn get defense => integer()();
  IntColumn get initiative => integer()();
  BoolColumn get isAlive => boolean()();
  TextColumn get classeIndexes => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
