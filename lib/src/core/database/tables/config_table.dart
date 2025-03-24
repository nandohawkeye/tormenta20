import 'package:drift/drift.dart';

class ConfigTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get modeIndex => integer().withDefault(const Constant(0))();
  BoolColumn get showApresetation =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get enableBottomBackButton =>
      boolean().withDefault(const Constant(true))();

  @override
  Set<Column>? get primaryKey => {id};
}
