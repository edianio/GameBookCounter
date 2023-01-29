import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';

class AddPlayer {
  final PlayerCharacterRepository repository;

  AddPlayer(this.repository);

  Future<void> call(PlayerCharacter player) => repository.addPlayer(player);
}