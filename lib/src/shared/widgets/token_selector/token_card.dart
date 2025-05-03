import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_bord.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_tag.dart';

class TokenCard extends StatelessWidget {
  const TokenCard({
    super.key,
    required this.assetPath,
    this.selected,
    required this.onTap,
    required this.size,
    required this.isMenace,
  });

  final String assetPath;
  final String? selected;
  final Function(String) onTap;
  final double size;
  final bool isMenace;

  @override
  Widget build(BuildContext context) {
    final isSelected = assetPath == selected;
    final label =
        assetPath.split('/').last.replaceAll('_', ' ').replaceAll('.png', '');
    return InkWell(
      borderRadius: BorderRadius.circular(20000),
      onTap: () => onTap(assetPath),
      child: SizedBox(
        height: size + 10,
        width: size + 10,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.asset(
                    assetPath,
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                    cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                        context, size),
                    cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                        context, size),
                  ),
                ),
              ),
            ),
            if (isSelected)
              TokenCardBord(
                size: size,
                isMenace: isMenace,
              ),
            TokenCardTag(
              tag: label == 'Anao' ? 'Anão' : label,
            )
          ],
        ),
      ),
    );
  }
}
