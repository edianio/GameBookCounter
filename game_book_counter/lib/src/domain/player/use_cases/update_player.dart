import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';

class UpdatePlayer {
  final PlayerCharacterRepository repository;

  UpdatePlayer(this.repository);

  Future<void> call(PlayerCharacter player) => repository.updatePlayer(player);
}