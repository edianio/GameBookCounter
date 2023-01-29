import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

abstract class PlayerCharacterRepository {
  Stream<PlayerCharacter?> getPlayer();
  Future<void> addPlayer(PlayerCharacter player);
  Future<void> updatePlayer(PlayerCharacter player);
}