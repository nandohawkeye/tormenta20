import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';

class AddEditMenaceScreenStageFour extends StatelessWidget {
  const AddEditMenaceScreenStageFour({
    super.key,
    required this.controller,
  });

  final AddEditMenaceController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
