import 'package:game_book_counter/src/domain/item/entity/item.dart';

abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final Item item;

  AddItemEvent(this.item);
}

class GetAllItemsEvent extends ItemEvent {}

class SetEnabledItemEvent extends ItemEvent {
  final Item item;
  final bool enabled;

  SetEnabledItemEvent({required this.item, required this.enabled});
}