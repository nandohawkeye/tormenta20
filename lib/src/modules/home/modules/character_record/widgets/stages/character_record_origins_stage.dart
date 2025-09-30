import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_origin_bottomsheet/add_edit_origin_bottomsheet.dart';

class CharacterRecordOriginsStage extends StatelessWidget {
  const CharacterRecordOriginsStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    Future<void> onAddEdit({
      required String parentUuid,
      Origin? initialOrigin,
    }) async {
      await BottomsheetUtils.show(
        context: context,
        child: AddEditOriginBottomsheet(
          initialOrigin: initialOrigin,
          parentUuid: parentUuid,
        ),
      ).then((result) async {
        if (result != null && result is Origin) {
          await store.saveOrigin(result);
        }

        if (result != null && result is String && result == 'delete') {
          await store.deleteOrigin(initialOrigin!);
        }
      });
    }

    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final character = store.characterBoard.value;
        final origins = character.origins;

        origins.sort((a, b) => a.name.compareTo(b.name));
        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: origins.length + 1,
          separatorBuilder: (_, index) => SizedBox(
            height: index == 0 ? T20UI.spaceSize : T20UI.smallSpaceSize,
          ),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            if (index == 0) {
              return SizedBox(
                height: 48,
                child: Card(
                  child: InkWell(
                    borderRadius: T20UI.borderRadius,
                    onTap: () async {
                      await onAddEdit(parentUuid: character.uuid);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.compass),
                        T20UI.smallSpaceWidth,
                        Text(
                          'Adicionar origem',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return _Card(
              origin: origins[index - 1],
              onEdit: (entity) =>
                  onAddEdit(parentUuid: character.uuid, initialOrigin: entity),
            );
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.origin, required this.onEdit});

  final Origin origin;
  final Function(Origin) onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onEdit(origin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: T20UI.spaceSize,
                vertical: T20UI.smallSpaceSize,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    origin.name.capitalize(),
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(origin.desc, maxLines: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
