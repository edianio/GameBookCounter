import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';

class GetPlayer {
  final PlayerCharacterRepository repository;

  GetPlayer(this.repository);

  Stream<PlayerCharacter?> call() => repository.getPlayer();
}