import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';

class InventorySectionItem extends StatelessWidget {
  final Item item;

  const InventorySectionItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item.description ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
