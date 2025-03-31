import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_desc.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_item.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_store.dart';
import 'package:tormenta20/src/modules/home/modules/magic_selected/magic_selected_grimories.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class MagicSelected extends StatefulWidget {
  const MagicSelected({
    super.key,
    required this.magic,
    required this.enableGrimories,
  });

  final Magic magic;
  final bool enableGrimories;

  @override
  State<MagicSelected> createState() => _MagicSelectedState();
}

class _MagicSelectedState extends State<MagicSelected> {
  late final MagicSelectedStore _store;

  @override
  void initState() {
    super.initState();
    _store = MagicSelectedStore(widget.magic);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SimpleCloseButton(
        backgroundColor: palette.backgroundLevelTwo,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(label: widget.magic.name),
          const Divider(),
          MagicSelectedGrimories(
            magic: widget.magic,
            store: _store,
            enableGrimories: widget.enableGrimories,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: T20UI.verticalPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.screenContentSpaceSize,
                    ),
                    child: Wrap(
                      runSpacing: T20UI.spaceSize,
                      spacing: T20UI.spaceSize,
                      children: [
                        MagicSelectedItem(
                          icon: FontAwesomeIcons.circleDot,
                          preffix: '${widget.magic.circle.level}˚',
                          text: ' Circulo',
                        ),
                        MagicSelectedItem(
                          preffix: 'Tipo: ',
                          icon: FontAwesomeIcons.hatWizard,
                          text: widget.magic.type.name,
                        ),
                        MagicSelectedItem(
                          preffix: 'Alcance: ',
                          icon: FontAwesomeIcons.peopleArrows,
                          text: widget.magic.range.name == 'Medio'
                              ? 'Médio'
                              : widget.magic.range.name,
                        ),
                        MagicSelectedItem(
                          preffix: 'Escola: ',
                          icon: FontAwesomeIcons.school,
                          text: MagicUtils
                                  .schollLabels[widget.magic.school.name] ??
                              widget.magic.school.name,
                        ),
                        MagicSelectedItem(
                          preffix: 'Execução: ',
                          icon: FontAwesomeIcons.handSparkles,
                          text: MagicUtils.executionsLabels[
                                  widget.magic.execution.name] ??
                              widget.magic.execution.name,
                        ),
                        MagicSelectedItem(
                          preffix: 'Publicação: ',
                          icon: FontAwesomeIcons.bookOpen,
                          text: widget.magic.publication,
                        ),
                        MagicSelectedItem(
                          preffix: 'Duração: ',
                          icon: FontAwesomeIcons.hourglassHalf,
                          text: MagicUtils
                                  .durationLabels[widget.magic.duration.name] ??
                              widget.magic.duration.name,
                        ),
                        MagicSelectedItem(
                          preffix: 'Resistência: ',
                          icon: FontAwesomeIcons.shieldHalved,
                          text: widget.magic.resistence,
                        ),
                        MagicSelectedItem(
                          preffix: 'Alvo/Área/Efeito: ',
                          icon: FontAwesomeIcons.locationCrosshairs,
                          text: widget.magic.targetAreaEffect,
                        ),
                        MagicSelectedDesc(widget.magic.desc),
                        T20UI.safeAreaBottom(context, additionalHeight: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
