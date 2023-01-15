import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardEquipmentsList extends StatelessWidget {
  final List<Equipment> equipments;
  final VoidCallback onTapAddEquipment;
  final VoidCallback onTapRemoveEquipment;

  const HomeCardEquipmentsList({
    required this.equipments,
    required this.onTapAddEquipment,
    required this.onTapRemoveEquipment,
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
                AppText.equipments,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: equipments.length,
            itemBuilder: (context, index){
              if (equipments.isEmpty) {
                return Container();
              }
              return HomeCardEquipmentsListItem(equipment: equipments[index],);
            },
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => onTapAddEquipment(),
                child: const Text(AppText.addEquipment),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
