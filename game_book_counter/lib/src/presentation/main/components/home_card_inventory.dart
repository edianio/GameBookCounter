import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/items/bloc/items_bloc.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_inventory_section.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardInventory extends StatefulWidget {
  final Inventory inventory;

  const HomeCardInventory({required this.inventory, Key? key,}) : super(key: key);

  @override
  State<HomeCardInventory> createState() => _HomeCardInventoryState();
}

class _HomeCardInventoryState extends State<HomeCardInventory> {
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
    final fontStyle = Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault);

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
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 4),
                child: Text(
                  AppText.coins,
                  style: fontStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 4),
                child: Text(
                  '${widget.inventory.money}\$',
                  style: fontStyle,
                ),
              ),
            ],
          ),
          HomeCardInventorySection(items: widget.inventory.equipments),
          HomeCardInventorySection(items: widget.inventory.consumables),
          HomeCardInventorySection(items: widget.inventory.items),
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(AppText.createItem),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
