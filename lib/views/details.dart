import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  String id;

  details({Key key, String pId}) : super(key: key) {
    this.id = pId;
  }

  @override
  State<StatefulWidget> createState() {
    return detailsState(id);
  }
}

class detailsState extends State<details> {
  var mId;

//  Details detail;
  var data = null;

  detailsState(var id) {
    this.mId = id;
  }

  @override
  void initState() {
    super.initState();
    _getData(mId);
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    if (data != null) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
        ),
        body: new Container(
          child: Text("显示详情信息==>${data['des']}"),
        ),
      );
    } else {
      return new Scaffold(
        appBar: AppBar(title: Text('商品详情'),),
        body: new Center(
          child: new CircularProgressIndicator(
            strokeWidth: 4.0, backgroundColor: Color(0xffff0000),
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red))
        ),
      );
    }
  }

  _getData(pId) async {
    var detailsUrl =
        "https://rrl360.com/api/blockchain/block/chain/details.json?block_chain=$pId";
    HttpClient client = new HttpClient();
    var request = await client.getUrl(Uri.parse(detailsUrl));
    var response = await request.close();
    var result;
    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      result = jsonDecode(json);
      data = result["data"];
    }
    setState(() {
      data = result["data"];
    });
  }
}

class Details {
  Details(this.title);

  String title;
}
