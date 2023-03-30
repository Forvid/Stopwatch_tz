import 'package:stopwatch/utils/date_format.dart';

class Diary {
  Diary({
    this.id,
    required this.date,
    this.title = "",
    this.count = "",
    this.time,
  });

  int? id;
  final DateTime date;
  String title;
  String count;
  Duration? time;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': formatterDateTimeToDatabase.format(date),
      'title': title,
      'count': count,
      'time': time?.inMilliseconds.toString(),
    };
  }

  @override
  String toString() {
    return "Diary{id:$id, name:$title, date:$date}";
  }
}

List<Diary> convertMapToDiaryList(List<Map<String, dynamic>> maps) {
  return List.generate(maps.length, (index) {
    return Diary(
      id: maps[index]['id'],
      date: DateTime.parse(maps[index]['date']),
      title: maps[index]['title'],
      count: maps[index]['count'],
      time: (maps[index]['time'] != null)
          ? Duration(milliseconds: int.tryParse(maps[index]['time']) ?? 0)
          : null,
    );
  });
}
