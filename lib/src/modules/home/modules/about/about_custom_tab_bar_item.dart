import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';

class AboutCustomTabBarItem extends StatelessWidget {
  const AboutCustomTabBarItem({
    super.key,
    required this.title,
    required this.page,
    required this.currentPage,
    required this.changePage,
    required this.mainAxisAlignment,
  });

  final String title;
  final int page;
  final int currentPage;
  final Function(int) changePage;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final isSelected = page == currentPage;
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () => changePage(page),
            child: Labels(
              title,
              textColor: isSelected ? palette.textPrimary : palette.textDisable,
            ),
          ),
        ],
      ),
    );
  }
}
