import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/board_combat_table.dart';
import 'package:tormenta20/src/core/database/tables/board_session_table.dart';
import 'package:tormenta20/src/core/database/tables/board_link_table.dart';
import 'package:tormenta20/src/core/database/tables/board_material_table.dart';
import 'package:tormenta20/src/core/database/tables/board_note_table.dart';
import 'package:tormenta20/src/core/database/tables/board_player_table.dart';
import 'package:tormenta20/src/core/database/tables/board_table.dart';
import 'package:tormenta20/src/core/database/tables/character_board_table.dart';
import 'package:tormenta20/src/core/database/tables/character_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_link_board_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_table.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_dto.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/entities/board/board_link_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_materials_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/entities/board/board_note_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/entities/board/board_player_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_adapters.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_dto.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'board_dao.g.dart';

@DriftAccessor(tables: [
  BoardTable,
  BoardMaterialTable,
  BoardPlayerTable,
  BoardSessionTable,
  BoardLinkTable,
  BoardCombatTable,
  BoardNoteTable,
  MenaceLinkBoardTable,
  MenaceTable,
  CharacterBoardTable,
  CharacterTable,
])
class BoardDAO extends DatabaseAccessor<AppDatabase> with _$BoardDAOMixin {
  BoardDAO(super.db);

  Future<Failure?> saveCombat(BoardCombat combat) async {
    try {
      await into(boardCombatTable)
          .insertOnConflictUpdate(BoardCombatAdapters.toCompanion(combat));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveSession(BoardSession session) async {
    try {
      await into(boardSessionTable)
          .insertOnConflictUpdate(BoardSessionAdapters.toCompanion(session));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

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

  Future<Failure?> saveNote(BoardNote note) async {
    try {
      await into(boardNoteTable)
          .insertOnConflictUpdate(BoardNoteAdapters.toCompanion(note));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveLink(BoardLink link) async {
    try {
      await into(boardLinkTable)
          .insertOnConflictUpdate(BoardLinkAdapters.toCompanion(link));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteLink(BoardLink link) async {
    try {
      await (delete(boardLinkTable)..where((tbl) => tbl.uuid.equals(link.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteMaterials(List<String> uuids) async {
    try {
      await Future.forEach(uuids, (uuid) async {
        await (delete(boardMaterialTable)
              ..where((tbl) => tbl.uuid.equals(uuid)))
            .go();
      });

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteNote(BoardNote note) async {
    try {
      await (delete(boardNoteTable)..where((tbl) => tbl.uuid.equals(note.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteBoard(Board board) async {
    final players = board.players;
    final links = board.links;
    final materials = board.materials;

    try {
      await Future.forEach(players, (player) async {
        await (delete(boardPlayerTable)
              ..where((tbl) => tbl.uuid.equals(player.uuid)))
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
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            boardPlayerTable, [BoardPlayerAdapters.toCompanion(player)]);
      });

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveBoardCharacter(CharacterBoard character) async {
    try {
      // await batch((batch) {
      //   batch.insertAllOnConflictUpdate(
      //       characterBoardTable, [CharacterBoardAdapters.toCompanion(character)]);
      // });

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteBoardCharacter(CharacterBoard character) async {
    try {
      await (delete(characterBoardTable)
            ..where((tbl) => tbl.uuid.equals(character.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> saveBoard({
    required Board entity,
    required List<String> materialsToDelete,
    required List<String> linksToDelete,
  }) async {
    try {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            boardTable, [BoardAdapters.toCompanion(entity)]);
        batch.insertAllOnConflictUpdate(
            boardLinkTable, entity.links.map(BoardLinkAdapters.toCompanion));
        batch.insertAllOnConflictUpdate(boardMaterialTable,
            entity.materials.map(BoardMaterialsAdapters.toCompanion));
      });

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

  Future<({Failure? failure, Stream<List<BoardSession>>? sessions})>
      watchSessions(String boardUuid) async {
    try {
      return (
        failure: null,
        sessions: (select(boardSessionTable)
              ..where((tbl) => tbl.boardUuid.equals(boardUuid)))
            .join([
              leftOuterJoin(
                boardCombatTable,
                boardSessionTable.uuid.equalsExp(
                  boardCombatTable.sessionUuid,
                ),
              ),
            ])
            .watch()
            .map((rows) {
              Map<String, BoardSessionDto> sessionDto = {};

              for (var row in rows) {
                final sessionData = row.readTable(boardSessionTable);
                final combatData = row.readTableOrNull(boardCombatTable);

                if (!(sessionDto.containsKey(sessionData.uuid))) {
                  sessionDto.addAll(
                      {sessionData.uuid: BoardSessionDto(data: sessionData)});
                }

                if (combatData != null &&
                    !(sessionDto[sessionData.uuid]!
                        .combats
                        .any((combat) => combat.uuid == combatData.uuid))) {
                  sessionDto[sessionData.uuid]!.combats.add(combatData);
                }
              }

              return sessionDto.entries
                  .map((entry) => BoardSessionAdapters.fromDto(entry.value))
                  .toList();
            })
      );
    } catch (e) {
      return (failure: Failure(e.toString()), sessions: null);
    }
  }

  Future<({Failure? failure, Stream<List<BoardNote>>? notes})> watchNotes(
      String boardUuid) async {
    try {
      return (
        failure: null,
        notes: (select(boardNoteTable)
              ..where((tbl) => tbl.boardUuid.equals(boardUuid)))
            .watch()
            .map((rows) => rows.map(BoardNoteAdapters.fromDriftData).toList())
      );
    } catch (e) {
      return (failure: Failure(e.toString()), notes: null);
    }
  }

  Future<({Failure? failure, Stream<List<BoardLink>>? links})> watchLinks(
      String boardUuid) async {
    try {
      return (
        failure: null,
        links: (select(boardLinkTable)
              ..where((tbl) => tbl.boardUuid.equals(boardUuid)))
            .watch()
            .map((rows) => rows.map(BoardLinkAdapters.fromDriftData).toList())
      );
    } catch (e) {
      return (failure: Failure(e.toString()), links: null);
    }
  }

  Future<({Failure? failure, Stream<List<BoardMaterial>>? materials})>
      watchMaterials(String boardUuid) async {
    try {
      return (
        failure: null,
        materials: (select(boardMaterialTable)
              ..where((tbl) => tbl.boardUuid.equals(boardUuid)))
            .watch()
            .map((rows) =>
                rows.map(BoardMaterialsAdapters.fromDriftData).toList())
      );
    } catch (e) {
      return (failure: Failure(e.toString()), materials: null);
    }
  }

  Future<({Failure? failure, Stream<List<Board>>? boards})>
      watchBoards() async {
    final query = select(boardTable).join([
      leftOuterJoin(
        boardPlayerTable,
        boardTable.uuid.equalsExp(
          boardPlayerTable.boardUuid,
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
      leftOuterJoin(
        boardNoteTable,
        boardTable.uuid.equalsExp(
          boardNoteTable.boardUuid,
        ),
      ),
      leftOuterJoin(
        boardSessionTable,
        boardTable.uuid.equalsExp(
          boardSessionTable.boardUuid,
        ),
      ),
      leftOuterJoin(
        boardCombatTable,
        boardTable.uuid.equalsExp(
          boardCombatTable.boardUuid,
        ),
      ),
      leftOuterJoin(
        menaceLinkBoardTable,
        boardTable.uuid.equalsExp(
          menaceLinkBoardTable.boardUuid,
        ),
      ),
      leftOuterJoin(
        menaceTable,
        menaceLinkBoardTable.menaceUuid.equalsExp(
          menaceTable.uuid,
        ),
      ),
    ])
      ..addColumns([
        boardTable.name,
        boardTable.adventureName,
        boardTable.bannerPath,
        boardTable.createdAt,
        boardTable.updatedAt,
      ])
      ..orderBy([
        OrderingTerm(
          expression: boardTable.updatedAt,
          mode: OrderingMode.desc,
        )
      ]);
    try {
      return (
        failure: null,
        boards: query.watch().map((rows) {
          Map<String, BoardDriftDto> boardsDTO = {};

          for (var row in rows) {
            final boardData = row.readTable(boardTable);
            final playerData = row.readTableOrNull(boardPlayerTable);
            final linkData = row.readTableOrNull(boardLinkTable);
            final materialData = row.readTableOrNull(boardMaterialTable);
            final noteData = row.readTableOrNull(boardNoteTable);
            final sessionData = row.readTableOrNull(boardSessionTable);
            final combatData = row.readTableOrNull(boardCombatTable);
            final menaceLinkData = row.readTableOrNull(menaceLinkBoardTable);
            final menaceData = row.readTableOrNull(menaceTable);

            if (!(boardsDTO.containsKey(boardData.uuid))) {
              boardsDTO.addAll(
                  {boardData.uuid: BoardDriftDto(boardData: boardData)});
            }

            if (playerData != null &&
                !(boardsDTO[boardData.uuid]!
                    .playersData
                    .any((data) => data.uuid == playerData.uuid))) {
              boardsDTO[boardData.uuid]!.playersData.add(playerData);
            }

            if (noteData != null &&
                !(boardsDTO[boardData.uuid]!
                    .notesData
                    .any((data) => data.uuid == noteData.uuid))) {
              boardsDTO[boardData.uuid]!.notesData.add(noteData);
            }

            if (menaceLinkData != null &&
                !(boardsDTO[boardData.uuid]!
                    .linkMenaceData
                    .any((data) => data.uuid == menaceLinkData.uuid))) {
              boardsDTO[boardData.uuid]!.linkMenaceData.add(menaceLinkData);
            }

            if (menaceData != null &&
                !(boardsDTO[boardData.uuid]!
                    .menaceData
                    .any((data) => data.uuid == menaceData.uuid))) {
              boardsDTO[boardData.uuid]!.menaceData.add(menaceData);
            }

            if (sessionData != null &&
                !(boardsDTO[boardData.uuid]!
                    .sessionsData
                    .any((data) => data.uuid == sessionData.uuid))) {
              boardsDTO[boardData.uuid]!.sessionsData.add(sessionData);
            }

            if (combatData != null &&
                !(boardsDTO[boardData.uuid]!
                    .combatsData
                    .any((data) => data.uuid == combatData.uuid))) {
              boardsDTO[boardData.uuid]!.combatsData.add(combatData);
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

  Future<({Failure? failure, Stream<List<Board>>? boards})>
      watchBoardsWithLinkMenace() async {
    try {
      return (
        failure: null,
        boards: (select(boardTable)
              ..where((tbl) => tbl.modeIndex.equals(0))
              ..addColumns([
                boardTable.name,
                boardTable.adventureName,
                boardTable.bannerPath,
                boardTable.createdAt,
                boardTable.updatedAt,
              ]))
            .join([
              leftOuterJoin(
                menaceLinkBoardTable,
                boardTable.uuid.equalsExp(
                  menaceLinkBoardTable.boardUuid,
                ),
              ),
            ])
            .watch()
            .map((rows) {
              Map<String, BoardDriftDto> boardsDTO = {};

              for (var row in rows) {
                final boardData = row.readTable(boardTable);
                final menaceLinkData =
                    row.readTableOrNull(menaceLinkBoardTable);

                if (!(boardsDTO.containsKey(boardData.uuid))) {
                  boardsDTO.addAll(
                      {boardData.uuid: BoardDriftDto(boardData: boardData)});
                }

                if (menaceLinkData != null &&
                    !(boardsDTO[boardData.uuid]!
                        .linkMenaceData
                        .any((data) => data.uuid == menaceLinkData.uuid))) {
                  boardsDTO[boardData.uuid]!.linkMenaceData.add(menaceLinkData);
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

  Future<({Failure? failure, Stream<List<Board>>? boards})>
      watchOnlyBoardsToCharacters() async {
    try {
      return (
        failure: null,
        boards: (select(boardTable)
              ..where((tbl) => tbl.modeIndex.equals(1))
              ..addColumns([
                boardTable.name,
                boardTable.adventureName,
                boardTable.bannerPath,
                boardTable.createdAt,
                boardTable.updatedAt,
              ]))
            .watch()
            .map((rows) {
          List<Board> boards = [];

          for (var row in rows) {
            boards.add(BoardAdapters.fromDriftData(row));
          }

          return boards;
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
              leftOuterJoin(
                boardNoteTable,
                boardTable.uuid.equalsExp(
                  boardNoteTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardSessionTable,
                boardTable.uuid.equalsExp(
                  boardSessionTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                boardCombatTable,
                boardTable.uuid.equalsExp(
                  boardCombatTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                menaceLinkBoardTable,
                boardTable.uuid.equalsExp(
                  menaceLinkBoardTable.boardUuid,
                ),
              ),
              leftOuterJoin(
                menaceTable,
                menaceLinkBoardTable.menaceUuid.equalsExp(
                  menaceTable.uuid,
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
                  final noteData = row.readTableOrNull(boardNoteTable);
                  final sessionData = row.readTableOrNull(boardSessionTable);
                  final combatData = row.readTableOrNull(boardCombatTable);
                  final menaceLinkData =
                      row.readTableOrNull(menaceLinkBoardTable);
                  final menaceData = row.readTableOrNull(menaceTable);

                  if (!(boardsDTO.containsKey(boardData.uuid))) {
                    boardsDTO.addAll(
                        {boardData.uuid: BoardDriftDto(boardData: boardData)});
                  }

                  if (noteData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .notesData
                          .any((data) => data.uuid == noteData.uuid))) {
                    boardsDTO[boardData.uuid]!.notesData.add(noteData);
                  }

                  if (sessionData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .sessionsData
                          .any((data) => data.uuid == sessionData.uuid))) {
                    boardsDTO[boardData.uuid]!.sessionsData.add(sessionData);
                  }

                  if (combatData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .combatsData
                          .any((data) => data.uuid == combatData.uuid))) {
                    boardsDTO[boardData.uuid]!.combatsData.add(combatData);
                  }

                  if (menaceLinkData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .linkMenaceData
                          .any((data) => data.uuid == menaceLinkData.uuid))) {
                    boardsDTO[boardData.uuid]!
                        .linkMenaceData
                        .add(menaceLinkData);
                  }

                  if (menaceData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .menaceData
                          .any((data) => data.uuid == menaceData.uuid))) {
                    boardsDTO[boardData.uuid]!.menaceData.add(menaceData);
                  }

                  if (playerData != null &&
                      !(boardsDTO[boardData.uuid]!
                          .playersData
                          .any((data) => data.uuid == playerData.uuid))) {
                    boardsDTO[boardData.uuid]!.playersData.add(playerData);
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
