import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/item/use_cases/add_item.dart';
import 'package:game_book_counter/src/domain/item/use_cases/get_all_items.dart';
import 'package:game_book_counter/src/presentation/items/bloc/Item_event.dart';
import 'package:game_book_counter/src/presentation/items/bloc/item_state.dart';

class ItemsBloc extends Bloc<ItemEvent, ItemState>{
  final AddItem addItem;
  final GetAllItems getAll;

  ItemsBloc({required this.addItem, required this.getAll}) : super(ItemsLoadingState()) {
    on<AddItemEvent>(_addItem, transformer: droppable());
    on<GetAllItemsEvent>(_getAll, transformer: sequential());
  }

  void init() async {
    add(GetAllItemsEvent());
  }

  Future<void> _addItem(AddItemEvent event, Emitter emit) async {
    await addItem(event.item).then(
      (value) {
        add(GetAllItemsEvent());
      },
      onError: (e, s) {
        emit(ItemsExceptionState(e.toString()));
      },
    );
  }

  Future<void> _getAll(GetAllItemsEvent event, Emitter emit) async {
    await getAll().then((data) {
      emit(ItemsLoadedState(data));
    }).catchError((e,s){
      emit(ItemsExceptionState(e.toString()));
    });
  }
}