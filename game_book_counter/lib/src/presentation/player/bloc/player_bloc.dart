import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player_skill.dart';
import 'package:game_book_counter/src/domain/player/use_cases/get_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_exp.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_level.dart';
import 'package:game_book_counter/src/domain/player/use_cases/update_player.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerSetLevel setLevel;
  final PlayerSetExp setExp;
  final GetPlayer getPlayer;
  final AddPlayer addPlayer;
  final UpdatePlayer updatePlayer;
  final AddPlayerSkill addPlayerSkill;

  PlayerBloc({
    required this.getPlayer,
    required this.addPlayer,
    required this.updatePlayer,
    required this.setLevel,
    required this.setExp,
    required this.addPlayerSkill,
  }) : super(PlayerLoadingState()) {
    on<PlayerSetLevelEvent>(_setLevel);
    on<PlayerSetExpEvent>(_setExp);
    on<GetPlayerEvent>(_getPlayer, transformer: sequential());
    on<AddPlayerEvent>(_addPlayer, transformer: droppable());
    on<UpdatePlayerEvent>(_updatePlayer, transformer: sequential());
    on<AddPlayerSkillEvent>(_addSkill, transformer: sequential());
  }

  void init() async {
    add(GetPlayerEvent());
  }

  Future<void> _setLevel(PlayerSetLevelEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await setLevel(event.player, event.level);
    await setExp(event.player, 0);
    emit(PlayerLoadedState(player: player));
  }

  Future<void> _setExp(PlayerSetExpEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await setExp(event.player, event.exp);
    emit(PlayerLoadedState(player: player));
  }

  Future<void> _getPlayer(GetPlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    await emit.onEach(
      getPlayer.call(),
      onData: (data) {
        emit(PlayerLoadedState(player: data));
      },
      onError: (e,s) {
        emit(PlayerExceptionState(e.toString()));
      },
    );

  }

  Future<void> _addPlayer(AddPlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    try {
      await addPlayer(event.player);
      emit(PlayerLoadedState(player: event.player));
    } catch(e) {
      emit(PlayerExceptionState(e.toString()));
    }
  }

  Future<void> _updatePlayer(UpdatePlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    try {
      await updatePlayer(event.player);
      emit(PlayerLoadedState(player: event.player));
    } catch(e) {
      emit(PlayerExceptionState(e.toString()));
    }
  }

  Future<void> _addSkill(AddPlayerSkillEvent event, Emitter emit) async {
    final state = this.state;
    if (state is PlayerLoadedState) {
      final player = addPlayerSkill(event.skill, state.player!);
      add(UpdatePlayerEvent(player));
    }
  }
}