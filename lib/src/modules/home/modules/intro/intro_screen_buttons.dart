// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/home_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';

class IntroScreenButtons extends StatefulWidget {
  const IntroScreenButtons(this.pageController,
      {super.key, required this.fromSplash});

  final PageController pageController;
  final bool fromSplash;

  @override
  State<IntroScreenButtons> createState() => _IntroScreenButtonsState();
}

class _IntroScreenButtonsState extends State<IntroScreenButtons> {
  late final ValueNotifier<bool> _enableBackButon;
  late final ConfigStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<ConfigStore>();
    _enableBackButon = ValueNotifier<bool>(false);
    widget.pageController.addListener(_listernerPageController);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_listernerPageController);
    _enableBackButon.dispose();
    super.dispose();
  }

  void _listernerPageController() {
    final currentPage = widget.pageController.page ?? 0;
    if (currentPage > 0 && !_enableBackButon.value) {
      _enableBackButon.value = true;
    }

    if (currentPage < 1 && _enableBackButon.value) {
      _enableBackButon.value = false;
    }
  }

  Future<void> _toHome() async {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<FilePicker>(FilePicker.platform);

    getIt.registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform);

    getIt.registerSingletonAsync<GrimoriesStore>(GrimoriesStore().init);

    getIt.registerSingletonAsync<InitStore>(InitStore().init);

    _store.markShowApresentation();

    await getIt.allReady();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontallScreenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RepaintBoundary(
            child: ValueListenableBuilder(
              valueListenable: _enableBackButon,
              builder: (_, isEnable, __) {
                return TextButton(
                  onPressed: !isEnable
                      ? null
                      : () {
                          final currentPage = widget.pageController.page ?? 0;
                          if (currentPage > 0) {
                            widget.pageController.animateToPage(
                                (currentPage - 1).toInt(),
                                duration: const Duration(seconds: 1),
                                curve: Curves.bounceOut);
                          }
                        },
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: !isEnable
                            ? Colors.transparent
                            : palette.textDisable),
                  ),
                );
              },
            ),
          ),
          RepaintBoundary(
            child: AnimationConfiguration.synchronized(
              duration: T20UI.defaultDurationAnimation,
              child: ScaleAnimation(
                child: SizedBox(
                  height: T20UI.inputHeight + 12,
                  width: T20UI.inputHeight + 12,
                  child: Card(
                    color: palette.selected,
                    shape: const CircleBorder(),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(2000),
                        onTap: () async {
                          final currentPage = widget.pageController.page ?? 0;
                          if (currentPage < 3) {
                            widget.pageController.animateToPage(
                                (currentPage + 1).toInt(),
                                duration: const Duration(seconds: 2),
                                curve: Curves.bounceOut);
                          } else {
                            if (widget.fromSplash) {
                              await _toHome();
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: const Icon(FontAwesomeIcons.arrowRight)),
                  ),
                ),
              ),
            ),
          ),
          RepaintBoundary(
            child: TextButton(
              onPressed: widget.fromSplash
                  ? () async => await _toHome()
                  : () => Navigator.pop(context),
              child: Text(
                widget.fromSplash ? 'Pular' : 'Fechar',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: palette.textDisable,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
