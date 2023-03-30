import 'package:shared_preferences/shared_preferences.dart';

const String linkPrefsName = 'link';

Future<bool> setLink({required String link}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(linkPrefsName, link);
}

Future<String?> getLink() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? link = prefs.getString(linkPrefsName);
  if (link == null) return null;
  if (link.isEmpty) return null;
  return link;
}