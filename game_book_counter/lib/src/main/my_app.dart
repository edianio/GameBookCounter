import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/main/app_generated_route.dart';
import 'package:game_book_counter/src/main/themes/app_style.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Book Counter',
      theme: appStyle(),
      initialRoute: PageConst.root,
      onGenerateRoute: AppGeneratedRoute.route,
    );
  }
}