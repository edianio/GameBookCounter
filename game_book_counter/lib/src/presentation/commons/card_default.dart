import 'package:flutter/material.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class CardDefault extends StatelessWidget {
  final Widget child;

  const CardDefault({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 16, left: 16, top: 16,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: ColorTable.primary,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
