import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

part 'my_elevated_button_theme.dart';
part 'my_text_theme.dart';
part 'my_app_bar_theme.dart';
part 'my_bottom_navigation_bar_theme.dart';
part 'my_input_decoration_theme.dart';

ThemeData appStyle() => ThemeData(
  fontFamily: 'Roboto',
  textTheme: myTextTheme(),
  primaryColor: ColorTable.primary,
  scaffoldBackgroundColor: ColorTable.scaffoldBackground,
  appBarTheme: myAppBarTheme(),
  bottomNavigationBarTheme: myBottomNavigationBarTheme(),
  elevatedButtonTheme: myElevatedButtonTheme(),
  inputDecorationTheme: myInputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);