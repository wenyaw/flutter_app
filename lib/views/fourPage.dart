import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/customScrollView.dart';

import '../components/list.dart';

class fourPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new fourStatePage();
  }

}

class fourStatePage extends State<fourPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: Text('界面四'),
//      ),
      body: Container(
        child: customScrollView(),
//        child: new ,
      ),
    );
  }
}