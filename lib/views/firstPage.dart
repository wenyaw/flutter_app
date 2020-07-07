import 'package:flutter/material.dart';
import '../components/list.dart';

class firstPage extends StatefulWidget{
  @override
  firstStatePage createState() => firstStatePage();
}

class firstStatePage extends State<firstPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('界面一'),
//      ),
      body: new Container(
        child: new list(),
      ),
    );
  }
}