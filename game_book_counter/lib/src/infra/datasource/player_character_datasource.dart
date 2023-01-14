import 'package:game_book_counter/src/domain/player/entity/player_character.dart';

abstract class PlayerCharacterDatasource {
  Future<void> addPlayerCharacter(PlayerCharacter player);
}