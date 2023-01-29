import 'package:game_book_counter/src/infra/inventory/model/inventory_dto.dart';

abstract class InventoryDatasource {
  Future<InventoryDto> getInventory(String playerId);
}