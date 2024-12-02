import 'package:tormenta20/src/shared/entities/magic.dart';
import 'package:tormenta20/src/shared/entities/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic_type.dart';

final List<Magic> magics = [
  Magic(
    name: 'Abençoar Alimentos',
    desc:
        'Você purifica e abençoa uma porção de comida ou dose de bebida. Isso torna um alimento sujo, estragado ou envenenado próprio para consumo.\n Além disso, se for consumido até o final da duração, o alimento oferece 5 PV temporários ou 1 PM temporário (além de quaisquer bônus que já oferecesse).\n\n Bônus de alimentação duram um dia e cada personagem só pode receber um bônus de alimentação por dia. \n\nTruque: o alimento é purificado (não causa nenhum efeito nocivo se estava estragado ou envenenado), mas não fornece bônus ao ser consumido. \n\n+1 PM: aumenta o número de alvos em +1.+1 PM: muda a duração para permanente, o alvo para 1 frasco com água e adiciona componente material (pó de prata no valor de T\$ 5). Em vez do normal, cria um frasco de água benta.',
    circle: firstCircle,
    type: MagicType.Divina,
    school: MagicSchool.Transmutacao,
    execution: 'padrão',
    duration: 'cena',
    range: 'curto',
    resistence: 'nenhuma',
    targetAreaEfect: 'alimento para 1 criatura',
  )
];
