import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AboutLabel extends StatelessWidget {
  const AboutLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
      child: Text.rich(
        TextSpan(
            text:
                'Este é um projeto feito por um fã de RPG\'s de mesa e de Tormenta 20 para fãs de RPG\'s de mesa e de Tormenta 20, com o intuito de fomentar a ',
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
                    'Tormenta 20 pertence a Jambo Editora, Todos os direitos sobre a marca Tormenta 20 são reservados a editora.',
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
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
