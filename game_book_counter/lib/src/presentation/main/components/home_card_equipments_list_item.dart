import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/simple_capsule_information.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardEquipmentsListItem extends StatelessWidget {
  final Equipment equipment;
  const HomeCardEquipmentsListItem({required this.equipment, Key? key}) : super(key: key);

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
            equipment.name,
            style: fontStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
          child: Text(
            '${AppText.use}: ${equipment.position.name}',
            style: fontStyle,
          ),
        ),
        if(equipment.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
            child: Text(
              equipment.description!,
              style: fontStyle,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
          child: Row(
            children: <Widget>[
              Text(
                '${AppText.sellPrice}: \$${equipment.sellPrice}',
                style: fontStyle,
              ),
              const SizedBox(width: 16,),
              Text(
                '${AppText.buyPrice}: \$${equipment.buyPrice}',
                style: fontStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: <Widget>[
              SimpleCapsuleInformation('${AppText.life}: ${equipment.attributes.life}',),
              SimpleCapsuleInformation('${AppText.mana}: ${equipment.attributes.mana}',),
              SimpleCapsuleInformation('${AppText.attack}: ${equipment.attributes.attack}',),
              SimpleCapsuleInformation('${AppText.defense}: ${equipment.attributes.defense}',),
              SimpleCapsuleInformation('${AppText.luck}: ${equipment.attributes.luck}',),
              SimpleCapsuleInformation('${AppText.speed}: ${equipment.attributes.speed}',),
              SimpleCapsuleInformation('${AppText.intelligence}: ${equipment.attributes.intelligence}',),
            ],
          ),
        ),
      ],
    );
  }
}
