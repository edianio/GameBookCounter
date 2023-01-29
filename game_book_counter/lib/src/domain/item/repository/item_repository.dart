import 'package:game_book_counter/src/domain/item/entity/item.dart';

abstract class ItemRepository {
  Future<void> addItem(Item item);
  Future<List<Item>> getAllItems();
  Future<void> setEnabledItem(Item item);
}