import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/inventory/repository/inventory_repository.dart';
import 'package:game_book_counter/src/infra/inventory/datasource/inventory_datasource.dart';

class InventoryRepositoryImpl extends InventoryRepository {
  final InventoryDatasource datasource;

  InventoryRepositoryImpl(this.datasource);

  @override
  Future<Inventory> getInventory(String playerId) async {
    final result = await datasource.getInventory(playerId);
    return result.toEntity();
  }
}