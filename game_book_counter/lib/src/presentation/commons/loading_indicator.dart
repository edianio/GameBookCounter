import 'package:flutter/material.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(
          backgroundColor: ColorTable.fontDefaultLight,
          valueColor: AlwaysStoppedAnimation(ColorTable.primary),
        ),
      ),
    );
  }
}
