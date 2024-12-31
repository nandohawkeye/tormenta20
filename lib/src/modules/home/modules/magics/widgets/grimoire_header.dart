// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/grimoire_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class GrimoireHeader extends StatelessWidget {
  const GrimoireHeader(this.store, {super.key});

  final GrimoriesStore store;

  @override
  Widget build(BuildContext context) {
    Future<void> addGrimoire() async {
      await showModalBottomSheet<Grimoire?>(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddGrimorieBottomsheet(initialGrimoire: null),
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
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: () async => await addGrimoire(),
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: store,
          builder: (_, __) => store.grimories.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
                  child: MainButton(
                    label: 'Crie um grimório',
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
