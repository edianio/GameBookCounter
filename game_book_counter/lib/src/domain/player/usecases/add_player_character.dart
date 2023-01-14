import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';

class AddPlayerCharacter {
  final PlayerCharacterRepository repository;

  AddPlayerCharacter(this.repository);

  Future<void> call(PlayerCharacter player) async => repository.addPlayerCharacter(player);
}