import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';

class ExpertisesBaseService {
  static const _acrobacia = ExpertiseBase(
    id: 1,
    name: 'acrobacia',
    atribute: Atribute.dexterity,
    onlyTrained: false,
    armorPenalty: true,
  );

  static const _adestramento = ExpertiseBase(
    id: 2,
    name: 'adestramento',
    atribute: Atribute.charisma,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _atletismo = ExpertiseBase(
    id: 3,
    name: 'atletismo',
    atribute: Atribute.strength,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _atuacao = ExpertiseBase(
    id: 4,
    name: 'atuação',
    atribute: Atribute.charisma,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _cavalgar = ExpertiseBase(
    id: 5,
    name: 'cavalgar',
    atribute: Atribute.dexterity,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _conhecimento = ExpertiseBase(
    id: 6,
    name: 'conhecimento',
    atribute: Atribute.intelligence,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _cura = ExpertiseBase(
    id: 7,
    name: 'cura',
    atribute: Atribute.wisdom,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _diplomacia = ExpertiseBase(
    id: 8,
    name: 'diplomacia',
    atribute: Atribute.charisma,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _enganacao = ExpertiseBase(
    id: 9,
    name: 'enaganação',
    atribute: Atribute.charisma,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _fortitude = ExpertiseBase(
    id: 10,
    name: 'fortitude',
    atribute: Atribute.constitution,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _guerra = ExpertiseBase(
    id: 11,
    name: 'guerra',
    atribute: Atribute.intelligence,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _iniciativa = ExpertiseBase(
    id: 12,
    name: 'iniciativa',
    atribute: Atribute.dexterity,
    onlyTrained: false,
    armorPenalty: false,
  );

  ExpertiseBase get iniciativa => _iniciativa;

  static const _intimidacao = ExpertiseBase(
    id: 13,
    name: 'intimidação',
    atribute: Atribute.charisma,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _intuicao = ExpertiseBase(
    id: 14,
    name: 'intuição',
    atribute: Atribute.wisdom,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _investigacao = ExpertiseBase(
    id: 15,
    name: 'investigação',
    atribute: Atribute.intelligence,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _jogatina = ExpertiseBase(
    id: 16,
    name: 'jogatina',
    atribute: Atribute.charisma,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _ladinagem = ExpertiseBase(
    id: 17,
    name: 'ladinagem',
    atribute: Atribute.dexterity,
    onlyTrained: true,
    armorPenalty: true,
  );

  static const _luta = ExpertiseBase(
    id: 18,
    name: 'luta',
    atribute: Atribute.strength,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _misticismo = ExpertiseBase(
    id: 19,
    name: 'misticismo',
    atribute: Atribute.intelligence,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _nobreza = ExpertiseBase(
    id: 20,
    name: 'nobreza',
    atribute: Atribute.intelligence,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _percepcao = ExpertiseBase(
    id: 21,
    name: 'percepção',
    atribute: Atribute.wisdom,
    onlyTrained: false,
    armorPenalty: false,
  );

  ExpertiseBase get percepcao => _percepcao;

  static const _pilotagem = ExpertiseBase(
    id: 22,
    name: 'pilotagem',
    atribute: Atribute.dexterity,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _pontaria = ExpertiseBase(
    id: 23,
    name: 'pontaria',
    atribute: Atribute.dexterity,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _reflexos = ExpertiseBase(
    id: 24,
    name: 'reflexos',
    atribute: Atribute.dexterity,
    onlyTrained: false,
    armorPenalty: false,
  );

  ExpertiseBase get reflexos => _reflexos;

  static const _religiao = ExpertiseBase(
    id: 25,
    name: 'religião',
    atribute: Atribute.wisdom,
    onlyTrained: true,
    armorPenalty: false,
  );

  static const _sobrevivencia = ExpertiseBase(
    id: 26,
    name: 'sobrevivencia',
    atribute: Atribute.wisdom,
    onlyTrained: false,
    armorPenalty: false,
  );

  static const _vontade = ExpertiseBase(
    id: 27,
    name: 'vontade',
    atribute: Atribute.wisdom,
    onlyTrained: false,
    armorPenalty: false,
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
