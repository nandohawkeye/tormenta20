import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';

class GrimorieMagicCard extends StatelessWidget {
  const GrimorieMagicCard(
      {super.key, required this.magic, required this.onRemove});

  final MagicCharacter magic;
  final Function(MagicCharacter) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MagicSelected(
                magic: magic,
                enableGrimories: false,
              ),
            ),
          );
        },
        borderRadius: T20UI.borderRadius,
        child: Padding(
          padding: const EdgeInsets.only(
            top: T20UI.spaceSize / 2,
            bottom: T20UI.spaceSize / 2,
            right: T20UI.spaceSize / 2,
            left: T20UI.spaceSize,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${magic.circle.level}˚',
                style: TextStyle(
                  fontSize: 34,
                  color: palette.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: T20UI.spaceSize / 2),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      magic.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      magic.desc,
                      maxLines: 2,
                      style: TextStyle(color: palette.textSecundary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: T20UI.spaceSize / 2),
              Card(
                color: palette.primary.withOpacity(.2),
                child: InkWell(
                  onTap: () => onRemove(magic),
                  borderRadius: T20UI.borderRadius,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      FontAwesomeIcons.solidTrashCan,
                      size: 16,
                      color: palette.primary.withOpacity(.8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
