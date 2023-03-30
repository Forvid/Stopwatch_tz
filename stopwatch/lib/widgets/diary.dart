import 'package:flutter/material.dart';
import 'package:stopwatch/helpers/db.dart';
import 'package:stopwatch/model/diary.dart';
import 'package:stopwatch/theme/button.dart';
import 'package:stopwatch/theme/color.dart';
import 'package:stopwatch/theme/field.dart';

class DiaryWidgetController extends StatefulWidget {
  const DiaryWidgetController({
    Key? key,
    required this.diary,
    required this.onDelete,
  }) : super(key: key);

  final Diary diary;
  final Function(Diary diary) onDelete;

  @override
  State<DiaryWidgetController> createState() => _DiaryWidgetControllerState();
}

class _DiaryWidgetControllerState extends State<DiaryWidgetController> {
  Future<void> _onChange({
    String? title,
    String? count,
    String? time,
  }) async {
    Diary diary = widget.diary;
    if (title != null) diary.title = title;
    if (count != null) diary.count = count;
    if (time != null) {
      String secondsString = time;
      int? secondsInt = int.tryParse(secondsString);
      Duration? duration =
          (secondsInt != null) ? Duration(seconds: secondsInt) : null;
      diary.time = duration;
    }
    await insertDiary(widget.diary);
  }

  @override
  Widget build(BuildContext context) {
    return _DiaryWidget(
      diary: widget.diary,
      onDelete: () {
        widget.onDelete(widget.diary);
      },
      onChange: _onChange,
    );
  }
}

class _DiaryWidget extends StatelessWidget {
  const _DiaryWidget({
    Key? key,
    required this.diary,
    required this.onDelete,
    required this.onChange,
  }) : super(key: key);
  final Diary diary;
  final Function({String? title, String? count, String? time}) onChange;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorProject.gray,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                key: Key("${diary.id}title"),
                hintText: "Exercise",
                initialValue: diary.title,
                onChanged: (text) {
                  onChange(title: text);
                },
              ),
              flex: 2,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextFormField(
                  key: Key("${diary.id}count"),
                  hintText: "Approaches",
                  initialValue: diary.count,
                  onChanged: (text) {
                    onChange(count: text);
                  }),
              flex: 1,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextFormField(
                  key: Key("${diary.id}time"),
                  hintText: "Time",
                  initialValue: diary.time?.inSeconds.toString() ?? "",
                  onChanged: (text) {
                    onChange(time: text);
                  }),
              flex: 1,
            ),
            const SizedBox(width: 8),
            ButtonDelete(
              onDelete: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
