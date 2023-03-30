import 'package:flutter/material.dart';
import 'package:stopwatch/theme/text_style.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({
    Key? key,
    required this.elapsed,
  }) : super(key: key);

  final Duration elapsed;

  String _time() {
    String minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    String seconds =
        (elapsed.inSeconds.remainder(60)).toString().padLeft(2, '0');
    String millis = (elapsed.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');
    return "$minutes:$seconds,$millis";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        _time(),
        textAlign: TextAlign.center,
        style: TextStyleProject.stopwatch,
      ),
    );
  }
}
