import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_store.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_screen.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/grimorie_magic_card.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class GrimorieMagicList extends StatelessWidget {
  const GrimorieMagicList(this.store, {super.key});

  final GrimorieStore store;

  @override
  Widget build(BuildContext context) {
    void addMagic() async {
      await Navigator.push<List<Magic>?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddMagicsScreen(
            initialMagics:
                store.grimoire.magicsCharacters.map((m) => m as Magic).toList(),
          ),
        ),
      ).then((result) async {
        if (result != null) {
          store.addMagics(result);
        }
      });
    }

    return ListenableBuilder(
      listenable: store,
      builder: (_, __) {
        final magics = store.grimoire.magicsCharacters;
        if (magics.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(
              left: T20UI.screenContentSpaceSize,
              right: T20UI.screenContentSpaceSize,
            ),
            child: ScreenImageButton(
              imageAsset: Assets.images.fire.path,
              title: 'Adicionar magia',
              subtitle:
                  'Adicione uma magia ao seu grimório para depois utilizá-las durantes seus combates.',
              onTap: addMagic,
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.only(
            bottom: T20UI.screenContentSpaceSize,
            left: T20UI.screenContentSpaceSize,
            right: T20UI.screenContentSpaceSize,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: store.grimoire.magicsCharacters.length,
          separatorBuilder: T20UI.separatorBuilderVertical,
          itemBuilder: (_, index) {
            return GrimorieMagicCard(
              magic: store.grimoire.magicsCharacters[index],
              onRemove: store.removeMagic,
              onSetup: store.setupMagic,
            );
          },
        );
      },
    );
  }
}
