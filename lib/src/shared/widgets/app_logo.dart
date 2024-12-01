import 'package:flutter/material.dart';

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
          child: Image.asset(
            'assets/images/logo.png',
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
