import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/constants/images_assets.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class ManaceScreenButton extends StatefulWidget {
  const ManaceScreenButton({super.key});

  @override
  State<ManaceScreenButton> createState() => _ManaceScreenButtonState();
}

class _ManaceScreenButtonState extends State<ManaceScreenButton> {
  late String _image;
  final List<String> _characters = ImagesAssets.menace;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _characters.shuffle();
    _image = _characters.first;
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _characters.shuffle();
      setState(() {
        _image = _characters.first;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: T20UI.defaultDurationAnimation,
      child: ScreenImageButton(
        key: Key(_image),
        imageAsset: _image,
        title: 'Criar ameaça',
        subtitle:
            'Crie ou se vincule a mesa de um mestre, e comece a se divertir com seus amigos!',
        onTap: () {},
      ),
    );
  }
}
