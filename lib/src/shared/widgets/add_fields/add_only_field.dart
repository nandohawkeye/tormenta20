import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/widgets/add_fields/add_only_store.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';

class AddOnlyField<T extends EntityBase> extends StatelessWidget {
  const AddOnlyField({
    super.key,
    required this.label,
    this.mainButtonLabel = 'Selecionar',
    required this.store,
    this.isObrigatory = false,
    this.helpText,
    this.onRemove,
    required this.onAdd,
  });

  final String label;
  final String mainButtonLabel;
  final AddOnlyStore<T> store;
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
        RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: T20UI.screenContentSpaceSize,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ListenableBuilder(
                listenable: store,
                builder: (_, __) {
                  final selected = store.data;
                  final hasError = store.hasError;
                  return AnimatedContainer(
                    duration: T20UI.defaultDurationAnimation,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: hasError
                            ? palette.accent
                            : palette.backgroundLevelOne,
                      ),
                      borderRadius: T20UI.borderRadius,
                      color: palette.backgroundLevelOne,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: T20UI.smallSpaceSize,
                            left: T20UI.screenContentSpaceSize,
                            bottom: T20UI.smallSpaceSize,
                          ),
                          child: Text(label),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: T20UI.smallSpaceSize)
                              .copyWith(
                            bottom: T20UI.smallSpaceSize,
                          ),
                          child: SizedBox(
                            height: T20UI.inputHeight,
                            width: double.infinity,
                            child: Row(
                              children: [
                                if (selected != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: T20UI.smallSpaceSize,
                                    ),
                                    child: SimpleButton(
                                      icon: FontAwesomeIcons.solidTrashCan,
                                      backgroundColor:
                                          palette.backgroundLevelTwo,
                                      iconColor: palette.accent,
                                      onTap: () => onAdd(null),
                                    ),
                                  ),
                                Expanded(
                                  child: MainButton(
                                    label: selected == null
                                        ? mainButtonLabel
                                        : selected.exibitionLabel,
                                    fontFamily: selected == null
                                        ? FontFamily.tormenta
                                        : null,
                                    backgroundColor: palette.backgroundLevelTwo,
                                    onTap: () => onAdd(selected),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
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
