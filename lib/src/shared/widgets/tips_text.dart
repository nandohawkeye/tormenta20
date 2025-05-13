import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class TipsText extends StatelessWidget {
  const TipsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 200,
      TextSpan(
        text: 'Saudações!\n\n',
        children: [
          const TextSpan(
              text:
                  'Primeiro vamos definir seu perfil, se você vai mestrar, criar e jogar com personagens ou ambos.'),
          const TextSpan(text: '\n\n'),
          TextSpan(
              text: 'Se você deseja mestrar:',
              style: TextStyle(color: palette.accent)),
          const TextSpan(text: '\n\n'),
          const TextSpan(
              text:
                  '⋆ Crie a mesa, Adicione seus materiais, links e atalhos(WhatsApp, Discord, Telegram  e pasta de arquivos online).'),
          const TextSpan(text: '\n\n'),
          const TextSpan(
              text:
                  '⋆ Compartilhe o arquivo da mesa com os jogadores, e peça pra eles clicarem no arquivo pra abrir nesse Aplicativo ou ir na sessão de Ajustes->importar arquivo de backup e selecionar o arquivo da mesa que você compartilhou e importar a mesa ao aplicativo dele'),
          const TextSpan(text: '\n\n'),
          const TextSpan(text: '⋆ Crie suas ameaças e vincule a mesa.'),
          const TextSpan(text: '\n\n'),
          TextSpan(
              text: 'Se você deseja jogar com personagens:',
              style: TextStyle(color: palette.accent)),
          const TextSpan(text: '\n\n'),
          const TextSpan(text: '⋆ Crie o personagem base.'),
          const TextSpan(text: '\n\n'),
          const TextSpan(
              text:
                  '⋆ Peça ao mestre que ele compartilhe com você o arquivo da mesa, após isso importe o arquivo clicando nele e abrindo neste aplicativo ou ir na sessão de Ajustes->importar.'),
          const TextSpan(text: '\n\n'),
          const TextSpan(text: '⋆ Vincule um personagem a está mesa'),
          const TextSpan(text: '\n\n'),
          const TextSpan(
              text:
                  '⋆ se quiser crie grimórios, adicione magias a ele e vincule-o ao personagem'),
          const TextSpan(text: '\n\n'),
          const TextSpan(
              text:
                  '⋆ BÒNUS: Compartilhe o arquivo do seu personagem com quem irá mestrar, pra ele também adiciona-lo a mesa, e assim facilitar a vida dele :)'),
        ],
      ),
    );
  }
}
