import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/pdf_view/pdf_view_store.dart';
import 'package:tormenta20/src/shared/utils/lottie_utils.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({
    super.key,
    required this.path,
    this.screenLabel,
  });

  final String path;
  final String? screenLabel;

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  late final PdfViewStore _store;

  @override
  void initState() {
    super.initState();
    _store = PdfViewStore();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(height: kTextTabBarHeight + (T20UI.spaceSize * 3)),
          AnimatedBuilder(
              animation: _store,
              builder: (_, __) {
                final enableToView = _store.isEnableLable;
                final isOnlyPage = _store.isOnlyPage;
                final current = _store.currentPage;
                final count = _store.pagesCount;

                final String label = isOnlyPage
                    ? 'Página única'
                    : enableToView
                        ? 'Página ${current.toString().padLeft(2, '0')} de ${count.toString().padLeft(2, '0')}'
                        : '';

                return Text(
                  label,
                  style: TextStyle(
                    color: palette.accent,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 24,
                  ),
                );
              }),
          T20UI.spaceHeight,
          Expanded(
            child: PDF(
              backgroundColor: palette.background,
              autoSpacing: true,
              pageFling: true,
              onPageChanged: _store.changePage,
            ).fromPath(
              widget.path,
              key: ValueKey(widget.path),
            ),
          ),
          T20UI.spaceHeight,
          AnimatedBuilder(
            animation: _store,
            builder: (_, __) {
              return AnimatedOpacity(
                opacity: _store.enableIndicatorMorePages ? 1 : 0,
                duration: T20UI.defaultDurationAnimation,
                child: Transform.rotate(
                  angle: 33,
                  child: Lottie.asset(
                    height: 30,
                    width: 30,
                    Assets.lottie.arrows,
                    repeat: true,
                    fit: BoxFit.cover,
                    decoder: LottieUtils.lottieFormatDecoder,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: T20UI.horizontalPadding.copyWith(
              top: T20UI.spaceSize * 2,
              bottom: T20UI.spaceSize + MediaQuery.of(context).padding.bottom,
            ),
            child: SizedBox(
              height: T20UI.inputHeight,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: 'Compatilhar',
                      onTap: () async =>
                          await Share.shareXFiles([XFile(widget.path)]),
                    ),
                  ),
                  T20UI.spaceWidth,
                  const SimpleCloseButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
