import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';

class ExpertisesBaseService {
  static const _acrobacia = ExpertiseBase(
    id: 1,
    name: 'acrobacia',
    atribute: Atribute.dexterity,
  );

  static const _adestramento = ExpertiseBase(
    id: 2,
    name: 'adestramento',
    atribute: Atribute.charisma,
  );

  static const _atletismo = ExpertiseBase(
    id: 3,
    name: 'atletismo',
    atribute: Atribute.strength,
  );

  static const _atuacao = ExpertiseBase(
    id: 4,
    name: 'atuação',
    atribute: Atribute.charisma,
  );

  static const _cavalgar = ExpertiseBase(
    id: 5,
    name: 'cavalgar',
    atribute: Atribute.dexterity,
  );

  static const _conhecimento = ExpertiseBase(
    id: 6,
    name: 'conhecimento',
    atribute: Atribute.intelligence,
  );

  static const _cura = ExpertiseBase(
    id: 7,
    name: 'cura',
    atribute: Atribute.wisdom,
  );

  static const _diplomacia = ExpertiseBase(
    id: 8,
    name: 'diplomacia',
    atribute: Atribute.charisma,
  );

  static const _enganacao = ExpertiseBase(
    id: 9,
    name: 'enaganação',
    atribute: Atribute.charisma,
  );

  static const _fortitude = ExpertiseBase(
    id: 10,
    name: 'fortitude',
    atribute: Atribute.constitution,
  );

  static const _guerra = ExpertiseBase(
    id: 11,
    name: 'guerra',
    atribute: Atribute.intelligence,
  );

  static const _iniciativa = ExpertiseBase(
    id: 12,
    name: 'iniciativa',
    atribute: Atribute.dexterity,
  );

  ExpertiseBase get iniciativa => _iniciativa;

  static const _intimidacao = ExpertiseBase(
    id: 13,
    name: 'intimidação',
    atribute: Atribute.charisma,
  );

  static const _intuicao = ExpertiseBase(
    id: 14,
    name: 'intuição',
    atribute: Atribute.wisdom,
  );

  static const _investigacao = ExpertiseBase(
    id: 15,
    name: 'investigação',
    atribute: Atribute.intelligence,
  );

  static const _jogatina = ExpertiseBase(
    id: 16,
    name: 'jogatina',
    atribute: Atribute.charisma,
  );

  static const _ladinagem = ExpertiseBase(
    id: 17,
    name: 'ladinagem',
    atribute: Atribute.dexterity,
  );

  static const _luta = ExpertiseBase(
    id: 18,
    name: 'luta',
    atribute: Atribute.strength,
  );

  static const _misticismo = ExpertiseBase(
    id: 19,
    name: 'misticismo',
    atribute: Atribute.intelligence,
  );

  static const _nobreza = ExpertiseBase(
    id: 20,
    name: 'nobreza',
    atribute: Atribute.intelligence,
  );

  static const _percepcao = ExpertiseBase(
    id: 21,
    name: 'percepção',
    atribute: Atribute.wisdom,
  );

  ExpertiseBase get percepcao => _percepcao;

  static const _pilotagem = ExpertiseBase(
    id: 22,
    name: 'pilotagem',
    atribute: Atribute.dexterity,
  );

  static const _pontaria = ExpertiseBase(
    id: 23,
    name: 'pontaria',
    atribute: Atribute.dexterity,
  );

  static const _reflexos = ExpertiseBase(
    id: 24,
    name: 'reflexos',
    atribute: Atribute.dexterity,
  );

  ExpertiseBase get reflexos => _reflexos;

  static const _religiao = ExpertiseBase(
    id: 25,
    name: 'religião',
    atribute: Atribute.wisdom,
  );

  static const _sobrevivencia = ExpertiseBase(
    id: 26,
    name: 'sobrevivencia',
    atribute: Atribute.wisdom,
  );

  static const _vontade = ExpertiseBase(
    id: 27,
    name: 'vontade',
    atribute: Atribute.wisdom,
  );

  List<ExpertiseBase> getExpertises() => [
    _acrobacia,
    _adestramento,
    _atletismo,
    _atuacao,
    _cavalgar,
    _conhecimento,
    _cura,
    _diplomacia,
    _enganacao,
    _fortitude,
    _guerra,
    _iniciativa,
    _intimidacao,
    _intuicao,
    _investigacao,
    _jogatina,
    _ladinagem,
    _luta,
    _misticismo,
    _nobreza,
    percepcao,
    _pilotagem,
    _pontaria,
    _reflexos,
    _religiao,
    _sobrevivencia,
    _vontade,
  ];
}
