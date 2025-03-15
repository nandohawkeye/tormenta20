import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/rool_dice.dart';
import 'package:tormenta20/src/shared/entities/rool_dice_adapters.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field_card.dart';
import 'package:tormenta20/src/shared/widgets/warning_widget.dart';

class AddEditDicesField extends StatefulWidget {
  const AddEditDicesField({
    super.key,
    this.isExtra = false,
    this.hasError = false,
    this.isObrigatory = false,
    this.initialValue,
    required this.onChangeValues,
    this.helpText,
  });

  final bool isExtra;
  final bool isObrigatory;
  final bool hasError;
  final String? helpText;
  final String? initialValue;
  final Function(List<RoolDice>) onChangeValues;

  @override
  State<AddEditDicesField> createState() => _AddEditDicesFieldState();
}

class _AddEditDicesFieldState extends State<AddEditDicesField> {
  late final TextEditingController _quantEditController;
  late final TextEditingController _dicesEditController;
  late final ValueNotifier<List<RoolDice>> _roolDices;
  void _addDice(RoolDice value) {
    List<RoolDice> oldValues = _roolDices.value;
    _roolDices.value = [value, ...oldValues];
    widget.onChangeValues(_roolDices.value);
  }

  void _removeDice(RoolDice value) {
    List<RoolDice> oldValues = _roolDices.value;
    oldValues.remove(value);
    _roolDices.value = [...oldValues];
    widget.onChangeValues(_roolDices.value);
  }

  @override
  void initState() {
    super.initState();
    _quantEditController = TextEditingController(text: '1');
    _dicesEditController = TextEditingController();
    _roolDices = ValueNotifier<List<RoolDice>>([]);
    _addInitialValue(widget.initialValue);
  }

  @override
  void dispose() {
    _quantEditController.dispose();
    _dicesEditController.dispose();
    _roolDices.dispose();
    super.dispose();
  }

  void _addInitialValue(String? value) {
    if (value == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final values = value.split(',');
      final dices = values.map(RoolDiceAdapters.fromMacro);
      _roolDices.value = [...dices];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AnimatedContainer(
                duration: T20UI.defaultDurationAnimation,
                decoration: BoxDecoration(
                  color: palette.backgroundLevelOne,
                  borderRadius: T20UI.borderRadius,
                  border: Border.all(
                    width: 2,
                    color: widget.hasError
                        ? palette.accent
                        : palette.backgroundLevelOne,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: T20UI.screenContentSpaceSize,
                        top: T20UI.smallSpaceSize,
                        bottom: T20UI.smallSpaceSize,
                      ),
                      child: Text('Dados ${widget.isExtra ? 'extra' : ''}'),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _roolDices,
                      builder: (_, dices, __) {
                        if (dices.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return const SizedBox(height: T20UI.inputHeight + 12);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: T20UI.smallSpaceSize,
                        right: T20UI.smallSpaceSize,
                        bottom: T20UI.smallSpaceSize,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _quantEditController,
                              style: const TextStyle(fontSize: 16),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              decoration: InputDecoration(
                                labelText: 'Quantidade',
                                fillColor: palette.backgroundLevelTwo,
                              ),
                            ),
                          ),
                          const SizedBox(width: T20UI.smallSpaceSize),
                          Expanded(
                            child: TextFormField(
                              controller: _dicesEditController,
                              style: const TextStyle(fontSize: 16),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              decoration: InputDecoration(
                                labelText: 'Dado',
                                prefix: const Text('D',
                                    style: TextStyle(fontSize: 16)),
                                fillColor: palette.backgroundLevelTwo,
                              ),
                            ),
                          ),
                          const SizedBox(width: T20UI.smallSpaceSize),
                          SimpleButton(
                            icon: FontAwesomeIcons.plus,
                            backgroundColor: palette.backgroundLevelTwo,
                            iconColor: palette.accent,
                            onTap: () {
                              final quantity = _quantEditController.text;
                              final diceValue = _dicesEditController.text;

                              if (quantity.isEmpty || diceValue.isEmpty) return;

                              final dice =
                                  RoolDiceAdapters.create(quantity, diceValue);
                              _addDice(dice);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _roolDices,
              builder: (_, dices, __) {
                if (dices.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    top: T20UI.spaceSize * 2,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    child: ListView.separated(
                      itemCount: dices.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: T20UI.smallSpaceSize),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: T20UI.smallSpaceSize),
                        child: Center(child: Icon(FontAwesomeIcons.plus)),
                      ),
                      itemBuilder: (_, index) => AddEditDicesFieldCard(
                        dice: dices[index],
                        onRemove: _removeDice,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        WarningWidget(
          isObrigatory: widget.isObrigatory,
          hasError: widget.hasError,
          helpText: widget.helpText,
        )
      ],
    );
  }
}
