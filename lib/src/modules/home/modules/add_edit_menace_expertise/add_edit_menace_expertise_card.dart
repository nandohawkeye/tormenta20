import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class AddEditMenaceExpertiseCard extends StatelessWidget {
  const AddEditMenaceExpertiseCard({
    super.key,
    required this.expertise,
    required this.onTap,
  });

  final ExpertiseBase expertise;
  final Function(ExpertiseBase) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: double.infinity,
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => onTap(expertise),
          child: Padding(
            padding: T20UI.horizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expertise.name.capitalize()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
