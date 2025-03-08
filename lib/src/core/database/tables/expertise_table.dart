import 'package:drift/drift.dart';

class ExpertiseTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text()();
  TextColumn get parentUuid => text()();
  IntColumn get id => integer()();
  IntColumn get atributeIndex => integer()();
  IntColumn get bonus => integer().nullable()();
  IntColumn get valueFinal => integer().nullable()();
  BoolColumn get isTrained => boolean()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
