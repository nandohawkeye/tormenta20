import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/view_fields/view_field_card.dart';

class ViewFields<T> extends StatelessWidget {
  const ViewFields({
    super.key,
    required this.label,
    required this.itens,
    required this.handleTitle,
  });

  final String label;
  final List<T> itens;
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
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedContainer(
                    duration: T20UI.defaultDurationAnimation,
                    decoration: BoxDecoration(
                      borderRadius: T20UI.borderRadius,
                      color: palette.backgroundLevelOne,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: T20UI.smallSpaceSize,
                        left: T20UI.screenContentSpaceSize,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: T20UI.inputHeight + 12),
                            child: Text(label),
                          ),
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
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            T20UI.screenContentSpaceSize + T20UI.smallSpaceSize,
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: T20UI.separatorBuilderHorizontal,
                      itemCount: itens.length,
                      itemBuilder: (_, index) {
                        return ViewFieldCard<T>(
                          handleTitle: handleTitle,
                          type: itens[index],
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
