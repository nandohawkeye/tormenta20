import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MenaceSkillCard extends StatelessWidget {
  const MenaceSkillCard(this.skill, {super.key});

  final GeneralSkill skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Text(
                skill.name.capitalize(),
                style: TextStyle(
                  color: palette.selected,
                  fontFamily: FontFamily.tormenta,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Habilidade - ${skill.desc}',
                maxLines: 2000,
              ),
              T20UI.spaceHeight,
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
