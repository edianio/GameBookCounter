import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';

abstract class InventoryRepository {
  Stream<Inventory> getInventory(String playerId);
}