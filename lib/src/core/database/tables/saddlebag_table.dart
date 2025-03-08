import 'package:drift/drift.dart';

class SaddlebagTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  RealColumn get price => real().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
