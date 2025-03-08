import 'package:drift/drift.dart';

class MenaceTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  TextColumn get displacement => text().nullable()();
  TextColumn get casterInfos => text().nullable()();
  TextColumn get desc => text().nullable()();
  TextColumn get extraInfos => text().nullable()();
  TextColumn get senses => text().nullable()();
  TextColumn get nd => text()();
  IntColumn get divinityId => integer().nullable()();
  IntColumn get initiative => integer()();
  IntColumn get perception => integer()();
  IntColumn get defense => integer()();
  IntColumn get life => integer()();
  IntColumn get mana => integer()();
  IntColumn get fortResistence => integer()();
  IntColumn get refResistence => integer()();
  IntColumn get vonResistence => integer()();
  IntColumn get strength => integer()();
  IntColumn get dexterity => integer()();
  IntColumn get constitution => integer()();
  IntColumn get intelligence => integer()();
  IntColumn get wisdom => integer()();
  IntColumn get charisma => integer()();
  IntColumn get typeIndex => integer()();
  IntColumn get creatureSizeIndex => integer()();
  IntColumn get combateRoleIndex => integer()();
  IntColumn get treasureTypeIndex => integer().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
