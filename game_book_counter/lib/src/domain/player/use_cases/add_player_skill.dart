import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

class AddPlayerSkill {
  PlayerCharacter call(Skill skill, PlayerCharacter player) {
    player.skills.add(skill);
    if (player.skills.length > 1) {
      player.skills.sort((a,b) => a.name.toUpperCase().trim().compareTo(b.name.toUpperCase().trim()));
    }
    return player;
  }
}