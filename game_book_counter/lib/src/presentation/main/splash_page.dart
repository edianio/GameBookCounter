import 'package:flutter/material.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorTable.primary,
              ColorTable.primaryLight,
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Game Book\nCounter',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 46),
          ),
        ),
      ),
    );
  }
}