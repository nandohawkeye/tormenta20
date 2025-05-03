// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_card_prototype.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/add_edit_menace_expertise_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/widgets/add_edit_menace_create_expertise_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace_expertise/widgets/add_edit_menace_selected_expertise_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class AddEditMenaceExpertiseScreen extends StatefulWidget {
  const AddEditMenaceExpertiseScreen(
      {super.key, this.expertise, required this.parentUuid});

  final Expertise? expertise;
  final String parentUuid;

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
    store = AddEditMenaceExpertiseStore();
    if (widget.expertise != null) {
      _callBottomSheets(widget.expertise!);
    }
  }

  void _callBottomSheets(Expertise base) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (base.id == 0) {
        _onCreate(base);
      } else {
        _onTap(base);
      }
    });
  }

  void _onTap(ExpertiseBase base) async {
    await BottomsheetUtils.show<Expertise?>(
      isDismissible: widget.expertise == null,
      context: context,
      child: AddEditMenaceSelectedExpertiseBottomsheet(
        expertiseBase: base,
        parentUuid: widget.parentUuid,
        expertiseUuid: widget.expertise?.uuid,
        valueFinal: widget.expertise?.valueFinal,
      ),
    ).then((result) {
      if (result == null) {
        if (widget.expertise != null) {
          Navigator.pop(context);
        }
      } else {
        Navigator.pop(context, result);
      }
    });
  }

  void _onCreate(ExpertiseBase? base) async {
    await BottomsheetUtils.show<Expertise?>(
      isDismissible: widget.expertise == null,
      context: context,
      child: AddEditMenaceCreateExpertiseBottomsheet(
        expertiseBase: base,
        parentUuid: widget.parentUuid,
        expertiseUuid: widget.expertise?.uuid,
        valueFinal: widget.expertise?.valueFinal,
      ),
    ).then((result) {
      if (result == null) {
        if (widget.expertise != null) {
          Navigator.pop(context);
        }
      } else {
        Navigator.pop(context, result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Pericías',
      onSaveLabel: 'Criar',
      body: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: T20UI.spaceSize,
          horizontal: T20UI.screenContentSpaceSize,
        ),
        itemCount: store.expertises.length,
        prototypeItem: const AddEditMenaceExpertiseCardPrototype(),
        itemBuilder: (_, index) {
          return AddEditMenaceExpertiseCard(
            expertise: store.expertises[index],
            onTap: _onTap,
          );
        },
      ),
      onSave: () => _onCreate(null),
    );
  }
}
