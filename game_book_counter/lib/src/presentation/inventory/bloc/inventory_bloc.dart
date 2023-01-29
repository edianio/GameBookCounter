import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/inventory/use_cases/get_inventory.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_event.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState>{
  final GetInventory getInventory;

  InventoryBloc({required this.getInventory}) : super(InventoryLoadingState()) {
    on<GetInventoryEvent>(_get, transformer: sequential());
  }

  Future<void> _get(GetInventoryEvent event, Emitter emit) async {
    await getInventory(event.playerId).then((data) {
      emit(InventoryLoadedState(data));
    }).catchError((e,s){
      emit(InventoryExceptionState(e.toString()));
    });
  }
}