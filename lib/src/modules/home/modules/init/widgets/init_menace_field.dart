import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/manace_screen_button.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/menace_card/menace_card.dart';
import 'package:tormenta20/src/modules/home/modules/menace/menace_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class InitMenaceField extends StatefulWidget {
  const InitMenaceField({super.key});

  @override
  State<InitMenaceField> createState() => _InitMenaceFieldState();
}

class _InitMenaceFieldState extends State<InitMenaceField> {
  late final InitStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<InitStore>();
  }

  _onShowMenace(Menace menace) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MenaceScreen(
          menace: menace,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RepaintBoundary(
          child: Padding(
            padding: T20UI.allPadding,
            child: Labels('Ameaças'),
          ),
        ),
        RepaintBoundary(
          child: ListenableBuilder(
            listenable: _store,
            builder: (_, __) {
              final menaces = _store.menaces;

              if (menaces.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  child: ManaceScreenButton(),
                );
              }

              return SizedBox(
                height: 120 * context.realTextScale,
                width: double.infinity,
                child: ListView.separated(
                  itemCount: menaces.length,
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: T20UI.separatorBuilderHorizontal,
                  itemBuilder: (_, index) {
                    return MenaceCard(
                      menace: menaces[index],
                      onTap: _onShowMenace,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
