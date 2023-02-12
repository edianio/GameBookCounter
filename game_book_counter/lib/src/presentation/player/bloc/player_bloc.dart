import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player_skill.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player_spell.dart';
import 'package:game_book_counter/src/domain/player/use_cases/get_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_exp.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_level.dart';
import 'package:game_book_counter/src/domain/player/use_cases/remove_player_skill.dart';
import 'package:game_book_counter/src/domain/player/use_cases/remove_player_spell.dart';
import 'package:game_book_counter/src/domain/player/use_cases/update_player.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final GetPlayer _getPlayer;
  final AddPlayer _addPlayer;
  final PlayerSetLevel _playerSetLevel;
  final PlayerSetExp _playerSetExp;
  final UpdatePlayer _updatePlayer;
  final AddPlayerSkill _addPlayerSkill;
  final RemovePlayerSkill _removePlayerSkill;
  final AddPlayerSpell _addPlayerSpell;
  final RemovePlayerSpell _removePlayerSpell;

  PlayerBloc({
    required GetPlayer getPlayer,
    required AddPlayer addPlayer,
    required UpdatePlayer updatePlayer,
    required PlayerSetLevel playerSetLevel,
    required PlayerSetExp playerSetExp,
    required AddPlayerSkill addPlayerSkill,
    required RemovePlayerSkill removePlayerSkill,
    required AddPlayerSpell addPlayerSpell,
    required RemovePlayerSpell removePlayerSpell,
  })  : _getPlayer = getPlayer,
        _addPlayer = addPlayer,
        _updatePlayer = updatePlayer,
        _playerSetLevel = playerSetLevel,
        _playerSetExp = playerSetExp,
        _addPlayerSkill = addPlayerSkill,
        _removePlayerSkill = removePlayerSkill,
        _addPlayerSpell = addPlayerSpell,
        _removePlayerSpell = removePlayerSpell,
        super(PlayerLoadingState()) {
    on<PlayerSetLevelEvent>(_setLevel);
    on<PlayerSetExpEvent>(_setExp);
    on<GetPlayerEvent>(_loadPlayer, transformer: sequential());
    on<AddPlayerEvent>(_insertPlayer, transformer: droppable());
    on<UpdatePlayerEvent>(_editPlayer, transformer: sequential());
    on<AddPlayerSkillEvent>(_addSkill, transformer: sequential());
    on<RemovePlayerSkillEvent>(_removeSkill, transformer: sequential());
    on<AddPlayerSpellEvent>(_addSpell, transformer: sequential());
    on<RemovePlayerSpellEvent>(_removeSpell, transformer: sequential());
  }

  void init() async {
    add(GetPlayerEvent());
  }

  Future<void> _setLevel(PlayerSetLevelEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await _playerSetLevel(event.player, event.level);
    await _playerSetExp(event.player, 0);
    emit(PlayerLoadedState(player: player));
  }

  Future<void> _setExp(PlayerSetExpEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    final player = await _playerSetExp(event.player, event.exp);
    emit(PlayerLoadedState(player: player));
  }

  Future<void> _loadPlayer(GetPlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    await emit.onEach(
      _getPlayer.call(),
      onData: (data) {
        emit(PlayerLoadedState(player: data));
      },
      onError: (e,s) {
        emit(PlayerExceptionState(e.toString()));
      },
    );

  }

  Future<void> _insertPlayer(AddPlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    try {
      await _addPlayer(event.player);
      emit(PlayerLoadedState(player: event.player));
    } catch(e) {
      emit(PlayerExceptionState(e.toString()));
    }
  }

  Future<void> _editPlayer(UpdatePlayerEvent event, Emitter emit) async {
    emit(PlayerLoadingState());
    try {
      await _updatePlayer(event.player);
      emit(PlayerLoadedState(player: event.player));
    } catch(e) {
      emit(PlayerExceptionState(e.toString()));
    }
  }

  Future<void> _addSkill(AddPlayerSkillEvent event, Emitter emit) async {
    final state = this.state;
    if (state is PlayerLoadedState) {
      final player = _addPlayerSkill(event.skill, state.player!);
      add(UpdatePlayerEvent(player));
    }
  }

  Future<void> _removeSkill(RemovePlayerSkillEvent event, Emitter emit) async {
    final state = this.state;
    if (state is PlayerLoadedState) {
      final player = _removePlayerSkill(event.skill, state.player!);
      add(UpdatePlayerEvent(player));
    }
  }

  Future<void> _addSpell(AddPlayerSpellEvent event, Emitter emit) async {
    final state = this.state;
    if (state is PlayerLoadedState) {
      final player = _addPlayerSpell(event.spell, state.player!);
      add(UpdatePlayerEvent(player));
    }
  }

  Future<void> _removeSpell(RemovePlayerSpellEvent event, Emitter emit) async {
    final state = this.state;
    if (state is PlayerLoadedState) {
      final player = _removePlayerSpell(event.spell, state.player!);
      add(UpdatePlayerEvent(player));
    }
  }
}