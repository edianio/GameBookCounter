import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/my_app.dart';
import 'package:game_book_counter/src/presentation/main/splash_page.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';

void main() {
  runApp(const SplashPage());

  serviceLocatorSetup();

  runApp(const MyApp());
}
