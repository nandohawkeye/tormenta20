import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_bottomsheet/magic_bottomsheet_item.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';

class MagicBottomsheet extends StatelessWidget {
  const MagicBottomsheet({super.key, required this.magic});

  final Magic magic;

  @override
  Widget build(BuildContext context) {
    Map<String, String> schollLabels = {
      'Abjuracao': 'Abjuração',
      'Adivinhacao': 'Adivinhação',
      'Convocacao': 'Convocação',
      'Evocacao': 'Evocação',
      'Ilusao': 'Ilusão',
      'Transmutacao': 'Transmutação',
    };

    Map<String, String> executionsLabels = {
      'Padrao': 'Padrão',
      'Reacao': 'Reação',
    };

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .7);

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
                                magic.name,
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
                                        preffix: '${magic.circle.level}˚',
                                        text: ' circulo',
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Tipo: ',
                                        icon: FontAwesomeIcons.hatWizard,
                                        text: magic.type.name,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Alcance: ',
                                        icon: FontAwesomeIcons.peopleArrows,
                                        text: magic.range.name == 'Medio'
                                            ? 'Médio'
                                            : magic.range.name,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Escola: ',
                                        icon: FontAwesomeIcons.school,
                                        text: schollLabels[magic.school.name] ??
                                            magic.school.name,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Execução: ',
                                        icon: FontAwesomeIcons.handSparkles,
                                        text: executionsLabels[
                                                magic.execution.name] ??
                                            magic.execution.name,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Duração: ',
                                        icon: FontAwesomeIcons.hourglassHalf,
                                        text:
                                            magic.duration.name == 'Instantanea'
                                                ? 'Instantânea'
                                                : magic.duration.name,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Resistência: ',
                                        icon: FontAwesomeIcons.shieldHalved,
                                        text: magic.resistence,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Alvo/Área/Efeito: ',
                                        icon:
                                            FontAwesomeIcons.locationCrosshairs,
                                        text: magic.targetAreaEfect,
                                      ),
                                      MagicBottomsheetItem(
                                        preffix: 'Descrição: ',
                                        icon: FontAwesomeIcons.scroll,
                                        text: magic.desc,
                                      ),
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
                              child: SizedBox(
                                height: T20UI.inputHeight,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: T20UI.borderRadius,
                                    color: palette.primaryCTA.withOpacity(.4),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: T20UI.borderRadius,
                                      splashColor:
                                          palette.primaryCTA.withOpacity(.6),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Fechar',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'tormenta',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
