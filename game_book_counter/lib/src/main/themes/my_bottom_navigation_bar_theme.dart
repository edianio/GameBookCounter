part of 'app_style.dart';

BottomNavigationBarThemeData myBottomNavigationBarTheme() => const BottomNavigationBarThemeData(
  backgroundColor: Colors.white,
  unselectedItemColor: ColorTable.disabledItem,
  showUnselectedLabels: true,
  selectedItemColor: ColorTable.enabledItem,
  elevation: 1,
);