import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_bord.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_tag.dart';

class EmptyTokenSelector extends StatelessWidget {
  const EmptyTokenSelector({
    super.key,
    required this.onEmpty,
    required this.size,
    required this.isMenace,
    required this.isEmpty,
    this.colorBase,
  });

  final Function() onEmpty;
  final double size;
  final bool isEmpty;
  final bool isMenace;
  final Color? colorBase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20000),
          onTap: onEmpty,
          child: SizedBox(
            height: size + 10,
            width: size + 10,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorBase ?? palette.backgroundLevelOne,
                        ),
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: palette.accent,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isEmpty)
                  TokenCardBord(
                    size: size,
                    isMenace: isMenace,
                  ),
                const TokenCardTag(
                  tag: 'Vazio',
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
