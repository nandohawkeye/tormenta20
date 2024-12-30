import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddGrimorieBottomsheet extends StatefulWidget {
  const AddGrimorieBottomsheet({super.key, this.initialGrimoire});

  final Grimoire? initialGrimoire;

  @override
  State<AddGrimorieBottomsheet> createState() => _AddGrimorieBottomsheetState();
}

class _AddGrimorieBottomsheetState extends State<AddGrimorieBottomsheet> {
  final _formKey = GlobalKey<FormState>();

  late final ValueNotifier<String?> _name;
  late final ValueNotifier<String?> _desc;
  late final ValueNotifier<String?> _imagePath;
  late final ValueNotifier<String?> _errorName;
  String? _validName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'O nome é obrigatório!';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _name = ValueNotifier<String?>(widget.initialGrimoire?.name);
    _desc = ValueNotifier<String?>(widget.initialGrimoire?.desc);
    _imagePath = ValueNotifier<String?>(widget.initialGrimoire?.imagePath);
    _errorName = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _name.dispose();
    _desc.dispose();
    _imagePath.dispose();
    _errorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .6);

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.primaryCTA.withOpacity(.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: limite,
          initialChildSize: initialSize,
          builder: (context, scrollController) {
            return Padding(
              padding: T20UI.allPaddingWithPaddingBottom(context,
                  extra: MediaQuery.of(context).padding.bottom),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: palette.bottomSheetBackground,
                      borderRadius: T20UI.borderRadius),
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
                              '${widget.initialGrimoire != null ? 'Editando' : 'Criando'} grimório',
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'tormenta',
                              ),
                            ),
                          ),
                          T20UI.spaceHeight,
                        ],
                      ),
                      const BottomSheetDivider(verticalPadding: 0),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: T20UI.verticalPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Padding(
                                  padding: T20UI.horizontalPadding,
                                  child: ValueListenableBuilder(
                                    valueListenable: _errorName,
                                    builder: (_, error, __) => TextFormField(
                                      autofocus: true,
                                      onChanged: (value) {
                                        _name.value = value;
                                        _errorName.value = _validName(value);
                                      },
                                      validator: _validName,
                                      style: const TextStyle(fontSize: 16),
                                      decoration: InputDecoration(
                                        hintText: 'Nome',
                                        errorText: error,
                                        fillColor: palette.onBottomsheet,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: palette.textPrimary),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: T20UI.spaceSize,
                                        ),
                                        helperText: 'Obrigatório',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              T20UI.spaceHeight,
                              Padding(
                                padding: T20UI.horizontalPadding,
                                child: SizedBox(
                                  height: T20UI.inputHeight,
                                  width: double.infinity,
                                  child: Card(
                                    color: palette.onBottomsheet,
                                    child: InkWell(
                                      borderRadius: T20UI.borderRadius,
                                      onTap: () {},
                                      child: Padding(
                                        padding: T20UI.horizontalPadding,
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.image),
                                            SizedBox(width: 8),
                                            Text(
                                              'Imagem',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              T20UI.spaceHeight,
                              Padding(
                                padding: T20UI.horizontalPadding,
                                child: TextField(
                                  autofocus: true,
                                  onChanged: (value) => _desc.value = value,
                                  maxLines: 4,
                                  style: const TextStyle(fontSize: 16),
                                  decoration: InputDecoration(
                                    hintText: 'Descrição',
                                    fillColor: palette.onBottomsheet,
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: palette.textPrimary),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: T20UI.spaceSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BottomSheetDivider(verticalPadding: 0),
                          Padding(
                            padding: T20UI.allPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: MainButton(
                                    label: widget.initialGrimoire != null
                                        ? 'Salvar'
                                        : 'Criar',
                                    onTap: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        //TODO cria aqui
                                      }
                                    },
                                  ),
                                ),
                                T20UI.spaceWidth,
                                const SimpleCloseButton()
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
          },
        ),
      ],
    );
  }
}
