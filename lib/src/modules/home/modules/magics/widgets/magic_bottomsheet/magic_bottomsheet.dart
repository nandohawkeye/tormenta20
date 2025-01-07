import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet_desc.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet_grimorie_card.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet_item.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_utils.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class MagicBottomsheet extends StatefulWidget {
  const MagicBottomsheet({
    super.key,
    required this.magic,
    required this.enableGrimories,
  });

  final Magic magic;
  final bool enableGrimories;

  @override
  State<MagicBottomsheet> createState() => _MagicBottomsheetState();
}

class _MagicBottomsheetState extends State<MagicBottomsheet> {
  late final MagicBottomsheetStore _store;

  @override
  void initState() {
    super.initState();
    _store = MagicBottomsheetStore(widget.magic);
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Text(
                              widget.magic.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'tormenta',
                              ),
                            ),
                          ),
                          T20UI.spaceHeight,
                        ],
                      ),
                      const BottomSheetDivider(verticalPadding: 0),
                      AnimatedBuilder(
                        animation: _store,
                        builder: (_, __) {
                          return _store.grimories.isEmpty ||
                                  !widget.enableGrimories
                              ? const SizedBox.shrink()
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    T20UI.spaceHeight,
                                    LimitedBox(
                                      maxHeight: T20UI.inputHeight *
                                          MediaQuery.of(context)
                                              .textScaler
                                              .scale(1),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: T20UI.spaceSize - 4),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _store.grimories.length,
                                        separatorBuilder:
                                            T20UI.separatorBuilderHorizontal,
                                        itemBuilder: (_, index) =>
                                            MagicBottomsheetGrimorieCard(
                                          grimoire: _store.grimories[index],
                                          magic: widget.magic,
                                          onTap: _store.onTapGrimoire,
                                        ),
                                      ),
                                    ),
                                    T20UI.spaceHeight,
                                    const BottomSheetDivider(
                                        verticalPadding: 0),
                                  ],
                                );
                        },
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: T20UI.verticalPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: T20UI.spaceSize - 4),
                                child: Wrap(
                                  runSpacing: T20UI.spaceSize,
                                  spacing: T20UI.spaceSize,
                                  children: [
                                    MagicBottomsheetItem(
                                      icon: FontAwesomeIcons.circleDot,
                                      preffix: '${widget.magic.circle.level}˚',
                                      text: ' Circulo',
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Tipo: ',
                                      icon: FontAwesomeIcons.hatWizard,
                                      text: widget.magic.type.name,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Alcance: ',
                                      icon: FontAwesomeIcons.peopleArrows,
                                      text: widget.magic.range.name == 'Medio'
                                          ? 'Médio'
                                          : widget.magic.range.name,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Escola: ',
                                      icon: FontAwesomeIcons.school,
                                      text: MagicUtils.schollLabels[
                                              widget.magic.school.name] ??
                                          widget.magic.school.name,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Execução: ',
                                      icon: FontAwesomeIcons.handSparkles,
                                      text: MagicUtils.executionsLabels[
                                              widget.magic.execution.name] ??
                                          widget.magic.execution.name,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Publicação: ',
                                      icon: FontAwesomeIcons.bookOpen,
                                      text: widget.magic.publication,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Duração: ',
                                      icon: FontAwesomeIcons.hourglassHalf,
                                      text: MagicUtils.durationLabels[
                                              widget.magic.duration.name] ??
                                          widget.magic.duration.name,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Resistência: ',
                                      icon: FontAwesomeIcons.shieldHalved,
                                      text: widget.magic.resistence,
                                    ),
                                    MagicBottomsheetItem(
                                      preffix: 'Alvo/Área/Efeito: ',
                                      icon: FontAwesomeIcons.locationCrosshairs,
                                      text: widget.magic.targetAreaEfect,
                                    ),
                                    MagicBottomsheetDesc(widget.magic.desc),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BottomSheetDivider(verticalPadding: 0),
                          Padding(
                            padding: T20UI.allPadding,
                            child: MainButton(
                              label: 'Fechar',
                              onTap: () => Navigator.pop(context),
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
