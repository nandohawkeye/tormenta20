import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/home_screen_store.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/modules/home/widgets/tip_home_bottomsheet/tip_home_bottomsheet.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/app_logo.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenStore _store;
  late StreamSubscription _intentSub;

  static const _pages = <Widget>[
    InitScreen(),
    MagicsScreen(),
    AboutScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _store = HomeScreenStore();

    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen(
        (List<SharedMediaFile> value) {
      if (kDebugMode) print('compartinhado app aberto: $value');

      if (value.isNotEmpty) {
        _openBottomSheetImport(File(value.first.path));
      }
    }, onError: (err) {
      if (kDebugMode) print("Erro ao receber arquivo: $err");
    });

    ReceiveSharingIntent.instance
        .getInitialMedia()
        .then((List<SharedMediaFile> value) {
      if (kDebugMode) print('compartinhado app ao abrir: $value');

      if (value.isNotEmpty) {
        _openBottomSheetImport(File(value.first.path));
      }
    });
  }

  @override
  void dispose() {
    _store.dispose();
    _intentSub.cancel();
    super.dispose();
  }

  void _openBottomSheetImport([File? file]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BottomsheetUtils.show(
        context: context,
        child: ImportFileBottomsheet(initialFile: file),
      );
    });
  }

  void _openTypeBotomSheet() {
    BottomsheetUtils.show(
      context: context,
      child: const TipHomeBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _store,
      builder: (_, __) {
        final currentIndex = _store.index;
        return Scaffold(
          appBar: AppBar(
            title: const AppLogo(width: 160),
            actions: [
              if (currentIndex != 2)
                AnimationConfiguration.synchronized(
                  duration: T20UI.defaultDurationAnimation,
                  child: FadeInAnimation(
                    child: SimpleButton(
                      icon: FontAwesomeIcons.solidLightbulb,
                      backgroundColor: palette.background,
                      iconSize: 20,
                      onTap: _openTypeBotomSheet,
                    ),
                  ),
                ),
            ],
          ),
          body: _pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: _store.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.diceD20),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.hatWizard),
                label: 'Magias',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.gear),
                label: 'Sobre',
              ),
            ],
          ),
        );
      },
    );
  }
}
