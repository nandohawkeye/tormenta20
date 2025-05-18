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
    atributes: [Atribute.strength, Atribute.dexterity],
    expertises: [ExpertisesBaseService().percepcao],
  );

  final _confuso = ConditionsBase(
    id: 8,
    name: 'Confuso',
    desc:
        'O personagem comporta-se de modo aleatório. Role 1d6 no início de seus turnos: 1) Movimenta-se em uma direção escolhida por uma rolagem de 1d8; 2-3) Não pode fazer ações, e fica balbuciando incoerentemente; 4-5) Usa a arma que estiver empunhando para atacar a criatura mais próxima, ou a si mesmo se estiver sozinho (nesse caso, apenas role o dano); 6) A condição termina e pode agir normalmente. Mental.',
    dice: Dice(uuid: '', quantity: 1, dice: 6),
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    atributes: [],
    expertises: [],
  );

  final _debilitado = ConditionsBase(
    id: 9,
    name: 'Debilitado',
    desc:
        'O personagem sofre –5 em testes de Força, Destreza e Constituição e de perícias baseadas nesses atributos. Se o personagem ficar debilitado novamente, em vez disso fica inconsciente.',
    dice: null,
    inAllExpertises: false,
    inMana: false,
    inAttack: false,
    inDefense: false,
    atributes: [Atribute.strength, Atribute.dexterity, Atribute.constitution],
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
      ];
}
