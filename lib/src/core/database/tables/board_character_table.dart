import 'package:drift/drift.dart';

class BoardCharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get name => text()();
  TextColumn get playerName => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  IntColumn get broodIndex => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
