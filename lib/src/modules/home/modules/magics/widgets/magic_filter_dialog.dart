import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class MagicFilterDialog extends StatelessWidget {
  const MagicFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        SizedBox(
          height: 520,
          width: ((MediaQuery.of(context).size.width / 5) * 4) + 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width / 5) * 4,
                  height: 500,
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: T20UI.allPadding,
                              child: Text(
                                'Filtros',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: T20UI.allPadding,
                              child: Wrap(
                                runSpacing: T20UI.spaceSize,
                                spacing: T20UI.spaceSize,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Arcana',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Divina',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Universal',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: T20UI.allPadding,
                              child: Wrap(
                                runSpacing: T20UI.spaceSize,
                                spacing: T20UI.spaceSize,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Abjuração',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Adivinhação',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Convocação',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Encantamento',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Evocação',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Ilusão',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Necromancia',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Transmutação',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 6),
                                      CustomChecked(value: true)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AnimationConfiguration.synchronized(
                  child: ScaleAnimation(
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        height: 38,
                        width: 38,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: T20UI.borderRadius,
                            color: const Color(0xFF424242),
                          ),
                          child: Icon(
                            FontAwesomeIcons.xmark,
                            color: palette.primaryCTA,
                          ),
                        ),
                      ),
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
