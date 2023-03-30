import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/stopwatch.dart';
import 'package:stopwatch/widgets/stopwatch_panel.dart';

class StopwatchController extends StatefulWidget {
  const StopwatchController({Key? key}) : super(key: key);

  @override
  State<StopwatchController> createState() => _StopwatchControllerState();
}

class _StopwatchControllerState extends State<StopwatchController> {
  final Stopwatch _stopwatch = Stopwatch();
  Duration _elapsed = Duration.zero;
  Timer? _timer;

  _onStart() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      Duration elapsed = _stopwatch.elapsed;
      setState(() {
        _elapsed = elapsed;
      });
    });
  }

  _onStop() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  _onReset() {
    _stopwatch.stop();
    _timer?.cancel();
    _stopwatch.reset();
    setState(() {
      _elapsed = Duration.zero;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StopwatchWidget(elapsed: _elapsed),
        StopWatchPanel(
          onStart: _onStart,
          onStop: _onStop,
          onReset: _onReset,
        ),
      ],
    );
  }
}
