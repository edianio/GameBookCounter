import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';

abstract class InventoryRepository {
  Future<Inventory> getInventory(String playerId);
}