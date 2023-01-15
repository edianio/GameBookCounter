import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardItemsListItem extends StatelessWidget {
  final Item item;
  const HomeCardItemsListItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
          child: Text(
            item.name,
            style: fontStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
          child: Text(
            '${AppText.quantity}: ${item.quantity}',
            style: fontStyle,
          ),
        ),
        if(item.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
            child: Text(
              item.description!,
              style: fontStyle,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
          child: Row(
            children: <Widget>[
              Text(
                '${AppText.sellPrice}: \$${item.sellPrice}',
                style: fontStyle,
              ),
              const SizedBox(width: 16,),
              Text(
                '${AppText.buyPrice}: \$${item.buyPrice}',
                style: fontStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
