import 'package:drift/drift.dart';

class CharacterConditionTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get parentUuid => text()();
  IntColumn get conditionId => integer()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get atributesIndexes => text().nullable()();
  TextColumn get expertisesIndexes => text().nullable()();
  TextColumn get dice => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  BoolColumn get inAllExpertises => boolean()();
  BoolColumn get inMana => boolean()();
  BoolColumn get inAttack => boolean()();
  BoolColumn get inDefense => boolean()();
  BoolColumn get inDisplacment => boolean()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
