import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/item/repository/item_repository.dart';

class GetAllItems {
  final ItemRepository repository;

  GetAllItems(this.repository);

  Future<List<Item>> call() async => repository.getAllItems();
}