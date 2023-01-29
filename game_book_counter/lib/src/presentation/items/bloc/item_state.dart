import 'package:game_book_counter/src/domain/item/entity/item.dart';

abstract class ItemState {}

class ItemsLoadingState extends ItemState {}

class ItemsLoadedState extends ItemState {
  final List<Item> items;

  ItemsLoadedState(this.items);
}

class ItemsExceptionState extends ItemState {
  final String error;

  ItemsExceptionState(this.error);
}