import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_atribute_dices_store.dart';

class AddEditCharacterController {
  final AddEditCharacterAtributeDicesStore atributeDicesStore =
      AddEditCharacterAtributeDicesStore();

  void createDices() {
    atributeDicesStore.createDicesAndRoll();
  }

  void dispose() {
    atributeDicesStore.dispose();
  }
}
