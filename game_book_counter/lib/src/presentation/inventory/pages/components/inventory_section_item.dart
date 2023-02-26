import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/simple_capsule_information.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class InventorySectionItem extends StatefulWidget {
  final Item item;

  const InventorySectionItem({required this.item, Key? key}) : super(key: key);

  @override
  State<InventorySectionItem> createState() => _InventorySectionItemState();
}

class _InventorySectionItemState extends State<InventorySectionItem> {
  Equipment? equipment;

  @override
  void initState() {
    super.initState();
    if (widget.item is Equipment) {
      equipment = widget.item as Equipment;
    }
  }

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
            widget.item.name,
            style: fontStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
          child: Text(
            '${AppText.quantity}: ${widget.item.quantity}',
            style: fontStyle,
          ),
        ),
        if(widget.item.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
            child: Text(
              widget.item.description!,
              style: fontStyle,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
          child: Row(
            children: <Widget>[
              Text(
                '${AppText.sellPrice}: \$${widget.item.sellPrice}',
                style: fontStyle,
              ),
              const SizedBox(width: 16,),
              Text(
                '${AppText.buyPrice}: \$${widget.item.buyPrice}',
                style: fontStyle,
              ),
            ],
          ),
        ),
        if(equipment != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: <Widget>[
                SimpleCapsuleInformation('${AppText.life}: ${equipment?.attributes.life}',),
                SimpleCapsuleInformation('${AppText.mana}: ${equipment?.attributes.mana}',),
                SimpleCapsuleInformation('${AppText.attack}: ${equipment?.attributes.attack}',),
                SimpleCapsuleInformation('${AppText.defense}: ${equipment?.attributes.defense}',),
                SimpleCapsuleInformation('${AppText.luck}: ${equipment?.attributes.luck}',),
                SimpleCapsuleInformation('${AppText.speed}: ${equipment?.attributes.speed}',),
                SimpleCapsuleInformation('${AppText.intelligence}: ${equipment?.attributes.intelligence}',),
              ],
            ),
          ),
      ],
    );
  }
}
