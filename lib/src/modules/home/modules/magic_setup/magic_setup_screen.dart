import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magic_setup/magic_setup_store.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/textfields/cd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/medio_damage_value_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/pm_textfield.dart';

class MagicSetupScreen extends StatefulWidget {
  const MagicSetupScreen({super.key, required this.magic});

  final MagicCharacter magic;

  @override
  State<MagicSetupScreen> createState() => _MagicSetupScreenState();
}

class _MagicSetupScreenState extends State<MagicSetupScreen> {
  late final MagicSetupStore _store;

  @override
  void initState() {
    super.initState();
    _store = MagicSetupStore(widget.magic);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Configurando ${widget.magic.name}',
      onSave: () {
        final magic = _store.onSave();

        Navigator.pop(context, magic);
      },
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: PmTextfield(
                        onchange: _store.setPm,
                        initialValue: widget.magic.pm ?? 1,
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: CdTextfield(
                        onchange: _store.setCd,
                        initialValue: widget.magic.cd ?? 0,
                      ),
                    )
                  ],
                ),
              ),
              T20UI.spaceHeight,
              AddEditDicesField(
                initialValue: widget.magic.damageDices,
                onChangeValues: _store.onChangeDice,
              ),
              T20UI.spaceHeight,
              AddEditDicesField(
                isExtra: true,
                initialValue: widget.magic.extraDamageDices,
                onChangeValues: _store.onChangeExtraDice,
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: MedioDamageValueTextfield(
                  onchange: _store.setMediumDamage,
                  initialValue: widget.magic.mediumDamageValue,
                ),
              )
            ],
          ),
          T20UI.spaceHeight,
        ],
      ),
    );
  }
}
