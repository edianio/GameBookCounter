import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/item/repository/item_repository.dart';

class SetEnabledItem {
  final ItemRepository repository;

  SetEnabledItem(this.repository);

  Future<void> call(Item item) async {
    await repository.setEnabledItem(item);
  }
}