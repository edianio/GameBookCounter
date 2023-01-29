import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/item/repository/item_repository.dart';

class AddItem {
  final ItemRepository repository;

  AddItem(this.repository);

  Future<void> call(Item item) async {
    repository.addItem(item);
  }
}