import 'package:drift/drift.dart';

class GrimoireTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get desc => text().nullable()();
  TextColumn get iconAsset => text()();
  //TODO convert to all dates for interger
  // IntColumn get data => integer()();
  // DateTime.fromMillisecondsSinceEpoch(tarefa.data),
  // data.millisecondsSinceEpoch
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
