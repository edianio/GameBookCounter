import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

abstract class PlayerEvent {}

class PlayerSetLevelEvent extends PlayerEvent {
  final PlayerCharacter player;
  final int level;

  PlayerSetLevelEvent({required this.player, required this.level});
}

class PlayerSetExpEvent extends PlayerEvent {
  final PlayerCharacter player;
  final int exp;

  PlayerSetExpEvent({required this.player, required this.exp});
}