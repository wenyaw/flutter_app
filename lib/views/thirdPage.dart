import 'package:flutter/material.dart';
import '../components/gridList.dart';

class thridPage extends StatefulWidget{
  @override
  thirdStatePage createState() => thirdStatePage();
}

class thirdStatePage extends State<thridPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('我的'),
//      ),
      body: new Center(
        child: new gridList(),
      ),
    );
  }


}