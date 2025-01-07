import 'package:drift/drift.dart';

class MagicCharacterTable extends Table {
  IntColumn get magicId => integer()();

  TextColumn get uuid => text()();

  TextColumn get grimoireUUid => text()();

  TextColumn get name => text()();

  TextColumn get desc => text()();

  IntColumn get circleLevel => integer()();

  IntColumn get typeIndex => integer()();

  IntColumn get schoolIndex => integer()();

  IntColumn get executionIndex => integer()();

  IntColumn get durationIndex => integer()();

  IntColumn get rangeIndex => integer()();

  TextColumn get resistence => text()();

  TextColumn get targetAreaEfect => text()();

  TextColumn get publication => text()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
