import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class CoffeeBottomsheet extends StatelessWidget {
  const CoffeeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    const String data =
        '00020126580014br.gov.bcb.pix0136c4c16641-24af-44cf-9b1c-b827e1ab49f05204000053039865802BR5916Luiz F D M Neves6009Arapiraca62290525RF2CX7ovB5cGdKdO9EK9jMhr763042233';
    return BottomSheetBase(
      child: Padding(
        padding: EdgeInsets.only(
          left: T20UI.spaceSize,
          right: T20UI.spaceSize,
          bottom: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: palette.backgroundLevelOne,
              borderRadius: T20UI.borderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              T20UI.spaceHeight,
              const Text(
                'Muito obrigado pelo cafezinho, TMJ!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.tormenta,
                ),
              ),
              T20UI.spaceHeight,
              Card(
                color: Colors.white,
                child: InkWell(
                  borderRadius: T20UI.borderRadius,
                  onTap: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: data),
                    );
                  },
                  child: Padding(
                    padding: T20UI.allPadding,
                    child: QrImageView(data: data, size: 160),
                  ),
                ),
              ),
              T20UI.spaceHeight,
              const SizedBox(
                width: 200,
                child: Text(
                  'Você pode escanear e também clicar pra copiar o pix copia e cola',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              T20UI.spaceHeight,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DividerLevelTwo(verticalPadding: 0),
                  Padding(
                    padding: T20UI.allPadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: MainButton(
                            label: 'Voltar',
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
