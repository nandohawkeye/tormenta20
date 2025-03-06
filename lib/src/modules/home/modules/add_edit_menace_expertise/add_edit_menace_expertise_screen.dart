import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_store.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class AddEditMenaceExpertiseScreen extends StatefulWidget {
  const AddEditMenaceExpertiseScreen({super.key, this.expertise});

  final Expertise? expertise;

  @override
  State<AddEditMenaceExpertiseScreen> createState() =>
      _AddEditMenaceExpertiseScreenState();
}

class _AddEditMenaceExpertiseScreenState
    extends State<AddEditMenaceExpertiseScreen> {
  late final AddEditMenaceExpertiseStore store;
  @override
  void initState() {
    super.initState();
    store = AddEditMenaceExpertiseStore(widget.expertise);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Pericías',
      extraRightWidgets: [
        SimpleButton(
          iconColor: palette.onSelected,
          icon: FontAwesomeIcons.plus,
          onTap: () {},
        ),
        T20UI.spaceWidth,
      ],
      body: ListView.separated(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: T20UI.spaceSize,
          horizontal: T20UI.screenContentSpaceSize,
        ),
        itemCount: store.expertises.length,
        separatorBuilder: T20UI.separatorBuilderVertical,
        itemBuilder: (_, index) {
          return AddEditMenaceExpertiseCard(
            expertise: store.expertises[index],
            selected: store.selected,
            onTap: (_) {},
          );
        },
      ),
      onSave: () {},
    );
  }
}
