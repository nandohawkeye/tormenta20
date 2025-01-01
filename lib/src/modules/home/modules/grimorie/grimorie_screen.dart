// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_store.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kToolbarHeight),
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: _store,
                        builder: (_, __) => Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                'assets/icons/${_store.grimoire.iconAsset}.svg',
                                color: Color(_store.grimoire.colorInt),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Labels(
                              _store.grimoire.name,
                              maxLines: 2,
                              textColor: Color(_store.grimoire.colorInt),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SimpleButton(
                              icon: FontAwesomeIcons.solidTrashCan,
                              onTap: () async {},
                            ),
                          ),
                          T20UI.spaceWidth,
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SimpleButton(
                              iconPadding:
                                  const EdgeInsets.only(left: 4, bottom: 2),
                              icon: FontAwesomeIcons.penToSquare,
                              onTap: () async {
                                await showModalBottomSheet<Grimoire?>(
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: AddGrimorieBottomsheet(
                                        initialGrimoire: _store.grimoire),
                                  ),
                                ).then((result) async {
                                  if (result != null) {
                                    await GetIt.I<AppDatabase>()
                                        .grimoireDAO
                                        .insertGrimoire(result)
                                        .then((failure) {
                                      if (failure == null) {
                                        _store.updateGrimorie(result);
                                      }
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                AnimatedBuilder(
                  animation: _store,
                  builder: (_, __) => (_store.grimoire.desc?.isEmpty ?? true)
                      ? const Divider()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: T20UI.spaceSize - 4),
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: T20UI.allPadding,
                                child: Text(
                                  _store.grimoire.desc ?? '',
                                  maxLines: 2000000,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Labels('Magias'),
                      SimpleButton(
                        icon: FontAwesomeIcons.plus,
                        onTap: () async {
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
                              print('result: $result');
                              try {
                                final newMagics = result
                                    .map((m) =>
                                        MagicCharacterAdapters.createFromMagic(
                                            m, _store.grimoire.uuid))
                                    .toList();
                                final oldMagics =
                                    _store.grimoire.magicsCharacters;

                                final upGriporio =
                                    GrimoireAdapters.copyWithNewMagics(
                                        _store.grimoire,
                                        [...oldMagics, ...newMagics]);

                                await Future.forEach(
                                    newMagics,
                                    (magic) async =>
                                        await GetIt.I<AppDatabase>()
                                            .magicCharacterDAO
                                            .insertMagic(magic));

                                await GetIt.I<AppDatabase>()
                                    .grimoireDAO
                                    .insertGrimoire(upGriporio)
                                    .then((failure) {
                                  if (failure == null) {
                                    _store.updateGrimorie(upGriporio);
                                  }
                                });
                              } catch (e) {
                                print('erro: $e');
                              }
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
                T20UI.spaceHeight,
                AnimatedBuilder(
                    animation: _store,
                    builder: (_, __) => _store.grimoire.magicsCharacters.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: T20UI.spaceSize - 4),
                            child: MainButton(
                              label: 'Adicione uma magia',
                              textColor: palette.primary.withOpacity(.6),
                              backgroundColor:
                                  palette.cardBackground.withOpacity(.5),
                              onTap: () {},
                            ),
                          )
                        : Text('Tem mágicas '))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                Padding(
                  padding: T20UI.allPadding,
                  child: MainButton(
                    label: 'Voltar',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                T20UI.safeAreaBottom(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
