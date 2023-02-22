import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/custom_dialogs.dart';
import 'package:game_book_counter/src/presentation/items/bloc/item_state.dart';
import 'package:game_book_counter/src/presentation/items/bloc/items_bloc.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardEquipmentsList extends StatefulWidget {
  final List<Equipment> equipments;
  final Function(Equipment?) onTapAddEquipment;
  final Function(Equipment) onTapRemoveEquipment;

  const HomeCardEquipmentsList({
    required this.equipments,
    required this.onTapAddEquipment,
    required this.onTapRemoveEquipment,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCardEquipmentsList> createState() => _HomeCardEquipmentsListState();
}

class _HomeCardEquipmentsListState extends State<HomeCardEquipmentsList> {
  late ItemsBloc itemsBloc;

  @override
  void initState() {
    super.initState();
    itemsBloc = getIt<ItemsBloc>();
    itemsBloc.init();
  }

  @override
  void dispose() {
    itemsBloc.close();
    super.dispose();
  }

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
            itemCount: widget.equipments.length,
            itemBuilder: (context, index){
              if (widget.equipments.isEmpty) {
                return Container();
              }
              return HomeCardEquipmentsListItem(
                equipment: widget.equipments[index],
                onRemoveItem: () => widget.onTapRemoveEquipment(widget.equipments[index]),
              );
            },
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () async {
                  Equipment? equipment;
                  if (itemsBloc.state is ItemsLoadedState) {
                    if ((itemsBloc.state as ItemsLoadedState).items.isNotEmpty) {
                      equipment = await CustomDialogs().showAddEquipmentToPlayerDialog(context);
                    } else {
                      CustomDialogs().showMessageDialog(context, AppText.item, AppText.emptyListMessage(AppText.equipment));
                    }
                  }
                  widget.onTapAddEquipment(equipment);
                },
                child: const Text(AppText.equipItem),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
