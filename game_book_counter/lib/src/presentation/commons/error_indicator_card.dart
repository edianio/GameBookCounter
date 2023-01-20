import 'package:flutter/material.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class ErrorIndicatorCard extends StatelessWidget {
  final String error;
  const ErrorIndicatorCard({required this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorTable.warning,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            error,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
