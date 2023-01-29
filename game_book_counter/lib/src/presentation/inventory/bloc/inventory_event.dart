abstract class InventoryEvent {}

class GetInventoryEvent extends InventoryEvent {
  final String playerId;

  GetInventoryEvent(this.playerId);
}

class GetInventoryItemsEvent extends InventoryEvent {
  final String playerId;

  GetInventoryItemsEvent(this.playerId);
}