import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_store.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/grimoire_characters_list/grimorie_characters_list_card.dart';

class GrimorieCharactersList extends StatelessWidget {
  const GrimorieCharactersList(this.store, {super.key});

  final GrimorieStore store;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: store,
        builder: (_, __) {
          final characters = store.characters;
          final grimoireCharacters = store.grimoire.characters;

          if (characters.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: T20UI.inputHeight,
                child: ListView.separated(
                  padding: T20UI.horizontallScreenPadding,
                  scrollDirection: Axis.horizontal,
                  itemCount: characters.length,
                  separatorBuilder: T20UI.separatorBuilderHorizontal,
                  itemBuilder: (_, index) {
                    return GrimorieCharactersListCard(
                      character: characters[index],
                      grimoireCharacters: grimoireCharacters,
                      onAdd: store.onAddCharacter,
                      onRemove: store.onRemoveCharacter,
                    );
                  },
                ),
              ),
              T20UI.spaceHeight,
              const Divider(),
              T20UI.spaceHeight,
            ],
          );
        },
      ),
    );
  }
}
