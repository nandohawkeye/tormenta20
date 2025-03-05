import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';

class AddEditMenaceScreenGeneralSkillsFieldCard extends StatelessWidget {
  const AddEditMenaceScreenGeneralSkillsFieldCard({
    super.key,
    required this.skill,
    required this.onTap,
    required this.onRemove,
  });

  final GeneralSkill skill;
  final Function(GeneralSkill) onTap;
  final Function(GeneralSkill) onRemove;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(skill),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              T20UI.spaceWidth,
              Text(
                skill.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              T20UI.spaceWidth,
              InkWell(
                borderRadius: T20UI.borderRadius,
                onTap: () => onRemove(skill),
                child: SizedBox(
                  height: T20UI.inputHeight *
                      MediaQuery.of(context).textScaler.scale(1),
                  width: T20UI.inputHeight *
                      MediaQuery.of(context).textScaler.scale(1),
                  child: Icon(
                    FontAwesomeIcons.solidTrashCan,
                    color: palette.accent,
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
