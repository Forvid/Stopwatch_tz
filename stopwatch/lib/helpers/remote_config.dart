import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:stopwatch/firebase_options.dart';

Future<String?> setupRemoteConfig() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    var link = remoteConfig.getString("url");
    if (link.isEmpty) return null;
    return link;
  } catch (e) {
    return null;
  }
}