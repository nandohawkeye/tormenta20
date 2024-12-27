import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_card/magic_card.dart';

class MagicsWrap extends StatelessWidget {
  const MagicsWrap({super.key, required this.store});

  final MagicsStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: store.magics
              .map(
                (magic) => MagicCard(
                  magic: magic,
                  searchFilter: store.searchFilter,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
