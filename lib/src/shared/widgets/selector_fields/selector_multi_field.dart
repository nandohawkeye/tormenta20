import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_field_body.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_card.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_store.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class SelectorMultiField<T> extends StatelessWidget {
  const SelectorMultiField({
    super.key,
    required this.label,
    this.isObrigatory = false,
    required this.itens,
    this.onTapItem,
    required this.handleTitle,
    this.removeAll,
    this.helpText,
    required this.store,
    this.hasRemoverAll = false,
  });

  final String label;
  final bool isObrigatory;
  final List<T> itens;
  final Function(T)? onTapItem;
  final Function()? removeAll;
  final bool hasRemoverAll;
  final SelectorMultiStore<T> store;
  final String Function(String) handleTitle;
  final String? helpText;

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
                    return SelectorFieldBody(
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
                          final selecteds = store.data;
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              horizontal: T20UI.screenContentSpaceSize +
                                  T20UI.smallSpaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: itens.length + (hasRemoverAll ? 1 : 0),
                            itemBuilder: (_, index) {
                              if (hasRemoverAll && index == 0) {
                                return SelectorSecundarySimpleButton(
                                  icon: FontAwesomeIcons.xmark,
                                  onTap: removeAll ?? store.removeAll,
                                );
                              }

                              return SelectorMultiCard<T>(
                                handleTitle: handleTitle,
                                type:
                                    itens[index - (removeAll != null ? 1 : 0)],
                                selecteds: selecteds,
                                onTap: onTapItem ?? store.put,
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
