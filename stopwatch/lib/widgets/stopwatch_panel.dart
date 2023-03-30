import 'package:flutter/material.dart';
import 'package:stopwatch/theme/button.dart';

class StopWatchPanel extends StatelessWidget {
  const StopWatchPanel({
    Key? key,
    required this.onStart,
    required this.onStop,
    required this.onReset,
  }) : super(key: key);

  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonReset(onReset: onReset),
        const SizedBox(width: 32),
        ButtonStart(onStart: onStart),
        const SizedBox(width: 32),
        ButtonStop(onStop: onStop),
      ],
    );
  }
}