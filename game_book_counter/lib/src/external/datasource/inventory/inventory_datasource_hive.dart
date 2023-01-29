import 'package:game_book_counter/src/infra/inventory/datasource/inventory_datasource.dart';
import 'package:game_book_counter/src/infra/inventory/model/inventory_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

class InventoryDatasourceHive implements InventoryDatasource {
  @override
  Future<InventoryDto> getInventory(String playerId) async {
    final box = await Hive.openBox(DbConst.inventory);
    return box.get(playerId);
  }
}