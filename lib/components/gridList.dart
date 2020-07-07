import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class gridList extends StatefulWidget {
  @override
  gridState createState() => gridState();
}

class gridState extends State {
  var data;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      padding: new EdgeInsets.all(15),
      children: new List.generate(data== null ? 0 : data.length, (index) {
        return new Center(
          heightFactor: 30,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                    "${data[index]["title"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                  ))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(top: 8),
                    child: new Image.network(data[index]["image"],
                        width: 150, height:80,fit: BoxFit.scaleDown),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Icon(
                              Icons.ac_unit,
                              size: 16,
                            ),
                            new Container(
                                padding: EdgeInsets.only(left: 8),
                                child: new Text("${data[index]["create_date"]}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                        fontSize: 13.0)))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  _getData() async {
    var url = "https://rrl360.com/api/blockchain/block/chain/list.json";
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      } else {
        result = 'error get json data:\nHttp status${response.statusCode}';
      }
    } catch (e) {
      result = 'Failed get json data!';
    }
    setState(() {
      data = result["data"];
    });
  }
}
