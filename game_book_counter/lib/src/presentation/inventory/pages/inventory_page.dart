import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_bloc.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_event.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_state.dart';
import 'package:game_book_counter/src/presentation/inventory/pages/components/inventory_section.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late final ScrollController _controller;
  late final InventoryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<InventoryBloc>();
    bloc.add(GetInventoryEvent(''));
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.inventory),
        centerTitle: true,
      ),
      body: BlocBuilder(
        builder: (context, state) {
          if(state is InventoryLoadedState) {
            return CustomScrollView(
              controller: _controller,
              slivers: [
                SliverToBoxAdapter(
                  child: InventorySection(
                    title: '',
                    items: state.inventory.items,
                    onTap: () => Navigator.of(context).pushNamed(PageConst.items),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: InventorySection(
                //     items: state.inventory.equipments,
                //     onTap: () => Navigator.of(context).pushNamed(PageConst.equipments),
                //   ),
                // ),
                // SliverToBoxAdapter(
                //   child: InventorySection(
                //     items: state.inventory.consumables,
                //     onTap: () => Navigator.of(context).pushNamed(PageConst.consumables),
                //   ),
                // ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
