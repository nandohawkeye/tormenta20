import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_field_body.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_card.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class SelectorOnlyField<T> extends StatelessWidget {
  const SelectorOnlyField({
    super.key,
    required this.label,
    this.isObrigatory = false,
    required this.itens,
    required this.handleTitle,
    this.hasRemoveAll = false,
    this.helpText,
    required this.store,
    this.onChange,
  });

  final String label;
  final bool isObrigatory;
  final List<T> itens;
  final bool hasRemoveAll;
  final Function(T?)? onChange;
  final SelectorOnlyStore<T> store;
  final String? helpText;
  final String Function(String) handleTitle;

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
              AnimatedBuilder(
                animation: store,
                builder: (_, __) {
                  final hasError = store.hasError;
                  return SelectorFieldBody(
                    label: label,
                    hasError: hasError,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    width: double.infinity,
                    child: AnimatedBuilder(
                      animation: store,
                      builder: (_, __) {
                        final selected = store.data;
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: T20UI.screenContentSpaceSize +
                                T20UI.smallSpaceSize,
                          ),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: T20UI.separatorBuilderHorizontal,
                          itemCount: itens.length + (hasRemoveAll ? 1 : 0),
                          itemBuilder: (_, index) {
                            if (hasRemoveAll && index == 0) {
                              return SelectorSecundarySimpleButton(
                                icon: FontAwesomeIcons.xmark,
                                onTap: () {
                                  if (onChange != null) {
                                    onChange!(null);
                                  } else {
                                    store.onChange(null);
                                  }
                                },
                              );
                            }

                            return SelectorOnlyCard<T>(
                              handleTitle: handleTitle,
                              type: itens[index - (hasRemoveAll ? 1 : 0)],
                              selected: selected,
                              onTap: onChange ?? store.onChange,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: store,
          builder: (_, __) {
            final hasError = store.hasError;
            return WarningWidget(
              hasError: hasError,
              isObrigatory: isObrigatory,
              helpText: helpText,
            );
          },
        )
      ],
    );
  }
}
