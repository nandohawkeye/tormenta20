import 'package:tormenta20/src/core/database/app_database.dart';

class BoardPlayerDto {
  final BoardPlayerTableData data;
  List<BoardClasseCharacterTableData> classesdata = [];

  BoardPlayerDto({required this.data});
}
