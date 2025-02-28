import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_player_image.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_players_rest_count.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardCardPlayersTokens extends StatelessWidget {
  const BoardCardPlayersTokens({
    super.key,
    required this.players,
    required this.width,
  });

  final List<BoardPlayer> players;
  final double width;

  @override
  Widget build(BuildContext context) {
    final minusSize = (38 * context.realTextScale);
    final defaultSize = (40 * context.realTextScale);

    if (players.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 8, left: 4, right: 4),
        child: Text(
          'Adicione personagens para começar a jogar nesta mesa',
          maxLines: 2,
        ),
      );
    }

    final sublist = players.length > 5 ? players.sublist(0, 5) : players;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.only(bottom: T20UI.smallSpaceSize),
        child: SizedBox(
          height: (40 * context.realTextScale),
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(
              players.length > sublist.length
                  ? (sublist.length + 1)
                  : sublist.length,
              (index) {
                if (index == sublist.length) {
                  return BoardCardPlayersRestCount(
                    index: index,
                    allLength: players.length,
                    sublistLength: sublist.length,
                    minusSize: minusSize,
                    defaultSize: defaultSize,
                  );
                }

                return BoardCardPlayerImage(
                  index: index,
                  player: sublist[index],
                  minusSize: minusSize,
                  defaultSize: defaultSize,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
