import 'package:flutter/material.dart';
import 'package:stopwatch/helpers/connectivity.dart';
import 'package:stopwatch/utils/safe_area.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'internet_access.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({
    Key? key,
    required this.link,
  }) : super(key: key);

  final String link;

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  late WebViewController _controller;

  Future<void> _checkConnectivity() async {
    bool connectivity = await checkConnectivity();
    if (!connectivity) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const InternetAccessPage(),
        ),
      );
    }
  }

  Future<bool> _onWillPop() async {
    await _controller.goBack();
    return false;
  }

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..canGoBack()
      ..loadRequest(Uri.parse(widget.link));
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkConnectivity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeAreaProject(
        child: Scaffold(
          body: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
