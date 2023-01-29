import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/error_indicator_card.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/items/bloc/Item_event.dart';
import 'package:game_book_counter/src/presentation/items/bloc/item_state.dart';
import 'package:game_book_counter/src/presentation/items/bloc/items_bloc.dart';
import 'package:game_book_counter/src/presentation/items/pages/components/items_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late ItemsBloc bloc;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = getIt<ItemsBloc>();
    bloc.add(GetAllItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.items),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(PageConst.addItem),
        backgroundColor: ColorTable.primary,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: BlocBuilder<ItemsBloc, ItemState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is ItemsLoadingState){
            return const LoadingIndicator();
          }
          if(state is ItemsLoadedState) {
            return CustomScrollView(
              controller: controller,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ItemsListItem(
                        item: state.items[index],
                        onTapEnable: (value) => bloc.add(SetEnabledItemEvent(item: state.items[index], enabled: value)),
                      );
                    },
                    childCount: state.items.length,
                  ),
                ),
              ],
            );
          }
          return ErrorIndicatorCard(error: (state as ItemsExceptionState).error);
        },
      ),
    );
  }
}
