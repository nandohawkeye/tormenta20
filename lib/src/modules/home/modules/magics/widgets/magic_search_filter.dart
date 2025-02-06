import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';

class MagicSearchFilter extends StatelessWidget {
  const MagicSearchFilter({super.key, required this.store});

  final MagicsStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) => store.searchEnable
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColoredBox(
                    color: palette.background,
                    child: Card(
                      margin: T20UI.allPadding,
                      color: Colors.transparent,
                      child: SizedBox(
                        height: T20UI.inputHeight,
                        child: TextField(
                          autofocus: true,
                          onChanged: store.changeSearchFilter,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Busque por nome ou palavra-chave',
                            fillColor: palette.backgroundLevelOne,
                            hintStyle: TextStyle(
                                fontSize: 16, color: palette.textPrimary),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                store.changeSearchEnable(false);
                              },
                              child: Icon(
                                FontAwesomeIcons.xmark,
                                size: T20UI.iconSize,
                                color: palette.accent,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: T20UI.spaceSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
