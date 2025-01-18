import 'package:drift/drift.dart';

class AdventureTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text().nullable()();
  TextColumn get bannerPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
