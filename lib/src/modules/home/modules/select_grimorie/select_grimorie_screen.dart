import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_grimorie/add_grimorie_screen.dart';
import 'package:tormenta20/src/modules/home/modules/select_grimorie/select_grimorie_screen_card.dart';
import 'package:tormenta20/src/modules/home/modules/select_grimorie/select_grimorie_store.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class SelectGrimorieScreen extends StatefulWidget {
  const SelectGrimorieScreen({super.key, this.grimorie});

  final Grimoire? grimorie;

  @override
  State<SelectGrimorieScreen> createState() => _SelectGrimorieScreenState();
}

class _SelectGrimorieScreenState extends State<SelectGrimorieScreen> {
  late final SelectGrimorieStore _store;

  @override
  void initState() {
    super.initState();
    _store = SelectGrimorieStore(widget.grimorie);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Selecione o grimório',
      onSaveLabel: 'Confirmar',
      onSave: () {
        final selected = _store.selected;
        if (selected != null) {
          Navigator.pop(context, selected);
        }
      },
      extraRightWidgets: [
        T20UI.spaceWidth,
        SimpleButton(
          icon: FontAwesomeIcons.plus,
          iconColor: palette.icon,
          backgroundColor: palette.selected,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddGrimorieScreen(initialGrimoire: null),
              ),
            ).then(
              (result) async {
                if (result != null) {
                  _store.insertGrimorie(result);
                }
              },
            );
          },
        ),
      ],
      body: AnimatedBuilder(
        animation: _store,
        builder: (_, __) {
          final grimories = _store.grimories;

          if (grimories.isEmpty) {
            return Padding(
              padding: EdgeInsets.only(top: context.height / 3),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.ghost),
                    SizedBox(width: T20UI.smallSpaceSize),
                    Text(
                      'Nenhum grimório',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final selected = _store.selected;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: T20UI.screenContentSpaceSize,
              vertical: T20UI.spaceSize,
            ),
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: grimories.length,
            itemBuilder: (_, index) {
              return SelectGrimorieScreenCard(
                grimoire: grimories[index],
                selected: selected,
                onTap: _store.setSelected,
              );
            },
          );
        },
      ),
    );
  }
}
