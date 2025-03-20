import 'package:drift/drift.dart';

class CharacterTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  TextColumn get displacement => text().nullable()();
  TextColumn get senses => text().nullable()();
  IntColumn get divinityId => integer().nullable()();
  IntColumn get perception => integer()();
  IntColumn get defense => integer()();
  IntColumn get life => integer()();
  IntColumn get mana => integer()();
  IntColumn get strength => integer()();
  IntColumn get dexterity => integer()();
  IntColumn get constitution => integer()();
  IntColumn get intelligence => integer()();
  IntColumn get wisdom => integer()();
  IntColumn get charisma => integer()();
  IntColumn get creatureSizeIndex => integer()();
  IntColumn get broodIndex => integer()();
  TextColumn get grimoireUuid => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get trainedExpertisesIndexes => text().nullable()();
  IntColumn get aligmentIndex => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
