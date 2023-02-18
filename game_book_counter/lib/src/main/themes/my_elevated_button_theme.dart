part of 'app_style.dart';

ElevatedButtonThemeData myElevatedButtonTheme() => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: ColorTable.primary,
    elevation: 1,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
    ),
  ),
);