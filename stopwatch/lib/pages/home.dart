import 'package:flutter/material.dart';
import 'package:stopwatch/helpers/db.dart';
import 'package:stopwatch/helpers/remote_config.dart';
import 'package:stopwatch/model/diary.dart';
import 'package:stopwatch/theme/button.dart';
import 'package:stopwatch/utils/safe_area.dart';
import 'package:stopwatch/widgets/date.dart';
import 'package:stopwatch/widgets/diary_list.dart';
import 'package:stopwatch/widgets/stopwatch_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _date = DateTime.now();
  List<Diary> _list = [];

  Future<void> _setList() async {
    List<Diary> list = await selectDiary(_date);
    setState(() {
      _list = list;
    });
  }

  Future<void> _addDiary() async {
    var s = await setupRemoteConfig();
    debugPrint("s=$s");
    // await createDiary(_date);
    // await _setList();
  }

  Future<void> _changeDate(bool isNext) async {
    DateTime date;
    if (isNext) {
      date = _date.add(const Duration(days: 1));
    } else {
      date = _date.subtract(const Duration(days: 1));
    }
    setState(() {
      _date = date;
    });
    await _setList();
  }

  Future<void> _deleteDiary(Diary diary) async {
    await deleteDiary(diary);
    await _setList();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _setList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaProject(
      child: Scaffold(
        floatingActionButton: FloatingButtonProject(onPressed: _addDiary),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StopwatchController(),
            const SizedBox(height: 24),
            DateSelectorWidget(
              date: _date,
              callback: _changeDate,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: DiaryListWidget(
                list: _list,
                onDelete: _deleteDiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
