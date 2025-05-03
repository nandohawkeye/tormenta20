// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card/grimoire_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class GrimoireHeader extends StatelessWidget {
  const GrimoireHeader(this.store, {super.key});

  final GrimoriesStore store;

  @override
  Widget build(BuildContext context) {
    Future<void> addGrimoire() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AddGrimorieScreen(initialGrimoire: null),
        ),
      ).then((result) async {
        if (result != null) {
          await store.insertGrimoire(result).then((failure) {
            if (failure == null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GrimorieScreen(grimoire: result),
                ),
              );
            }
          });
        }
      });
    }

    final listHeight = 110 * MediaQuery.of(context).textScaler.scale(1);
    const double width = 235;

    //TODO parei nesse

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: T20UI.allPadding,
          child: Labels('Grimórios'),
        ),
        AnimatedBuilder(
          animation: store,
          builder: (_, __) => store.grimories.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  child: ScreenImageButton(
                    imageAsset: Assets.images.spellbook.path,
                    title: 'Grimórios',
                    subtitle:
                        'Crie um grimório, coloque suas magias favoritas e vincule a seus personagens.',
                    onTap: () async => await addGrimoire(),
                  ),
                )
              : SizedBox(
                  height: listHeight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.screenContentSpaceSize,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.grimories.length,
                    itemExtent: width + T20UI.smallSpaceSize,
                    itemBuilder: (_, index) => GrimoireCard(
                      grimoire: store.grimories[index],
                      height: listHeight,
                      width: width,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
