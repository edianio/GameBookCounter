part of 'app_style.dart';

AppBarTheme myAppBarTheme() => const AppBarTheme(
  elevation: 0,
  centerTitle: true,
  toolbarHeight: 90,
  color: ColorTable.primary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
    ),
  ),
);