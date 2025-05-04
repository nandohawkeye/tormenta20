// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectTrainedExpertisesScreenCard extends StatelessWidget {
  const SelectTrainedExpertisesScreenCard({
    super.key,
    required this.expertise,
    required this.selecteds,
    required this.onTap,
  });

  final ExpertiseBase expertise;
  final List<ExpertiseBase> selecteds;
  final Function(ExpertiseBase) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selecteds.any((s) => s.id == expertise.id);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: T20UI.inputHeight,
          child: Card(
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () => onTap(expertise),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: T20UI.smallSpaceSize, right: T20UI.spaceSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        T20UI.smallSpaceWidth,
                        Text(
                          expertise.name.capitalize(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    CustomChecked(
                      value: isSelected,
                      isEnabledToTap: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
