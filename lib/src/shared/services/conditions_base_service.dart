import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/conditions_base.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';

class ConditionsBaseService {
  final _abalado = ConditionsBase(
    id: 1,
    name: 'Abalado',
    desc:
        'O personagem sofre –2 em testes de perícia. Se ficar abalado novamente, em vez disso fica apavorado. Medo.',
    dice: null,
    inAllExpertises: true,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _agarrado = ConditionsBase(
    id: 2,
    name: 'Agarrado',
    desc:
        'O personagem fica desprevenido e móvel, sofre –2 em testes de ataque e só pode atacar com armas leves. Ataques à distância contra um alvo envolvido em uma manobra agarrar têm 50% de chance de acertar o alvo errado. Movimento.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: true,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _alquebrado = ConditionsBase(
    id: 3,
    name: 'Alquebrado',
    desc:
        'O custo em pontos de mana das habilidades do personagem aumenta em +1. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: true,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _apavorado = ConditionsBase(
    id: 4,
    name: 'Apavorado',
    desc:
        'O personagem sofre –5 em testes de perícia e não pode se aproximar voluntariamente da fonte do medo. Medo.',
    dice: null,
    inAllExpertises: true,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _atordoado = ConditionsBase(
    id: 5,
    name: 'Atordoado',
    desc: 'O personagem fica desprevenido e não pode fazer ações. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _caido = ConditionsBase(
    id: 6,
    name: 'Caído',
    desc:
        'O personagem sofre –5 na Defesa contra ataques corpo a corpo e recebe +5 na Defesa contra ataques à distância (cumulativos com outras condi-ções). Além disso, sofre –5 em ataques corpo a corpo e seu deslocamento é reduzido a 1,5m.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: true,
    inDisplacment: true,
    atributes: [],
    expertises: [],
  );

  final _cego = ConditionsBase(
    id: 7,
    name: 'Cego',
    desc:
        'O personagem fica desprevenido e lento, não pode fazer testes de Percepção para observar e sofre –5 em testes de perícias baseadas em Força ou Destreza. Todos os alvos de seus ataques recebem camuflagem total. Você é considerado cego enquanto estiver em uma área de escuridão total, a menos que algo lhe permita perceber no escuro. Sentidos.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [Atribute.strength, Atribute.dexterity],
    expertises: [ExpertisesBaseService().percepcao],
  );

  final _confuso = ConditionsBase(
    id: 8,
    name: 'Confuso',
    desc:
        'O personagem comporta-se de modo aleatório. Role 1d6 no início de seus turnos: 1) Movimenta-se em uma direção escolhida por uma rolagem de 1d8; 2-3) Não pode fazer ações, e fica balbuciando incoerentemente; 4-5) Usa a arma que estiver empunhando para atacar a criatura mais próxima, ou a si mesmo se estiver sozinho (nesse caso, apenas role o dano); 6) A condição termina e pode agir normalmente. Mental.',
    dice: Dice(uuid: '', quantity: 1, sides: 6),
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _debilitado = ConditionsBase(
    id: 9,
    name: 'Debilitado',
    desc:
        'O personagem sofre –5 em testes de Força, Destreza e Constituição e de perícias baseadas nesses atributos. Se o personagem ficar debilitado novamente, em vez disso fica inconsciente.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [Atribute.strength, Atribute.dexterity, Atribute.constitution],
    expertises: [],
  );

  final _desprevenido = ConditionsBase(
    id: 10,
    name: 'Desprevenido',
    desc:
        'O personagem sofre –5 na Defesa e em Reflexos. Você fica desprevenido contra inimigos que não possa perceber.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: true,
    inDisplacment: false,
    atributes: [],
    expertises: [ExpertisesBaseService().reflexos],
  );

  final _doente = ConditionsBase(
    id: 11,
    name: 'Doente',
    desc: 'Sob efeito de uma doença. Metabolismo.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _emChamas = ConditionsBase(
    id: 12,
    name: 'Em Chamas',
    desc:
        'O personagem está pegando fogo. No início de seus turnos, sofre 1d6 pontos de dano de fogo. O personagem pode gastar uma ação padrão para apagar o fogo com as mãos. Imersão em água também apaga as chamas.',
    dice: Dice(uuid: '', quantity: 1, sides: 6),
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _enfeiticado = ConditionsBase(
    id: 13,
    name: 'Enfeitiçado',
    desc:
        'O personagem se torna prestativo em relação à fonte da condição. Ele não fica sob controle da fonte, mas percebe suas palavras e ações da maneira mais favorável possível. A fonte da condição recebe +10 em testes de Diplomacia com o personagem. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _enjoado = ConditionsBase(
    id: 14,
    name: 'Enjoado',
    desc:
        'O personagem só pode realizar uma ação padrão ou de movimento (não ambas) por rodada. Ele pode gastar uma ação padrão para fazer uma investida, mas pode avançar no máximo seu deslocamento (e não o dobro). Metabolismo.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _enredado = ConditionsBase(
    id: 15,
    name: 'Enredado',
    desc:
        'O personagem fica lento, vulnerá-vel e sofre –2 em testes de ataque. Movimento.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: true,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _envenenado = ConditionsBase(
    id: 16,
    name: 'Envenenado',
    desc:
        'O efeito desta condição varia de acordo com o veneno. Pode ser perda de vida recorrente ou outra condição (como fraco ou enjoado). Perda de vida recorrente por venenos é cumulativa. Veneno.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _esmorecido = ConditionsBase(
    id: 17,
    name: 'Esmorecido',
    desc:
        'O personagem sofre –5 em testes de Inteligência, Sabedoria e Carisma e de perícias baseadas nesses atributos. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [Atribute.intelligence, Atribute.wisdom, Atribute.charisma],
    expertises: [],
  );

  final _exausto = ConditionsBase(
    id: 18,
    name: 'Exausto',
    desc:
        'O personagem fica debilitado, lento e vulnerável. Se ficar exausto novamente, em vez disso fica inconsciente. Cansaço.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _fascinado = ConditionsBase(
    id: 19,
    name: 'Fascinado',
    desc:
        'Com a atenção presa em alguma coisa. O personagem sofre –5 em Percepção e não pode fazer ações, exceto observar aquilo que o fascinou. Esta condição é anulada por ações hostis contra o personagem ou se o que o fascinou não estiver mais visível. Balançar uma criatura fascinada para tirá-la desse estado gasta uma ação padrão. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [ExpertisesBaseService().percepcao],
  );

  final _fatigado = ConditionsBase(
    id: 20,
    name: 'Fatigado',
    desc:
        'O personagem fica fraco e vulnerá-vel. Se ficar fatigado novamente, em vez disso fica exausto. Cansaço.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _fraco = ConditionsBase(
    id: 21,
    name: 'Fraco',
    desc:
        'O personagem sofre –2 em testes de Força, Destreza e Constituição e de perícias baseadas nesses atributos. Se ficar fraco novamente, em vez disso fica debilitado.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [Atribute.dexterity, Atribute.strength, Atribute.constitution],
    expertises: [],
  );

  final _frustrado = ConditionsBase(
    id: 22,
    name: 'Frustrado',
    desc:
        'O personagem sofre –2 em testes de Inteligência, Sabedoria e Carisma e de perícias baseadas nesses atributos. Se ficar frustrado novamente, em vez disso fica esmorecido. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [Atribute.intelligence, Atribute.wisdom, Atribute.charisma],
    expertises: [],
  );

  final _imovel = ConditionsBase(
    id: 23,
    name: 'Imóvel',
    desc:
        'Todas as formas de deslocamento do personagem são reduzidas a 0m. Movimento.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: true,
    atributes: [],
    expertises: [],
  );

  final _inconsciente = ConditionsBase(
    id: 24,
    name: 'Inconsciente',
    desc:
        'O personagem fica indefeso e não pode fazer ações, incluindo reações (mas ainda pode fazer testes que sejam naturalmente feitos quando se está inconsciente, como testes de Constituição para estabilizar sangramento). Balançar uma criatura para acordá-la gasta uma ação padrão.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _indefeso = ConditionsBase(
    id: 25,
    name: 'Indefeso',
    desc:
        'O personagem fica desprevenido, mas sofre –10 na Defesa, falha automaticamente em testes de Reflexos e pode sofrer golpes de misericórdia.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: true,
    inDisplacment: false,
    atributes: [],
    expertises: [ExpertisesBaseService().reflexos],
  );

  final _lento = ConditionsBase(
    id: 26,
    name: 'Lento',
    desc:
        'Todas as formas de deslocamento do personagem são reduzidas à metade (arredonde para baixo para o primeiro incremento de 1,5m) e ele não pode correr ou fazer investidas. Movimento.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: true,
    atributes: [],
    expertises: [],
  );

  final _ofuscado = ConditionsBase(
    id: 27,
    name: 'Ofuscado',
    desc: 'O personagem sofre –2 em testes de ataque e de Percepção. Sentidos.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: true,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [ExpertisesBaseService().percepcao],
  );

  final _paralisado = ConditionsBase(
    id: 28,
    name: 'Paralisado',
    desc:
        'Fica imóvel e indefeso e só pode realizar ações puramente mentais. Movimento',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: true,
    atributes: [],
    expertises: [],
  );

  final _pasmo = ConditionsBase(
    id: 29,
    name: 'Pasmo',
    desc: 'Não pode fazer ações. Mental.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _petrificado = ConditionsBase(
    id: 30,
    name: 'Petrificado',
    desc:
        'O personagem fica inconsciente e recebe redução de dano 8. Metamorfose',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _sangrando = ConditionsBase(
    id: 31,
    name: 'Sangrando',
    desc:
        'No início de seu turno, o personagem deve fazer um teste de Constituição (CD 15). Se falhar, perde 1d6 pontos de vida e continua sangrando. Se passar, remove essa condição. Metabolismo.',
    dice: Dice(uuid: '', quantity: 1, sides: 6),
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _surdo = ConditionsBase(
    id: 32,
    name: 'Surdo',
    desc:
        'O personagem não pode fazer testes de Percepção para ouvir e sofre –5 em testes de Iniciativa. Além disso, é considerado em condição ruim para lançar magias. Sentidos.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [
      ExpertisesBaseService().percepcao,
      ExpertisesBaseService().iniciativa
    ],
  );

  final _surpreendido = ConditionsBase(
    id: 33,
    name: 'Surpreendido',
    desc: 'O personagem fica desprevenido e não pode fazer ações.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  final _vulneravel = ConditionsBase(
    id: 34,
    name: 'Vulnerável',
    desc: 'O personagem sofre –2 na Defesa.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: true,
    inDisplacment: false,
    atributes: [],
    expertises: [],
  );

  List<ConditionsBase> get all => [
        _abalado,
        _agarrado,
        _alquebrado,
        _apavorado,
        _atordoado,
        _caido,
        _cego,
        _confuso,
        _debilitado,
        _desprevenido,
        _doente,
        _emChamas,
        _enfeiticado,
        _enjoado,
        _enredado,
        _envenenado,
        _esmorecido,
        _exausto,
        _fascinado,
        _fatigado,
        _fraco,
        _frustrado,
        _imovel,
        _inconsciente,
        _indefeso,
        _lento,
        _ofuscado,
        _paralisado,
        _pasmo,
        _petrificado,
        _sangrando,
        _surdo,
        _surpreendido,
        _vulneravel,
      ];
}
