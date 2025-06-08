// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/gen/assets.gen.dart';

class WhatsappSvgIcon extends StatelessWidget {
  const WhatsappSvgIcon({super.key, this.size = 20, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        Assets.interface.whatsapp.path,
        color: color,
        height: size,
        width: size,
      ),
    );
  }
}
