import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/grimorie_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/add_grimorie_bottomsheet/add_grimorie_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

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
      appBar: AppBar(
        titleSpacing: 0,
        title: AnimatedBuilder(
          animation: _store,
          builder: (_, __) => Text(_store.grimoire.name),
        ),
        actions: [
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
              iconPadding: const EdgeInsets.only(left: 4, bottom: 2),
              icon: FontAwesomeIcons.penToSquare,
              onTap: () async {
                await showModalBottomSheet<Grimoire?>(
                  isScrollControlled: true,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          T20UI.spaceHeight,
          const Padding(
            padding: T20UI.horizontalPadding,
            child: Labels('Descrição'),
          ),
          T20UI.spaceHeight,
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
            child: Card(
              child: AnimatedBuilder(
                animation: _store,
                builder: (_, __) => Padding(
                  padding: T20UI.allPadding,
                  child: Text(
                    _store.grimoire.desc ?? '',
                    maxLines: 2000000,
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
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
