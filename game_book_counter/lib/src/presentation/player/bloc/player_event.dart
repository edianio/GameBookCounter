import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

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

class GetPlayerEvent extends PlayerEvent {}

class AddPlayerEvent extends PlayerEvent {
  final PlayerCharacter player;

  AddPlayerEvent(this.player);
}

class UpdatePlayerEvent extends PlayerEvent {
  final PlayerCharacter player;

  UpdatePlayerEvent(this.player);
}

class AddPlayerSkillEvent extends PlayerEvent {
  final Skill skill;

  AddPlayerSkillEvent(this.skill);
}

class RemovePlayerSkillEvent extends PlayerEvent {
  final Skill skill;

  RemovePlayerSkillEvent(this.skill);
}

class AddPlayerSpellEvent extends PlayerEvent {
  final Spell spell;

  AddPlayerSpellEvent(this.spell);
}

class RemovePlayerSpellEvent extends PlayerEvent {
  final Spell spell;

  RemovePlayerSpellEvent(this.spell);
}