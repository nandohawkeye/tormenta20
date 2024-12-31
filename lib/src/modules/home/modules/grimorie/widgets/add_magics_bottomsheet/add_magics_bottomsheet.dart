import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/add_magics_bottomsheet/add_magics_bottomsheet_card.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/widgets/add_magics_bottomsheet/add_magics_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddMagicsBottomsheet extends StatefulWidget {
  const AddMagicsBottomsheet({super.key, required this.initialMagics});

  final List<Magic> initialMagics;

  @override
  State<AddMagicsBottomsheet> createState() => _AddMagicsBottomsheetState();
}

class _AddMagicsBottomsheetState extends State<AddMagicsBottomsheet> {
  late final AddMagicsBottomsheetStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddMagicsBottomsheetStore(widget.initialMagics);
    _store.init();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .9);

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.primaryCTA.withOpacity(.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: limite,
          initialChildSize: initialSize,
          builder: (context, scrollController) {
            return Padding(
              padding: T20UI.allPaddingWithPaddingBottom(context,
                  extra: MediaQuery.of(context).padding.bottom),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: palette.bottomSheetBackground,
                      borderRadius: T20UI.borderRadius),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Text(
                              'Selecione as magias',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'tormenta',
                              ),
                            ),
                          ),
                          T20UI.spaceHeight,
                        ],
                      ),
                      const BottomSheetDivider(verticalPadding: 0),
                      Expanded(
                          child: AnimatedBuilder(
                        animation: _store,
                        builder: (_, __) => ListView.separated(
                          padding: T20UI.allPadding,
                          shrinkWrap: true,
                          itemCount: _store.magics.length,
                          separatorBuilder: T20UI.separatorBuilderVertical,
                          itemBuilder: (_, index) => AddMagicsBottomsheetCard(
                            magic: _store.magics[index],
                            selectedMagics: _store.selectedMagics,
                            onTap: _store.onSelectMagic,
                          ),
                        ),
                      )),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BottomSheetDivider(verticalPadding: 0),
                          Padding(
                            padding: T20UI.allPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: T20UI.inputHeight,
                                    child: TextField(
                                      autofocus: false,
                                      onChanged: _store.changeSearchFilter,
                                      style: const TextStyle(fontSize: 16),
                                      decoration: InputDecoration(
                                        hintText: 'Busque por nome',
                                        fillColor: palette.onBottomsheet,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: palette.textPrimary),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 9,
                                          horizontal: T20UI.spaceSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                T20UI.spaceWidth,
                                SizedBox(
                                  height: T20UI.inputHeight,
                                  width: T20UI.inputHeight,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: T20UI.borderRadius,
                                      color: palette.primary.withOpacity(.4),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: T20UI.borderRadius,
                                        splashColor:
                                            palette.primaryCTA.withOpacity(.4),
                                        onTap: () => Navigator.pop(
                                            context, _store.selectedMagics),
                                        child: Icon(
                                          FontAwesomeIcons.check,
                                          color: palette.icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                T20UI.spaceWidth,
                                const SimpleCloseButton()
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
