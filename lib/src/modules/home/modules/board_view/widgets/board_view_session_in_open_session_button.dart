import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardViewSessionInOpenSessionButton extends StatefulWidget {
  const BoardViewSessionInOpenSessionButton({
    super.key,
    required this.startedAt,
    required this.inCombat,
    required this.onTap,
  });

  final DateTime startedAt;
  final bool inCombat;
  final Function() onTap;

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
    return ScreenImageButton(
      imageAsset: Assets.images.knight.path,
      hasBorder: true,
      title: 'Jogando $_value',
      subtitle:
          '${widget.inCombat ? 'Combate rolando, boa sorte!' : 'Roleplay acontecendo, boa diversão hein!'}\nClique aqui para ver todas as sessões',
      onTap: widget.onTap,
    );
  }
}
