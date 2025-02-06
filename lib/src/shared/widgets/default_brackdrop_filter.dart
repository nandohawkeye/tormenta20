import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class DefaultBrackdropFilter extends StatelessWidget {
  const DefaultBrackdropFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: palette.accent.withOpacity(.1),
          height: context.height,
          width: context.width,
        ),
      ),
    );
  }
}
