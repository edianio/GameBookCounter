import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/consumable/entity/consumable.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/job/entity/job.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/usecases/player_set_exp.dart';
import 'package:game_book_counter/src/domain/player/usecases/player_set_level.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerSetLevel setLevel;
  final PlayerSetExp setExp;

  PlayerBloc({required this.setLevel, required this.setExp}) : super(PlayerLoadingState()) {
    on<PlayerSetLevelEvent>(_setLevel);
    on<PlayerSetExpEvent>(_setExp);
  }

  void init() async {
    _getFakes();
  }

  Future<void> _setLevel(PlayerSetLevelEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await setLevel(event.player, event.level);
    emit(PlayerLoadedState(player: player));
  }

  Future<void> _setExp(PlayerSetExpEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await setExp(event.player, event.exp);
    emit(PlayerLoadedState(player: player));
  }

  void _getFakes() {
    final List<Skill> skills = [
      Skill(id: 'abcDEF', name: 'habilidade 1', description: 'Descricao da habilidade', effect: (){}),
    ];

    final List<Equipment> equipments = [
      Equipment(id: 'abcDEF1', name: 'Capacete', description: 'Protege a cabeça.', attributes: Attributes(defense: 2), buyPrice: 7, sellPrice: 3, position: EquipmentPosition.head, equipped: true),
      Equipment(id: 'abcDEF2', name: 'Botas', description: 'Agora você não vai mais andar descalço.', attributes: Attributes(defense: 2), buyPrice: 6, sellPrice: 3, position: EquipmentPosition.foots, equipped: true),
    ];

    final List<Spell> spells = [
      Spell(id: 'abcDEF1', name: 'Fogo', description: 'Cria fogo para luminar ou atacar.', manaConsume: 2, effect: (){},),
      Spell(id: 'abcDEF2', name: 'Símbolos', description: 'Permite traduzir linguagens desconhecidas.', manaConsume: 1, effect: (){},),
    ];

    final List<Consumable> consumables = [
      Consumable(id: 'vcaosdyvb', name: 'Maçã', description: 'Uma saborosa fruta que recupera 2 pontos de vida.', quantity: 3, effect: (){}, buyPrice: 5, sellPrice: 1,),
    ];

    final Inventory inventory = Inventory(
      items: [Item(id: 'lvsdfbn', name: 'Tocha', description: 'Uma simples tocha que só serve para iluminar.')],
      equipments: [Equipment(id: 'abcDEF2', name: 'Armadura de madeira', description: 'Armadura simples feita de madeira.', attributes: Attributes(defense: 3), buyPrice: 10, sellPrice: 5, position: EquipmentPosition.body, equipped: false), ... equipments],
      consumables: consumables,
    );

    final PlayerCharacter player = PlayerCharacter(
      id: 'hdcblas',
      name: 'Yusuki',
      description: 'Um jogador',
      attributes: Attributes(
        life: 20,
        attack: 12,
        defense: 5,
      ),
      skills: skills,
      spells: spells,
      equipments: equipments,
      inventory: inventory,
      job: Job(
        id: 'sdobf',
        name: 'Samurai',
        description: 'Guerreiro antigo que luta com duas espadas',
      ),
    );
    emit(PlayerLoadedState(player: player));
  }
}