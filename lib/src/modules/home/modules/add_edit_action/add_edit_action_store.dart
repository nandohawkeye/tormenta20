import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';

class AddEditActionStore {
  AddEditActionStore() {
    actionClassType = ValueNotifier<Type>(ActionEnt);
    type = ValueNotifier<ActionType>(ActionType.passive);
  }

  late final ValueNotifier<ActionType> type;
  late final ValueNotifier<Type> actionClassType;
  void changeAttackActionType(Type value) {
    actionClassType.value = value;
    type.value = ActionType.standard;
  }

  void onChangeType(ActionType value) {
    type.value = value;
    actionClassType.value = ActionEnt;
  }

  dispose() {
    actionClassType.dispose();
    type.dispose();
  }
}
