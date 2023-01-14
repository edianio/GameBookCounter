import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';

class Inventory {
  int money;
  final List<Item> items;
  final List<Equipment> equipments;
  final List<String> consumables;

  Inventory({
    this.money = 0,
    required this.items,
    required this.equipments,
    required this.consumables,
  });
}