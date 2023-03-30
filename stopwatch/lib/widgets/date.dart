import 'package:flutter/material.dart';
import 'package:stopwatch/theme/button.dart';
import 'package:stopwatch/utils/date_format.dart';

class DateSelectorWidget extends StatelessWidget {
  const DateSelectorWidget({
    Key? key,
    required this.date,
    required this.callback,
  }) : super(key: key);

  final DateTime date;
  final Function(bool isNext) callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _arrowLeft(),
        const SizedBox(width: 16),
        _date(),
        const SizedBox(width: 16),
        _arrowRight(),
      ],
    );
  }

  Widget _arrowLeft() {
    return ButtonLeft(callback: callback);
  }

  Widget _date() {
    return Text(
      formatterDateTimeToShow.format(date),
    );
  }

  Widget _arrowRight() {
    return ButtonRight(callback: callback);
  }
}
