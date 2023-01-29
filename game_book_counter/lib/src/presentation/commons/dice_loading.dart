import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DiceLoading extends StatefulWidget {
  const DiceLoading({Key? key}) : super(key: key);

  @override
  State<DiceLoading> createState() => _DiceLoadingState();
}

class _DiceLoadingState extends State<DiceLoading> {
  final double width = 160;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: width,
          child: Lottie.asset(
            'assets/lottie/dice-6.json',
            // controller: _controller,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
