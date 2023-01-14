import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';
import 'package:game_book_counter/src/infra/datasource/player_character_datasource.dart';

class PlayerCharacterRepositoryImpl implements PlayerCharacterRepository {
  final PlayerCharacterDatasource datasource;

  PlayerCharacterRepositoryImpl(this.datasource);

  @override
  Future<void> addPlayerCharacter(PlayerCharacter player) {
    //TODO TRATAR CORRETAMENTE O RESULTADO DO DATASOURCE
    return datasource.addPlayerCharacter(player);
  }
}