import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character.dart';
import 'package:tormenta20/src/modules/home/modules/character/character_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_card/character_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_screen_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class InitCharacterField extends StatefulWidget {
  const InitCharacterField({super.key});

  @override
  State<InitCharacterField> createState() => _InitCharacterFieldState();
}

class _InitCharacterFieldState extends State<InitCharacterField> {
  late final InitStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<InitStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: T20UI.allPadding,
          child: Labels('Personagens'),
        ),
        AnimatedBuilder(
          animation: _store,
          builder: (_, __) {
            final characters = _store.characters;

            if (characters.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.screenContentSpaceSize,
                  left: T20UI.screenContentSpaceSize,
                ),
                child: CharacterScreenButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddEditCharacter(),
                      ),
                    );
                  },
                ),
              );
            }

            return SizedBox(
              height: 120 * context.realTextScale,
              width: double.infinity,
              child: ListView.separated(
                itemCount: characters.length,
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.screenContentSpaceSize,
                  left: T20UI.screenContentSpaceSize,
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: T20UI.separatorBuilderHorizontal,
                itemBuilder: (_, index) {
                  return CharacterCard(
                    character: characters[index],
                    onTap: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CharacterScreen(
                            initial: characters[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
