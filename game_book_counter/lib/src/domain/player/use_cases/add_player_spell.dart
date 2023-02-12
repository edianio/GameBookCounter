import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

class AddPlayerSpell {
  PlayerCharacter call(Spell spell, PlayerCharacter player) {
    player.spells.add(spell);
    if (player.spells.length > 1) {
      player.spells.sort((a,b) => a.name.toUpperCase().trim().compareTo(b.name.toUpperCase().trim()));
    }
    return player;
  }
}