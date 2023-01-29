import 'package:game_book_counter/src/infra/player/model/player_character_dto.dart';

abstract class PlayerCharacterDatasource {
  Future<void> addPlayer(PlayerCharacterDto player);
  Future<void> updatePlayer(PlayerCharacterDto player);
  Future<List> getPlayers();
}