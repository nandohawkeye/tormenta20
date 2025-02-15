import 'package:drift/drift.dart';

class BoardPlayerTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get boardUuid => text()();
  TextColumn get characterName => text()();
  TextColumn get playerName => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  IntColumn get broodIndex => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get life => integer()();
  IntColumn get mana => integer()();
  IntColumn get defense => integer()();
  BoolColumn get isAlive => boolean()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
