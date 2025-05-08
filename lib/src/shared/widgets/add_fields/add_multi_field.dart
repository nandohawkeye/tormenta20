import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_field_body.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_card.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_multi_store.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';

class AddMultiField<T extends EntityBase> extends StatelessWidget {
  const AddMultiField({
    super.key,
    required this.label,
    this.mainButtonLabel = 'Adicionar',
    required this.store,
    this.isObrigatory = false,
    this.helpText,
    this.onRemove,
    required this.onAdd,
  });

  final String label;
  final String mainButtonLabel;
  final AddMultiStore<T> store;
  final bool isObrigatory;
  final String? helpText;
  final Function(T?) onAdd;
  final Function(T)? onRemove;

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
              RepaintBoundary(
                child: ListenableBuilder(
                  listenable: store,
                  builder: (_, __) {
                    final hasError = store.hasError;
                    return AddFieldBody(
                      label: label,
                      hasError: hasError,
                    );
                  },
                ),
              ),
              RepaintBoundary(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: T20UI.inputHeight,
                      width: double.infinity,
                      child: ListenableBuilder(
                        listenable: store,
                        builder: (_, __) {
                          final list = store.data;
                          if (list.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: T20UI.smallSpaceSize +
                                    T20UI.screenContentSpaceSize,
                              ),
                              child: MainButton(
                                label: mainButtonLabel,
                                backgroundColor: palette.backgroundLevelTwo,
                                onTap: () => onAdd(null),
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: const EdgeInsets.only(
                              left: T20UI.smallSpaceSize +
                                  T20UI.screenContentSpaceSize,
                              right: T20UI.smallSpaceSize +
                                  T20UI.screenContentSpaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: list.length + 1,
                            itemBuilder: (_, index) {
                              if (index == 0) {
                                return SelectorSecundarySimpleButton(
                                  icon: FontAwesomeIcons.plus,
                                  onTap: () => onAdd(null),
                                );
                              }

                              return AddMultiCard(
                                value: list[index - 1],
                                onRemove: onRemove ?? store.remove,
                                onTap: onAdd,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        RepaintBoundary(
          child: ListenableBuilder(
            listenable: store,
            builder: (_, __) {
              final hasError = store.hasError;
              return WarningWidget(
                hasError: hasError,
                isObrigatory: isObrigatory,
                helpText: helpText,
              );
            },
          ),
        )
      ],
    );
  }
}
