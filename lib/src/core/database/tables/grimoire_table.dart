import 'package:drift/drift.dart';

class GrimoireTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text().nullable()();
  TextColumn get iconAsset => text()();
  //TODO remove this latter
  IntColumn get colorInt => integer()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
