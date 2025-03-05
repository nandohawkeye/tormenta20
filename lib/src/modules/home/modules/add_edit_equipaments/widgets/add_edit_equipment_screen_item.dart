import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AddEditEquipmentScreenItem extends StatelessWidget {
  const AddEditEquipmentScreenItem({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    required this.hasInited,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool hasInited;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding.copyWith(bottom: T20UI.spaceSize),
      child: AnimationConfiguration.synchronized(
        duration: hasInited ? T20UI.defaultDurationAnimation : Duration.zero,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
