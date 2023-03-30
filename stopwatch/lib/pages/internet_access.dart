import 'package:flutter/material.dart';
import 'package:stopwatch/utils/safe_area.dart';

class InternetAccessPage extends StatelessWidget {
  const InternetAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeAreaProject(
      child: Scaffold(
        body: Center(
          child: Text("The application requires access to the network"),
        ),
      ),
    );
  }
}
