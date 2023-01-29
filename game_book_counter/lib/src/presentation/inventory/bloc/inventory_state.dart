import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';

abstract class InventoryState {}

class InventoryLoadingState extends InventoryState {}

class InventoryLoadedState extends InventoryState {
  final Inventory inventory;

  InventoryLoadedState(this.inventory);
}

class InventoryExceptionState extends InventoryState {
  final String error;

  InventoryExceptionState(this.error);
}