import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AddEditMenaceExpertiseCardPrototype extends StatelessWidget {
  const AddEditMenaceExpertiseCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: T20UI.inputHeight,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Conhecimento'),
                ],
              ),
            ),
          ),
        ),
        T20UI.smallSpaceHeight
      ],
    );
  }
}
