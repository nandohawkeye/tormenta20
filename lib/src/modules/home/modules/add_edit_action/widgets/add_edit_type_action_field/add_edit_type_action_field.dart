import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_store.dart';
import 'package:tormenta20/src/shared/entities/action/action_type.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_type_action_field/add_edit_type_action_field_card.dart';

class AddEditTypeActionField extends StatelessWidget {
  const AddEditTypeActionField({super.key, required this.store});

  final AddEditActionStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (95),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.screenContentSpaceSize,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: T20UI.borderRadius,
                      color: palette.backgroundLevelOne,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: T20UI.smallSpaceSize,
                        left: T20UI.screenContentSpaceSize,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipo'),
                          SizedBox(height: T20UI.inputHeight + 12)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: store.type,
                        builder: (_, selected, __) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.screenContentSpaceSize +
                                  T20UI.smallSpaceSize,
                              right: T20UI.screenContentSpaceSize +
                                  T20UI.smallSpaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: ActionType.values.length,
                            itemBuilder: (_, index) {
                              return AddEditTypeActionFieldCard(
                                type: ActionType.values[index],
                                selected: selected,
                                onTap: store.onChangeType,
                              );
                            },
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
