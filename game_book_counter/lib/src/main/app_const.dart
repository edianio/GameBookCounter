class ParamsConst {
  static const double defaultBorderRadius = 32;
}

class PageConst {
  static const root = '/';
  static const player = '/player';
  static const addPlayer = '/add_player';
  static const skills = '/skills';
  static const addSkill = '/add_skill';
  static const items = '/items';
  static const addItem = '/add_item';
  static const inventory = '/inventory';
}

class DbConst {
  static const hivePath = './';
  static const players = 'players';
  static const skills = 'skills';
  static const spells = 'spells';
  static const inventory = 'inventory';
  static const items = 'items';
  static const jobs = 'jobs';
  static const attributes = 'attributes';
  static const equipments = 'equipments';
  static const consumables = 'consumables';
  static const enemies = 'enemies';
}

class EntitiesConst {
  static const id = 'id';
  static const name = 'name';
  static const description = 'description';
  static const attributes = 'attributes';
  static const effect = 'effect';
  static const life = 'life';
  static const mana = 'mana';
  static const attack = 'attack';
  static const defense = 'defense';
  static const luck = 'luck';
  static const speed = 'speed';
  static const intelligence = 'intelligence';
  static const enabled = 'enabled';
  static const quantity = 'quantity';
  static const buyPrice = 'buyPrice';
  static const sellPrice = 'sellPrice';
  static const position = 'position';
  static const equipped = 'equipped';
  static const timeEffectInSeconds = 'timeEffectInSeconds';
  static const playerId = 'playerId';
  static const money = 'money';
  static const items = 'items';
  static const equipments = 'equipments';
  static const consumables = 'consumables';
  static const level = 'level';
  static const exp = 'exp';
  static const manaConsume = 'manaConsume';
  static const itemConsume = 'itemConsume';
  static const job = 'job';
  static const alias = 'alias';
  static const skills = 'skills';
  static const spells = 'spells';
  static const inventory = 'inventory';
}

class AppText {
  static const character = 'Personagem';
  static const attributes = 'Atributos';
  static const level = 'Nível';
  static const exp = 'Experiência';
  static const job = 'Classe';
  static const head = 'Cabeça';
  static const body = 'Peito';
  static const hands = 'Mãos';
  static const legs = 'Pernas';
  static const foots = 'Pés';
  static const accessory = 'Acessório';
  static const first = 'Primeiro';
  static const second = 'Segundo';
  static const use = 'Uso';
  static const quantity = 'Quantidade';
  static const sellPrice = 'Valor de venda';
  static const buyPrice = 'Valor de compra';
  static const skill = 'Habilidade';
  static const skills = 'Habilidades';
  static const createSkill = 'Criar Habilidade';
  static const addSkill = 'Adicionar habilidade';
  static const equipment = 'Equipamento';
  static const equipments = 'Equipamentos';
  static const addEquipment = 'Adicionar equipamentos';
  static const equipItem = 'Equipar item';
  static const life = 'Vida';
  static const mana = 'Mana';
  static const attack = 'Ataque';
  static const defense = 'Defesa';
  static const luck = 'Sorte';
  static const speed = 'Velocidade';
  static const intelligence = 'Inteligência';
  static const createSpell = 'Criar Feitiço';
  static const spell = 'Feitiço';
  static const spells = 'Feitiços';
  static const addSpell = 'Adicionar feitiço';
  static const manaConsume = 'Consumo de mana';
  static const itemConsume = 'Item necessário';
  static const inventory = 'Inventário';
  static const coins = 'Moedas';
  static const item = 'Item';
  static const items = 'Itens';
  static const addItem = 'Adicionar item';
  static const name = 'Nome';
  static const alias = 'Apelido';
  static const description = 'Descrição';
  static const add = 'Adicionar';
  static const create = 'Criar';
  static const save = 'Salvar';
  static const close = 'Fechar';
  static const addPlayer = 'Adicionar Personagem';

  static emptyListMessage(String text) => 'Você não possui nenhum $text!\nÉ necessário criar algum $text, antes de tentar adicionar.';
}
