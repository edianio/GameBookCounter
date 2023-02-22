import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/consumable/entity/consumable.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list_item.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_items_list_item.dart';

class HomeCardInventorySection extends StatelessWidget {
  final List<Item> items;

  const HomeCardInventorySection({required this.items, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (_, index) {
        if (items[index] is Equipment) {
          return HomeCardEquipmentsListItem(
            equipment: items[index] as Equipment,
            onRemoveItem: () {},
          );
        }
        return HomeCardItemsListItem(item: items[index],);
      },
    );
  }
}
