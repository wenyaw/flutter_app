import 'package:flutter/material.dart';
import 'package:flutter_app/components/expansionTile.dart';

class secondPage extends StatefulWidget{
  @override
  secondStatePage createState() => secondStatePage();
}


class secondStatePage extends State<secondPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: expansionTile()
    );
  }
}