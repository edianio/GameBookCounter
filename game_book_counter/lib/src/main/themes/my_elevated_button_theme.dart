part of 'app_style.dart';

ElevatedButtonThemeData myElevatedButtonTheme() => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: ColorTable.primary,
    elevation: 1,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
  ),
);