import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

class RemovePlayerSpell {
  PlayerCharacter call(Spell spell, PlayerCharacter player) {
    player.spells.remove(spell);
    return player;
  }
}