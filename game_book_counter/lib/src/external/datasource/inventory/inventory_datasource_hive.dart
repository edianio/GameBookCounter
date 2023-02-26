import 'dart:convert';

import 'package:game_book_counter/src/infra/inventory/datasource/inventory_datasource.dart';
import 'package:game_book_counter/src/infra/inventory/model/inventory_dto.dart';
import 'package:game_book_counter/src/infra/player/model/player_character_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

class InventoryDatasourceHive implements InventoryDatasource {
  @override
  Future<InventoryDto> getInventory(String playerId) async {
    final box = await Hive.openBox(DbConst.players);
    final players = box.values.cast().map((e) => json.decode(json.encode(e)) as Map<String,dynamic>).toList();
    final list = List.from(players).map((e) => PlayerCharacterDto.fromMap(e as Map<String, dynamic>)).toList();
    final InventoryDto inventory = list.firstWhere((element) => element.id == playerId).inventory;
    return inventory;
  }
}