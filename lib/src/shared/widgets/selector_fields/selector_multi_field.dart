import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_field_body.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_card.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_warning.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class SelectorMultiField<T> extends StatelessWidget {
  const SelectorMultiField({
    super.key,
    required this.label,
    this.hasError = false,
    this.isObrigatory = false,
    required this.itens,
    required this.selecteds,
    required this.onTap,
    required this.handleTitle,
    this.removeAll,
    this.helpText,
  });

  final String label;
  final bool hasError;
  final bool isObrigatory;
  final List<T> itens;
  final List<T> selecteds;
  final Function(T) onTap;
  final Function()? removeAll;
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
              SelectorFieldBody(
                label: label,
                hasError: hasError,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    width: double.infinity,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            T20UI.screenContentSpaceSize + T20UI.smallSpaceSize,
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: T20UI.separatorBuilderHorizontal,
                      itemCount: itens.length + (removeAll != null ? 1 : 0),
                      itemBuilder: (_, index) {
                        if (removeAll != null && index == 0) {
                          return SelectorSecundarySimpleButton(
                            icon: FontAwesomeIcons.xmark,
                            onTap: removeAll!,
                          );
                        }

                        return SelectorMultiCard<T>(
                          handleTitle: handleTitle,
                          type: itens[index - (removeAll != null ? 1 : 0)],
                          selecteds: selecteds,
                          onTap: onTap,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SelectorWarning(
          hasError: hasError,
          isObrigatory: isObrigatory,
          helpText: helpText,
        )
      ],
    );
  }
}
