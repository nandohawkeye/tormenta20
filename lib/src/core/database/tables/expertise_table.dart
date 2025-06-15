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
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  BoolColumn get onlyTrained => boolean().nullable()();
  BoolColumn get armorPenalty => boolean().nullable()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
