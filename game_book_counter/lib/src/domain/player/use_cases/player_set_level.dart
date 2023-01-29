import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

class PlayerSetLevel {
  Future<PlayerCharacter> call(PlayerCharacter player, int level) async {
    player.level = level;
    return player;
  }
}