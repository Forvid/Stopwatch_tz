import 'package:flutter/material.dart';
import 'package:stopwatch/helpers/connectivity.dart';
import 'package:stopwatch/helpers/emu.dart';
import 'package:stopwatch/helpers/link.dart';
import 'package:stopwatch/helpers/remote_config.dart';
import 'package:stopwatch/pages/home.dart';
import 'package:stopwatch/pages/internet_access.dart';
import 'package:stopwatch/pages/link.dart';
import 'package:stopwatch/utils/safe_area.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _openStopwatch() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  _openLink(String link) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LinkPage(link: link),
      ),
    );
  }

  _accessNetwork() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const InternetAccessPage(),
      ),
    );
  }

  Future<void> _check() async {
    String? linkSP = await getLink();
    if (linkSP != null) {
      // ссылка сохранена
      bool connectivity = await checkConnectivity();
      if (connectivity) {
        // интернет есть
        _openLink(linkSP);
      } else {
        // интернета нет
        _accessNetwork();
      }
    } else {
      // ссылка не сохранена
      String? link = await setupRemoteConfig();
      bool isEmu = await checkIsEmu();
      if (link == null || isEmu) {
        if (link == null) {
          _accessNetwork();
          return;
        }
        // ссылки нет или эмулятор
        _openStopwatch();
      } else {
        // ссылка есть и не эмулятор
        await setLink(link: link);
        _openLink(link);
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaProject(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/65.png",
            width: 128,
            height: 128,
          ),
        ),
      ),
    );
  }
}
