import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character_controller.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/widgets/change_atribute_field/change_atribute_field.dart';

class EditCharacterAtributesFields extends StatelessWidget {
  const EditCharacterAtributesFields(this.controller, {super.key});

  final AddEditCharacterController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChangeAtributeField(
                atribute: Atribute.strength,
                store: controller.strengthStore,
              ),
              ChangeAtributeField(
                atribute: Atribute.dexterity,
                store: controller.dexterityStore,
              ),
              ChangeAtributeField(
                atribute: Atribute.constitution,
                store: controller.constituionStore,
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChangeAtributeField(
                atribute: Atribute.intelligence,
                store: controller.inteligenceStore,
              ),
              ChangeAtributeField(
                atribute: Atribute.wisdom,
                store: controller.wisdonStore,
              ),
              ChangeAtributeField(
                atribute: Atribute.charisma,
                store: controller.charismaStore,
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
      ],
    );
  }
}
