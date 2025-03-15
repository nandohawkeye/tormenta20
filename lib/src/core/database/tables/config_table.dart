import 'package:drift/drift.dart';

class ConfigTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get modeIndex => integer().withDefault(const Constant(0))();
  BoolColumn get showApresetation =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column>? get primaryKey => {id};
}
