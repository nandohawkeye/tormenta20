import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_grimorie_card.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicSelectedGrimories extends StatelessWidget {
  const MagicSelectedGrimories({
    super.key,
    required this.store,
    required this.magic,
    required this.enableGrimories,
  });

  final MagicSelectedStore store;
  final Magic magic;
  final bool enableGrimories;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) {
        return store.grimories.isEmpty || !enableGrimories
            ? const SizedBox.shrink()
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  T20UI.spaceHeight,
                  LimitedBox(
                    maxHeight: T20UI.inputHeight *
                        MediaQuery.of(context).textScaler.scale(1),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: T20UI.spaceSize - 4),
                      scrollDirection: Axis.horizontal,
                      itemCount: store.grimories.length,
                      separatorBuilder: T20UI.separatorBuilderHorizontal,
                      itemBuilder: (_, index) => MagicSelectedGrimorieCard(
                        grimoire: store.grimories[index],
                        magic: magic,
                        onTap: store.onTapGrimoire,
                      ),
                    ),
                  ),
                  T20UI.spaceHeight,
                  const Divider(),
                ],
              );
      },
    );
  }
}
