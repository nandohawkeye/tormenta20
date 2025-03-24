import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/clone_menace_bottomsheet/clone_menace_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/custom_loader.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_selector.dart';

class CloneMenaceBottomsheet extends StatefulWidget {
  const CloneMenaceBottomsheet(this.menace, {super.key});

  final Menace menace;

  @override
  State<CloneMenaceBottomsheet> createState() => _CloneMenaceBottomsheetState();
}

class _CloneMenaceBottomsheetState extends State<CloneMenaceBottomsheet> {
  final _formKey = GlobalKey<FormState>();
  late final CloneMenaceBottomsheetStore _store;

  @override
  void initState() {
    super.initState();
    _store = CloneMenaceBottomsheetStore(widget.menace);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Text(
                  'Clonar ${widget.menace.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily.tormenta,
                  ),
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          const DividerLevelTwo(verticalPadding: 0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              AnimatedBuilder(
                animation: _store,
                builder: (_, __) {
                  final imageAsset = _store.imageAsset;
                  final imagePath = _store.imagePath;
                  return TokenSelector(
                    allTokens: Assets.tokens.values.map((t) => t.path).toList(),
                    changeAsset: _store.setImageAsset,
                    changePath: _store.setImagePath,
                    initalImageAsset: imageAsset,
                    initialImagePath: imagePath,
                    isMenace: true,
                    size: 80,
                  );
                },
              ),
              T20UI.spaceHeight,
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: Form(
                  key: _formKey,
                  child: NameTextField(
                    initialName: widget.menace.name,
                    onchange: _store.changeName,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              AnimatedBuilder(
                animation: _store,
                builder: (_, __) {
                  final state = _store.state;

                  if (state == CloneMenaceStates.error) {
                    return Padding(
                      padding: T20UI.horizontallScreenPadding
                          .copyWith(bottom: T20UI.spaceSize),
                      child: Text(
                        'Não foi possível clonar ameaça',
                        style: TextStyle(
                          fontSize: 18,
                          color: palette.accent,
                          fontFamily: FontFamily.tormenta,
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DividerLevelTwo(verticalPadding: 0),
              Padding(
                padding: T20UI.allPadding,
                child: AnimatedBuilder(
                  animation: _store,
                  builder: (_, __) {
                    final state = _store.state;
                    final buttonLabel = state == CloneMenaceStates.loading
                        ? 'Clonando...'
                        : state == CloneMenaceStates.success
                            ? 'Sucesso!'
                            : state == CloneMenaceStates.error
                                ? 'Tentar novamente'
                                : 'Clonar';
                    return Row(
                      children: [
                        if (state == CloneMenaceStates.loading)
                          const CustomLoader(size: 50),
                        Expanded(
                          child: MainButton(
                            label: buttonLabel,
                            icon: state == CloneMenaceStates.success
                                ? FontAwesomeIcons.solidCircleCheck
                                : null,
                            isEnable: state == CloneMenaceStates.error ||
                                state == CloneMenaceStates.idle,
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _store.clone();
                              }
                            },
                          ),
                        ),
                        const SimpleCloseButton()
                      ],
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
