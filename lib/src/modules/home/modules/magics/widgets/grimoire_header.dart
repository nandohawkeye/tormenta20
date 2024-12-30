import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class GrimoireHeader extends StatelessWidget {
  const GrimoireHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> addGrimoire() async {
      await showModalBottomSheet(
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
      );
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
