import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

class RemovePlayerSkill {
  PlayerCharacter call(Skill skill, PlayerCharacter player) {
    player.skills.remove(skill);
    return player;
  }
}