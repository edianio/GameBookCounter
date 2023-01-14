import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_event.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState>{
  final PageController pageController;
  int currentPage = 0;

  PagesBloc(this.pageController) : super(FirstPageState()){
    on<ChangePageEvent>(_changePage, transformer: sequential());
  }

  void _changePage(ChangePageEvent event, Emitter emit) {
    try {
      pageController.jumpToPage(event.page);
      currentPage = event.page;
      switch(event.page){
        case 0:
          emit(FirstPageState());
          return;
        case 1:
          emit(SecondPageState());
          return;
        case 2:
          emit(ThirdPageState());
          return;
        default:
          emit(PageExceptionState('Página não encontrada!'));
          return;
      }
    } catch(e) {
      // LogGenerator().error(e);
      emit(PageExceptionState(e.toString()));
    }
  }
}