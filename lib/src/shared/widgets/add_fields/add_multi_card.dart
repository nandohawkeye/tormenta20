import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';

class AddMultiCard<T extends EntityBase> extends StatelessWidget {
  const AddMultiCard({
    super.key,
    required this.value,
    required this.onTap,
    required this.onRemove,
  });

  final T value;
  final Function(T) onTap;
  final Function(T) onRemove;

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
        onTap: () => onTap(value),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              T20UI.spaceWidth,
              Text(
                value.exibitionLabel,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              T20UI.spaceWidth,
              InkWell(
                borderRadius: T20UI.borderRadius,
                onTap: () => onRemove(value),
                child: SizedBox(
                  height: T20UI.inputHeight,
                  width: T20UI.inputHeight,
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
