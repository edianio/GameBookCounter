import 'package:flutter/material.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/pages_controller/bloc/pages_bloc.dart';

void serviceLocatorPages() {
  getIt.registerSingleton<PagesBloc>(PagesBloc(PageController()));
}