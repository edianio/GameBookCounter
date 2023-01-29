import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';
import 'package:game_book_counter/src/infra/player/datasource/player_character_datasource.dart';
import 'package:game_book_counter/src/infra/player/model/player_character_dto.dart';

class PlayerCharacterRepositoryImpl implements PlayerCharacterRepository {
  final PlayerCharacterDatasource datasource;

  PlayerCharacterRepositoryImpl(this.datasource);

  @override
  Future<void> addPlayer(PlayerCharacter player) async {
    await datasource.addPlayer(PlayerCharacterDto.fromEntity(player));
  }

  @override
  Stream<PlayerCharacter?> getPlayer() async* {
    final response = await datasource.getPlayers();
    final list = List.from(response).map((e) => PlayerCharacterDto.fromMap(e as Map<String, dynamic>).toEntity()).toList();
    if (list.isEmpty) {
      yield null;
    } else {
      yield list.first;
    }
  }

  @override
  Future<void> updatePlayer(PlayerCharacter player) async {
    await datasource.updatePlayer(PlayerCharacterDto.fromEntity(player));
  }
}