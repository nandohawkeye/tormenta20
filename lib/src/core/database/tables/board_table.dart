import 'package:drift/drift.dart';

class BoardTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  IntColumn get level => integer()();
  IntColumn get modeIndex => integer()();
  TextColumn get adventureName => text()();
  TextColumn get bannerPath => text().nullable()();
  TextColumn get desc => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get whatsGroupLink => text().nullable()();
  TextColumn get telegramGroupLink => text().nullable()();
  TextColumn get discordServerLink => text().nullable()();
  TextColumn get driveFilesLink => text().nullable()();
  BoolColumn get isFavorited => boolean()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
