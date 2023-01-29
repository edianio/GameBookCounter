import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomToggle extends StatefulWidget {
  final Function(bool) onChange;
  final bool initialValue;
  final double width;

  const CustomToggle({required this.onChange, required this.initialValue, this.width = 50, Key? key}) : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.initialValue;
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(milliseconds: 300);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    !_checked ? _controller.forward() : _controller.reverse();
    _checked = !_checked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: widget.width,
        child: Lottie.asset(
          'assets/lottie/toggle.json',
          controller: _controller,
        ),
      ),
    );
  }
}
