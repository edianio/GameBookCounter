import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/inventory/repository/inventory_repository.dart';

class GetInventory {
  final InventoryRepository repository;

  GetInventory(this.repository);

  Stream<Inventory> call(String playerId) => repository.getInventory(playerId);
}