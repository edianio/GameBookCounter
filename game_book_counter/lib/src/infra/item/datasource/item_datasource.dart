import 'package:game_book_counter/src/infra/item/model/item_dto.dart';

abstract class ItemDatasource {
  Future<void> addItem(ItemDto item);
  Future<List> getAllItems();
  Future<void> setEnabledItem(ItemDto item);
}