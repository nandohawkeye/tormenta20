import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card.dart';

class MagicsWrap extends StatelessWidget {
  const MagicsWrap({super.key, required this.store});

  final MagicsStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (_, __) => store.magics.isEmpty
          ? const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.ghost),
                  T20UI.smallSpaceWidth,
                  Text(
                    'Nenhuma magia disponível',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          : Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: store.magics
                    .map(
                      (magic) => MagicCard(
                        magic: magic,
                        searchFilter: store.searchFilter,
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
