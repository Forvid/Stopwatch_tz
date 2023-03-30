import 'package:flutter/material.dart';
import 'package:stopwatch/model/diary.dart';
import 'package:stopwatch/widgets/diary.dart';

class DiaryListWidget extends StatelessWidget {
  const DiaryListWidget({
    Key? key,
    required this.list,
    required this.onDelete,
  }) : super(key: key);

  final List<Diary> list;
  final Function(Diary diary) onDelete;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var diary in list)
            DiaryWidgetController(
              diary: diary,
              onDelete: onDelete,
            ),
        ],
      ),
    );
  }
}
