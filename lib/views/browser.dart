import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//flutter中使用webview
class Browser extends StatelessWidget {
  final String title;
  final String url;
  const Browser({Key key, this.title, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: Text(title),
//      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
