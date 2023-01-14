part of 'app_style.dart';

InputDecorationTheme myInputDecorationTheme() => InputDecorationTheme(
  hintStyle: const TextStyle(
    color: ColorTable.fontDefault,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  ),
  labelStyle: const TextStyle(color: ColorTable.primary),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: const BorderSide(
      color: ColorTable.primary,
      width: 1,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: const BorderSide(
      color: ColorTable.disabledItem,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: const BorderSide(
      color: ColorTable.primaryLight,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1,
    ),
  ),
);