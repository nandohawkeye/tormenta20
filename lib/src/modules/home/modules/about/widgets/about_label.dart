import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AboutLabel extends StatelessWidget {
  const AboutLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: T20UI.screenContentSpaceSize,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(T20UI.smallSpaceSize),
          child: Text.rich(
            TextSpan(
                text:
                    'Este é um projeto feito por um fã de RPG de mesa e de Tormenta 20 para fãs de RPG de mesa e de Tormenta 20, com o intuito de fomentar a ',
                children: [
                  TextSpan(
                    text: 'imaginação e a diversão',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: palette.selected,
                    ),
                  ),
                  const TextSpan(
                      text:
                          ' ao redor de uma mesa, e de ser um complemento e não um substituto aos livros de Tormenta 20.\n\n'),
                  TextSpan(
                    text:
                        'Tormenta 20 é um produto da Jambô Editora e seus respectivos criadores, todos os direitos reservados.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: palette.selected,
                    ),
                  ),
                  const TextSpan(
                      text:
                          '\n\nAbaixo você pode conferir mais informações sobre o desenvolvedor desse projeto, da editora e também de outros direitos reservados.')
                ]),
            maxLines: 2000,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
