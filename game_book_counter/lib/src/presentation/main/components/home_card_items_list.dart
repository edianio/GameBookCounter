import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list_item.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_items_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardItemsList extends StatelessWidget {
  final Inventory inventory;
  final VoidCallback onTapItem;
  final VoidCallback onTapAddItem;
  final VoidCallback onTapRemoveItem;

  const HomeCardItemsList({
    required this.inventory,
    required this.onTapItem,
    required this.onTapAddItem,
    required this.onTapRemoveItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDefault(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
              child: Text(
                AppText.inventory,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${AppText.coins}: ${inventory.money}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: inventory.consumables.length,
            itemBuilder: (context, index){
              if (inventory.consumables.isEmpty) {
                return Container();
              }
              return HomeCardItemsListItem(item: inventory.consumables[index],);
            },
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: inventory.items.length,
            itemBuilder: (context, index){
              if (inventory.items.isEmpty) {
                return Container();
              }
              return HomeCardItemsListItem(item: inventory.items[index],);
            },
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: inventory.equipments.length,
            itemBuilder: (context, index){
              if (inventory.equipments.isEmpty) {
                return Container();
              }
              if (inventory.equipments[index].equipped) {
                return Container();
              }
              return HomeCardEquipmentsListItem(equipment: inventory.equipments[index],);
            },
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => onTapAddItem(),
                child: const Text(AppText.addItem),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
