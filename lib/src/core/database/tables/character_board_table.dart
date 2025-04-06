import 'package:drift/drift.dart';

class CharacterBoardTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get parentuuid => text()();
  TextColumn get boarduuid => text()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get imageAsset => text().nullable()();
  TextColumn get displacement => text().nullable()();
  TextColumn get senses => text().nullable()();
  IntColumn get divinityId => integer().nullable()();
  IntColumn get initiative => integer()();
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
  IntColumn get typeIndex => integer()();
  IntColumn get creatureSizeIndex => integer()();
  IntColumn get broodIndex => integer()();
  IntColumn get combateRoleIndex => integer()();
  IntColumn get treasureTypeIndex => integer().nullable()();
  TextColumn get grimoireUuid => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  BoolColumn get isAlive => boolean()();
  IntColumn get aligmentIndex => integer()();
  IntColumn get currentLife => integer()();
  IntColumn get currentMana => integer()();
  TextColumn get inLeftHand => text().nullable()();
  TextColumn get inRightHand => text().nullable()();
  TextColumn get inTwoHands => text().nullable()();
  TextColumn get inWearableSlots => text().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
