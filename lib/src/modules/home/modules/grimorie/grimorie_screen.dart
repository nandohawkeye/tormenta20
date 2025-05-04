// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_store.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_screen.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/delete_grimorie_bottom_sheet/delete_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/grimoire_characters_list/grimorie_characters_list.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/grimorie_magic_list.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/grimorie_options_bottomsheet/grimorie_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_save_main_buttons.dart';

class GrimorieScreen extends StatefulWidget {
  const GrimorieScreen({super.key, required this.grimoire});

  final Grimoire grimoire;

  @override
  State<GrimorieScreen> createState() => _GrimorieScreenState();
}

class _GrimorieScreenState extends State<GrimorieScreen> {
  late final GrimorieStore _store;

  @override
  void initState() {
    super.initState();
    _store = GrimorieStore(widget.grimoire);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addMagic() async {
      await Navigator.push<List<Magic>?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddMagicsScreen(
            initialMagics: _store.grimoire.magicsCharacters
                .map((m) => m as Magic)
                .toList(),
          ),
        ),
      ).then((result) async {
        if (result != null) {
          _store.addMagics(result);
        }
      });
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight),
          RepaintBoundary(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListenableBuilder(
                  listenable: _store,
                  builder: (_, __) => Hero(
                    tag: _store.grimoire.uuid,
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          T20UI.spaceWidth,
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              _store.grimoire.iconAsset,
                              color: palette.icon,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Labels(
                            _store.grimoire.name,
                            maxLines: 2,
                            fontSize: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          T20UI.spaceHeight,
          RepaintBoundary(
            child: ListenableBuilder(
              listenable: _store,
              builder: (_, __) => (_store.grimoire.desc?.isEmpty ?? true)
                  ? const Divider()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: T20UI.screenContentSpaceSize,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          _store.grimoire.desc ?? '',
                          maxLines: 2000000,
                          style: TextStyle(
                            color: palette.textSecundary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          T20UI.spaceHeight,
          GrimorieCharactersList(_store),
          const RepaintBoundary(
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Labels('Magias'),
            ),
          ),
          T20UI.spaceHeight,
          Expanded(
            child: RepaintBoundary(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GrimorieMagicList(_store),
                    T20UI.safeAreaBottom(context, additionalHeight: 70)
                  ],
                ),
              ),
            ),
          ),
          RepaintBoundary(
            child: ScreenSaveMainButtons(
              label: "Adicionar magias",
              onSave: addMagic,
              extraRightWidgets: [
                T20UI.spaceWidth,
                SimpleButton(
                  icon: FontAwesomeIcons.bars,
                  iconColor: palette.icon,
                  onTap: () {
                    BottomsheetUtils.show<grimorieOption?>(
                      context: context,
                      child: const GrimorieOptionsBottomsheet(),
                    ).then((result) async {
                      if (result == grimorieOption.delete) {
                        await BottomsheetUtils.show<bool?>(
                          context: context,
                          child: const DeleteGrimorieBottomsheet(),
                        ).then((result) async {
                          if (result != null && result) {
                            await _store.deleteGrimoire().then((failure) {
                              if (failure == null) {
                                Navigator.pop(context);
                              }
                            });
                          }
                        });
                      }

                      if (result == grimorieOption.edit) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddGrimorieScreen(
                                initialGrimoire: _store.grimoire),
                          ),
                        ).then((result) async {
                          if (result != null) {
                            _store.updateGrimorie(result);
                          }
                        });
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
