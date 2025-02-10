// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
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
          builder: (_) => const AddGrimorieBottomsheet(initialGrimoire: null),
        ),
      ).then((result) async {
        if (result != null) {
          await GetIt.I<AppDatabase>()
              .grimoireDAO
              .insertGrimoire(result)
              .then((failure) {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Grimórios'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () async => await addGrimoire(),
                  ),
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.solidFileCode,
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: store,
          builder: (_, __) => store.grimories.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.spaceSize - 4,
                    left: T20UI.spaceSize - 4,
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
                  height: 100 * MediaQuery.of(context).textScaler.scale(1),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: T20UI.spaceSize - 4),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.grimories.length,
                    separatorBuilder: T20UI.separatorBuilderHorizontal,
                    itemBuilder: (_, index) =>
                        GrimoireCard(grimoire: store.grimories[index]),
                  ),
                ),
        ),
      ],
    );
  }
}
