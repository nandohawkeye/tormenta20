import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/board_character_table.dart';
import 'package:tormenta20/src/core/database/tables/board_classe_caracter_table.dart';
import 'package:tormenta20/src/core/database/tables/board_game_table.dart';
import 'package:tormenta20/src/core/database/tables/board_link_table.dart';
import 'package:tormenta20/src/core/database/tables/board_material_table.dart';
import 'package:tormenta20/src/core/database/tables/board_note_table.dart';
import 'package:tormenta20/src/core/database/tables/board_player_table.dart';
import 'package:tormenta20/src/core/database/tables/board_table.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_dto.dart';
import 'package:tormenta20/src/shared/entities/board/board_link_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_materials_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_dto.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/character_classe_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'board_dao.g.dart';

@DriftAccessor(tables: [
  BoardTable,
  BoardMaterialTable,
  BoardCharacterTable,
  BoardPlayerTable,
  BoardGameTable,
  BoardLinkTable,
  BoardNoteTable,
  BoardClasseCharacterTable
])
class BoardDAO extends DatabaseAccessor<AppDatabase> with _$BoardDAOMixin {
  BoardDAO(super.db);

  Future<Failure?> saveMaterials(List<BoardMaterial> materials) async {
    try {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(boardMaterialTable,
            materials.map(BoardMaterialsAdapters.toCompanion));
      });

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteBoard(Board board) async {
    final players = board.players;
    final links = board.links;
    final materials = board.materials;
    List<CharacterClasse> classes = [];

    try {
      await Future.forEach(players, (player) async {
        classes.addAll(player.classes);
        await (delete(boardPlayerTable)
              ..where((tbl) => tbl.uuid.equals(player.uuid)))
            .go();
      });

      await Future.forEach(classes, (classe) async {
        await (delete(boardClasseCharacterTable)
              ..where((tbl) => tbl.uuid.equals(classe.uuid)))
            .go();
      });

      await Future.forEach(links, (link) async {
        await (delete(boardLinkTable)
              ..where((tbl) => tbl.uuid.equals(link.uuid)))
            .go();
      });

      await Future.forEach(materials, (material) async {
        await (delete(boardMaterialTable)
              ..where((tbl) => tbl.uuid.equals(material.uuid)))
            .go();
      });

      await (delete(boardTable)..where((tbl) => tbl.uuid.equals(board.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteBoardPlayer(BoardPlayer player) async {
    try {
      await (delete(boardClasseCharacterTable)
            ..where((tbl) => tbl.playerUuid.equals(player.uuid)))
          .go();

      await (delete(boardPlayerTable)
            ..where((tbl) => tbl.uuid.equals(player.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveBoardPlayer(BoardPlayer player) async {
    try {
      await (delete(boardClasseCharacterTable)
            ..where((tbl) => tbl.playerUuid.equals(player.uuid)))
          .go();

      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            boardPlayerTable, [BoardPlayerAdapters.toCompanion(player)]);
        batch.insertAllOnConflictUpdate(boardClasseCharacterTable,
            player.classes.map(CharacterClasseAdapters.toCompanion));
      });

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveBoard({
    required Board entity,
    required List<String> playersToDelete,
    required List<String> materialsToDelete,
    required List<String> linksToDelete,
  }) async {
    try {
      List<CharacterClasse> classes = [];

      if (entity.players.isNotEmpty) {
        for (var player in entity.players) {
          classes.addAll(player.classes);
        }

        Future.forEach(entity.players, (player) async {
          await (delete(boardClasseCharacterTable)
                ..where((tbl) => tbl.playerUuid.equals(player.uuid)))
              .go();
        });
      }

      print('classes: $classes');

      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            boardTable, [BoardAdapters.toCompanion(entity)]);
        batch.insertAllOnConflictUpdate(boardPlayerTable,
            entity.players.map(BoardPlayerAdapters.toCompanion));
        batch.insertAllOnConflictUpdate(boardClasseCharacterTable,
            classes.map(CharacterClasseAdapters.toCompanion));
        batch.insertAllOnConflictUpdate(
            boardLinkTable, entity.links.map(BoardLinkAdapters.toCompanion));
        batch.insertAllOnConflictUpdate(boardMaterialTable,
            entity.materials.map(BoardMaterialsAdapters.toCompanion));
      });

      if (playersToDelete.isNotEmpty) {
        Future.forEach(playersToDelete, (uuid) async {
          await (delete(boardPlayerTable)
                ..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      if (materialsToDelete.isNotEmpty) {
        Future.forEach(materialsToDelete, (uuid) async {
          await (delete(boardMaterialTable)
                ..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      if (linksToDelete.isNotEmpty) {
        Future.forEach(linksToDelete, (uuid) async {
          await (delete(boardLinkTable)..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in save board: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<({Failure? failure, Stream<List<Board>>? boards})>
      watchBoards() async {
    try {
      return (
        failure: null,
        boards: (select(boardTable))
            .join([
              leftOuterJoin(
                boardPlayerTable,
                boardTable.uuid.equalsExp(
                  boardPlayerTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardClasseCharacterTable,
                boardPlayerTable.uuid.equalsExp(
                  boardClasseCharacterTable.playerUuid,
                ),
              ),
              leftOuterJoin(
                boardLinkTable,
                boardTable.uuid.equalsExp(
                  boardLinkTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardMaterialTable,
                boardTable.uuid.equalsExp(
                  boardMaterialTable.boardUuid,
                ),
              ),
            ])
            .watch()
            .map((rows) {
              Map<String, BoardDriftDto> boardsDTO = {};

              for (var row in rows) {
                final boardData = row.readTable(boardTable);
                final playerData = row.readTableOrNull(boardPlayerTable);
                final linkData = row.readTableOrNull(boardLinkTable);
                final materialData = row.readTableOrNull(boardMaterialTable);
                final classeCharacterData =
                    row.readTableOrNull(boardClasseCharacterTable);

                if (!(boardsDTO.containsKey(boardData.uuid))) {
                  boardsDTO.addAll(
                      {boardData.uuid: BoardDriftDto(boardData: boardData)});
                }

                if (playerData != null &&
                    !(boardsDTO[boardData.uuid]!
                        .playersData
                        .any((dto) => dto.data.uuid == playerData.uuid))) {
                  boardsDTO[boardData.uuid]!
                      .playersData
                      .add(BoardPlayerDto(data: playerData));
                }

                print('classe data: $classeCharacterData');

                if (playerData != null &&
                    classeCharacterData != null &&
                    !(boardsDTO[boardData.uuid]!
                        .playersData
                        .firstWhere((dto) => dto.data.uuid == playerData.uuid)
                        .classesdata
                        .any((c) => c.uuid == classeCharacterData.uuid))) {
                  boardsDTO[boardData.uuid]!
                      .playersData
                      .firstWhere((dto) => dto.data.uuid == playerData.uuid)
                      .classesdata
                      .add(classeCharacterData);
                }

                if (linkData != null &&
                    !(boardsDTO[boardData.uuid]!
                        .linksData
                        .any((l) => l.uuid == linkData.uuid))) {
                  boardsDTO[boardData.uuid]!.linksData.add(linkData);
                }

                if (materialData != null &&
                    !(boardsDTO[boardData.uuid]!
                        .materialsData
                        .any((m) => m.uuid == materialData.uuid))) {
                  boardsDTO[boardData.uuid]!.materialsData.add(materialData);
                }
              }

              return boardsDTO.values
                  .map((g) => BoardAdapters.fromDriftDto(g))
                  .toList();
            })
      );
    } catch (e) {
      return (failure: Failure(e.toString()), boards: null);
    }
  }

  Future<({Failure? failure, Stream<Board?>? boards})> watchSingleBoard(
      String uuid) async {
    try {
      return (
        failure: null,
        boards: (select(boardTable)..where((tbl) => tbl.uuid.equals(uuid)))
            .join([
              leftOuterJoin(
                boardPlayerTable,
                boardTable.uuid.equalsExp(
                  boardPlayerTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardClasseCharacterTable,
                boardPlayerTable.uuid.equalsExp(
                  boardClasseCharacterTable.playerUuid,
                ),
              ),
              leftOuterJoin(
                boardLinkTable,
                boardTable.uuid.equalsExp(
                  boardLinkTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardMaterialTable,
                boardTable.uuid.equalsExp(
                  boardMaterialTable.boardUuid,
                ),
              ),
            ])
            .watch()
            .map(
              (rows) {
                Map<String, BoardDriftDto> boardsDTO = {};

                for (var row in rows) {
                  final boardData = row.readTable(boardTable);
                  final playerData = row.readTableOrNull(boardPlayerTable);
                  final linkData = row.readTableOrNull(boardLinkTable);
                  final materialData = row.readTableOrNull(boardMaterialTable);
                  final classeCharacterData =
                      row.readTableOrNull(boardClasseCharacterTable);

                  if (!(boardsDTO.containsKey(boardData.uuid))) {
                    boardsDTO.addAll(
                        {boardData.uuid: BoardDriftDto(boardData: boardData)});
                  }

                  if (playerData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .playersData
                          .any((dto) => dto.data.uuid == playerData.uuid))) {
                    boardsDTO[boardData.uuid]!
                        .playersData
                        .add(BoardPlayerDto(data: playerData));
                  }

                  if (playerData != null &&
                      classeCharacterData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .playersData
                          .firstWhere((dto) => dto.data.uuid == playerData.uuid)
                          .classesdata
                          .any((c) => c.uuid == classeCharacterData.uuid))) {
                    boardsDTO[boardData.uuid]!
                        .playersData
                        .firstWhere((dto) => dto.data.uuid == playerData.uuid)
                        .classesdata
                        .add(classeCharacterData);
                  }

                  if (linkData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .linksData
                          .any((l) => l.uuid == linkData.uuid))) {
                    boardsDTO[boardData.uuid]!.linksData.add(linkData);
                  }

                  if (materialData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .materialsData
                          .any((m) => m.uuid == materialData.uuid))) {
                    boardsDTO[boardData.uuid]!.materialsData.add(materialData);
                  }
                }

                if (boardsDTO.values.isEmpty) {
                  return null;
                }

                return boardsDTO.values
                    .map((g) => BoardAdapters.fromDriftDto(g))
                    .toList()
                    .first;
              },
            )
      );
    } catch (e) {
      return (failure: Failure(e.toString()), boards: null);
    }
  }
}
