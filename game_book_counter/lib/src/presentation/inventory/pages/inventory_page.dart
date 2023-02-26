import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_bloc.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_state.dart';
import 'package:game_book_counter/src/presentation/inventory/pages/components/inventory_section.dart';

class InventoryPage extends StatefulWidget {
  final String playerId;

  const InventoryPage({required this.playerId, Key? key,}) : super(key: key);

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
    bloc.init(widget.playerId);
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.inventory),
        centerTitle: true,
      ),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is InventoryLoadedState) {
            return CustomScrollView(
              controller: _controller,
              slivers: [
                SliverToBoxAdapter(
                  child: CardDefault(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              AppText.coins,
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              '\$${state.inventory.money}',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: InventorySection(
                    title: AppText.consumable,
                    items: state.inventory.consumables,
                    onTap: () => Navigator.of(context).pushNamed(PageConst.items),
                  ),
                ),
                SliverToBoxAdapter(
                  child: InventorySection(
                    title: AppText.equipments,
                    items: state.inventory.equipments,
                    onTap: () => Navigator.of(context).pushNamed(PageConst.items),
                  ),
                ),
                SliverToBoxAdapter(
                  child: InventorySection(
                    title: AppText.items,
                    items: state.inventory.items,
                    onTap: () => Navigator.of(context).pushNamed(PageConst.items),
                  ),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
