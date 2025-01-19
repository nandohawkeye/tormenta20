import 'package:drift/drift.dart';

class BoardTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  IntColumn get level => integer()();
  IntColumn get typeIndex => integer()();
  TextColumn get adventureName => text()();
  TextColumn get bannerPath => text().nullable()();
  TextColumn get desc => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
