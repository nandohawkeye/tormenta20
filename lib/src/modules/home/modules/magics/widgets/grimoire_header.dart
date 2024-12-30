// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class GrimoireHeader extends StatelessWidget {
  const GrimoireHeader({super.key});

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

    return Padding(
      padding: T20UI.allPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Grimórios'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: () async => await addGrimoire(),
              )
            ],
          ),
          T20UI.spaceHeight,
          MainButton(
            label: 'Crie um grimório',
            onTap: () async => await addGrimoire(),
          )
        ],
      ),
    );
  }
}
