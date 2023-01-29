import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/item/repository/item_repository.dart';
import 'package:game_book_counter/src/infra/item/datasource/item_datasource.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemDatasource datasource;

  ItemRepositoryImpl(this.datasource);

  @override
  Future<void> addItem(Item item) async {
    ItemDto dto = ItemDto.fromEntity(item);
    if(dto.id.isEmpty) {
      dto.id = idGenerator();
    }
    await datasource.addItem(dto);
  }

  @override
  Future<List<Item>> getAllItems() async {
    final response = await datasource.getAllItems();
    return response.map((e) => ItemDto.fromMap(e as Map<String, dynamic>).toEntity()).toList();
  }

  @override
  Future<void> setEnabledItem(Item item) async {
    await datasource.setEnabledItem(ItemDto.fromEntity(item));
  }
}