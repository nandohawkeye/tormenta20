import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BoardViewSessionInOpenSessionButton extends StatefulWidget {
  const BoardViewSessionInOpenSessionButton({
    super.key,
    required this.startedAt,
    required this.inCombat,
    required this.onTap,
    required this.onInitCombat,
  });

  final DateTime startedAt;
  final bool inCombat;
  final Function() onTap;
  final Function() onInitCombat;

  @override
  State<BoardViewSessionInOpenSessionButton> createState() =>
      _BoardViewSessionInOpenSessionButtonState();
}

class _BoardViewSessionInOpenSessionButtonState
    extends State<BoardViewSessionInOpenSessionButton> {
  Timer? _timer;
  String _value = '00Hs : 00Min : 00s';

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _value = DateTime.now()
              .difference(widget.startedAt)
              .toFormattedStringWithHours();
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: T20UI.borderRadius,
        side: BorderSide(
          color: palette.primary.withOpacity(.4),
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: widget.onTap,
        child: Padding(
          padding: T20UI.allPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    height: 60,
                    width: 60,
                    Assets.images.knight.path,
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jogando $_value',
                          style: TextStyle(
                            color: palette.accent,
                            fontFamily: FontFamily.tormenta,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${widget.inCombat ? 'Combate rolando, boa sorte!' : 'Roleplay acontecendo, boa diversão hein!'}\nClique aqui para ver todas as sessões',
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 14,
                            color: palette.textSecundary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (!widget.inCombat)
                Padding(
                  padding: const EdgeInsets.only(top: T20UI.spaceSize),
                  child: MainButton(
                    label: 'Iníciar combate',
                    onTap: widget.onInitCombat,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
