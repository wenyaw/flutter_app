import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/applictaion.dart';
import 'package:flutter_app/views/browser.dart';
import 'package:flutter_app/views/firstPage.dart';
import 'package:flutter_app/views/fourPage.dart';
import 'package:flutter_app/views/routes.dart';
import 'package:flutter_app/views/secondPage.dart';
import 'package:flutter_app/views/thirdPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(

      title: "Samilp App",
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white),
      home: SampleAppPage(),
//      home: FadeAppTest(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('demo'),),
        body: new TabBarView(
          physics: new NeverScrollableScrollPhysics(),
            controller: controller,
            children: <Widget>[
              new firstPage(),
              new secondPage(),
              new thridPage(),
              new Browser(title: '显示webview',url: 'https://www.baidu.com/',),
//              new fourPage()
            ]
        ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
            tabs: [
              new Tab(text: '列表',icon: new Icon(Icons.home),),
              new Tab(text: '可伸缩列表',icon: new Icon(Icons.cloud_upload),),
              new Tab(text: '网格列表',icon: new Icon(Icons.message),),
              new Tab(text: '节目四',icon: Icon(Icons.account_balance),)
            ]
        ),
      ),
    );
  }
}



