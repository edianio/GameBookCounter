import 'package:flutter/material.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/battle/battle_page.dart';
import 'package:game_book_counter/src/presentation/history/history_page.dart';
import 'package:game_book_counter/src/presentation/main/home_page.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_bloc.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagesBloc = getIt<PagesBloc>();

    return PageView(
      controller: pagesBloc.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        HomePage(),
        BattlePage(),
        HistoryPage(),
      ],
    );
  }
}