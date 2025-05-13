import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/tips/tips_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class InitTipField extends StatefulWidget {
  const InitTipField({super.key});

  @override
  State<InitTipField> createState() => _InitTipFieldState();
}

class _InitTipFieldState extends State<InitTipField> {
  late final ConfigStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<ConfigStore>();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: _store,
        builder: (_, __) {
          final isEnable = _store.config?.enableHomeTipes ?? false;
          if (!isEnable) return const SizedBox.shrink();

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RepaintBoundary(
                child: Padding(
                  padding: T20UI.allPadding,
                  child: Labels('Dicas'),
                ),
              ),
              RepaintBoundary(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  child: ScreenImageButton(
                    imageAsset: Assets.images.tip.path,
                    subtitle:
                        'Opa! Chegou agora!? \nClica aqui para conferir dicas para se divertir ao máximo com o T20',
                    onTapRemove: _store.disableHomeTypes,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TipsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
