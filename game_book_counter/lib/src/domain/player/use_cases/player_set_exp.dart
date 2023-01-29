import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

class PlayerSetExp {
  Future<PlayerCharacter> call(PlayerCharacter player, int exp) async {
    player.exp = exp;
    return player;
  }
}