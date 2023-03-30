import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stopwatch/model/diary.dart';
import 'package:stopwatch/utils/date_format.dart';

const String _dbName = "diary.db";
const String _tableName = "diary_table";

Future<Database> _database() async {
  return openDatabase(
    join(await getDatabasesPath(), _dbName),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, title TEXT, count TEXT, time TEXT)',
      );
    },
    version: 1,
  );
}

Future<Diary> createDiary(DateTime date) async {
  Diary diary = Diary(date: date);
  int index = await insertDiary(diary);
  diary.id = index;
  return diary;
}

Future<int> insertDiary(Diary diary) async {
  final db = await _database();
  return await db.insert(
    _tableName,
    diary.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteDiary(Diary diary) async {
  final db = await _database();
  await db.delete(
    _tableName,
    where: 'id = ?',
    whereArgs: [diary.id],
  );
}

Future<List<Diary>> selectDiary(DateTime date) async {
  final db = await _database();
  final List<Map<String, dynamic>> maps = await db.query(
    _tableName,
    where: 'date = ?',
    whereArgs: [formatterDateTimeToDatabase.format(date)],
  );
  return convertMapToDiaryList(maps);
}
