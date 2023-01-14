import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/my_app.dart';
import 'package:game_book_counter/src/presentation/main/splash_page.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const SplashPage());

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  serviceLocatorSetup();

  runApp(const MyApp());
}
