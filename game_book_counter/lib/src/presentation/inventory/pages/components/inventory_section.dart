import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/inventory/pages/components/inventory_section_item.dart';

class InventorySection extends StatelessWidget {
  final String title;
  final List<Item> items;
  final VoidCallback onTap;
  const InventorySection({required this.title, required this.items, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CardDefault(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            if (items.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: items.length,
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      child: InventorySectionItem(item: items[index]),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
