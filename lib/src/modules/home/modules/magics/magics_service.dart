import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class MagicsService {
  List<Magic> getAllMagics() => _magics;

  final List<Magic> _magics = [
    Magic(
      name: 'Abençoar Alimentos',
      desc:
          'Você purifica e abençoa uma porção de comida ou dose de bebida. Isso torna um alimento sujo, estragado ou envenenado próprio para consumo.\n Além disso, se for consumido até o final da duração, o alimento oferece 5 PV temporários ou 1 PM temporário (além de quaisquer bônus que já oferecesse).\n\n Bônus de alimentação duram um dia e cada personagem só pode receber um bônus de alimentação por dia. \n\nTruque: o alimento é purificado (não causa nenhum efeito nocivo se estava estragado ou envenenado), mas não fornece bônus ao ser consumido. \n\n+1 PM: aumenta o número de alvos em +1.+1 PM: muda a duração para permanente, o alvo para 1 frasco com água e adiciona componente material (pó de prata no valor de T\$ 5). Em vez do normal, cria um frasco de água benta.',
      circle: firstCircle,
      type: MagicType.Divina,
      school: MagicSchool.Transmutacao,
      execution: MagicExecution.Padrao,
      duration: MagicDuration.Cena,
      range: MagicRange.Curto,
      resistence: 'Nenhuma',
      targetAreaEfect: 'Alimento para 1 criatura',
    ),
    Magic(
      name: 'Acalmar Animal',
      desc:
          "O animal fica prestativo em relação a você. Ele não fica sob seu controle, mas percebe suas palavras e ações da maneira mais favorável possível. Você recebe +10 nos testes de Adestramento e Diplomacia que fizer contra o animal. Um alvo hostil ou que esteja envolvido em um combate recebe +5 em seu teste de resistência. Se você ou seus aliados tomarem qualquer ação hostil contra o alvo, a magia é dissipada e ele retorna à atitude que tinha antes (ou piorada, de acordo com o mestre). Se tratar bem o alvo, a atitude pode permanecer mesmo após o término da magia.\n\n+1 PM: muda o alcance para médio.\n\n+1 PM: muda o alvo para 1 monstro ou espírito com Inteligência 1 ou 2.\n\n+2 PM: aumenta o número de alvos em +1.\n\n+5 PM: muda o alvo para 1 monstro ou espírito. Requer 3º círculo.",
      circle: firstCircle,
      type: MagicType.Divina,
      school: MagicSchool.Encantamento,
      execution: MagicExecution.Padrao,
      duration: MagicDuration.Cena,
      range: MagicRange.Curto,
      resistence: 'Vontade anula',
      targetAreaEfect: '1 animal',
    ),
    Magic(
      name: 'Açoite Flamejante',
      desc:
          "Um açoite de fogo surge em uma de suas mãos com a qual possa empunhar uma arma (essa mão fica ocupada pela duração da magia). Você pode usar uma ação padrão para causar 2d6 pontos de dano de fogo com o açoite em uma criatura em alcance curto e deixá-la em chamas e enredada enquanto estiver em chamas dessa forma. Passar na resistência reduz o dano à metade e evita as chamas.\n\n+2 PM: muda a execução para movimento.\n\n+2 PM: muda o dano para 4d6. Requer 2° círculo.\n\n+5 PM: muda o dano para 6d6. Requer 3° círculo.",
      circle: firstCircle,
      type: MagicType.Arcana,
      school: MagicSchool.Convocacao,
      execution: MagicExecution.Padrao,
      duration: MagicDuration.Sustentada,
      range: MagicRange.Pessoal,
      resistence: 'Reflexos reduz parcial',
      targetAreaEfect: 'Açoite de chamas criado em sua mão (veja texto)',
    ),
    Magic(
      name: 'Adaga Mental',
      desc:
          "Você manifesta e dispara uma adaga imaterial contra a mente do alvo, que sofre 2d6 pontos de dano psíquico e fica atordoado por uma rodada. Se passar no teste de resistência, sofre apenas metade do dano e evita a condição. Uma criatura só pode ficar atordoada por esta magia uma vez por cena.\n\n+1 PM: você lança a magia sem gesticular ou pronunciar palavras (o que permite lançar esta magia de armadura) e a adaga se torna invisível. Se o alvo falhar no teste de resistência, não percebe que você lançou uma magia contra ele.\n\n+2 PM: muda a duração para um dia. Além do normal, você “finca” a adaga na mente do alvo. Enquanto a magia durar, você sabe a direção e localização do alvo, desde que ele esteja no mesmo mundo.\n\n+2 PM: aumenta o dano em +1d6.",
      circle: firstCircle,
      type: MagicType.Arcana,
      school: MagicSchool.Convocacao,
      execution: MagicExecution.Padrao,
      duration: MagicDuration.Instantanea,
      range: MagicRange.Curto,
      resistence: 'Vontade parcial',
      targetAreaEfect: '1 criatura',
    ),
  ];
}
