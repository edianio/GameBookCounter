import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class SimpleCapsuleInformation extends StatelessWidget {
  final String text;

  const SimpleCapsuleInformation(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
        border: Border.all(
          color: ColorTable.primary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault),
        ),
      ),
    );
  }
}
