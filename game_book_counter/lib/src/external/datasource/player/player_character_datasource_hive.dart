import 'dart:convert';

import 'package:game_book_counter/src/infra/player/datasource/player_character_datasource.dart';
import 'package:game_book_counter/src/infra/player/model/player_character_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

class PlayerCharacterDatasourceHive implements PlayerCharacterDatasource {
  @override
  Future<void> addPlayer(PlayerCharacterDto player) async {
    final box = await Hive.openBox(DbConst.players);
    await box.put(player.id, player.toMap());
  }

  @override
  Future<List> getPlayers() async {
    final box = await Hive.openBox(DbConst.players);
    return box.values.cast().map((e) => json.decode(json.encode(e)) as Map<String,dynamic>).toList();
  }

  @override
  Future<void> updatePlayer(PlayerCharacterDto player) async {
    final box = await Hive.openBox(DbConst.players);
    await box.put(player.id, player.toMap());
  }
}