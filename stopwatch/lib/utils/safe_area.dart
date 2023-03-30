import 'package:flutter/material.dart';
import 'package:stopwatch/theme/color.dart';

class SafeAreaProject extends StatelessWidget {
  final Widget child;
  final Color color;

  const SafeAreaProject({
    Key? key,
    required this.child,
    this.color = ColorProject.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        ),
      ),
    );
  }
}