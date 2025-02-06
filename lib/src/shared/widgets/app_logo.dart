import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  static const String _appLogoHeroTag = 'app_logo';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Hero(
        tag: _appLogoHeroTag,
        transitionOnUserGestures: true,
        child: SizedBox(
          width: width,
          height: height,
          child: Assets.images.logo.image(
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
