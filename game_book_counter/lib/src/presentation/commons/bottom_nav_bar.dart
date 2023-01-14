import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_bloc.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_event.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagesBloc = getIt<PagesBloc>();

    return BlocBuilder<PagesBloc, PagesState>(
      bloc: pagesBloc,
      builder: (_, pagesState){
        return BottomNavigationBar(
          iconSize: 32,
          currentIndex: pagesBloc.currentPage,
          onTap: (index){
            pagesBloc.add(ChangePageEvent(index));
          },
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book,),
              label: 'Início',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.back_hand_outlined,),
              label: 'Batalha',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.view_timeline_outlined,),
              label: 'Histórico',
            ),

          ],
        );
      },
    );
  }
}