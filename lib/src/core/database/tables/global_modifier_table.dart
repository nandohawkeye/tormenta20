import 'package:drift/drift.dart';

class GlobalModifierTable extends Table {
  TextColumn get uuid => text()();
  TextColumn get parentUuid => text()();

  IntColumn get rool => integer()();
  IntColumn get bonusAttack => integer()();
  IntColumn get expertises => integer()();
  IntColumn get resistances => integer()();
  IntColumn get damage => integer()();
  IntColumn get defense => integer()();
  IntColumn get bonusArmor => integer()();
  IntColumn get bonusShield => integer()();
  IntColumn get others => integer()();

  @override
  Set<Column>? get primaryKey => {uuid};
}
