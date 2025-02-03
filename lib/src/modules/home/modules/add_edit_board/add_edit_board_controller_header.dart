import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';

class AddEditBoardControllerHeader extends StatelessWidget {
  const AddEditBoardControllerHeader({super.key, required this.isCreate});

  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Labels('${isCreate ? 'Criando' : 'Editando'} mesa')],
      ),
    );
  }
}
