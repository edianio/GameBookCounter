import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

abstract class PlayerState {}

class PlayerLoadingState implements PlayerState {}

class PlayerLoadedState implements PlayerState {
  final PlayerCharacter? player;

  PlayerLoadedState({required this.player});
}

class PlayerExceptionState implements PlayerState {
  final String error;

  PlayerExceptionState(this.error);
}