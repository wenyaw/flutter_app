import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/navigator_util.dart';
import 'package:http/http.dart' as http;

class list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return listState();
  }
}

class listState extends State<list> {
  var data = new List();
  int _mPage = 1;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getData(true);
    //给_controller添加监听
    _controller.addListener(() {
      print(_controller.position.pixels);
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (_mPage < 4) {
          _loadMoreData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var count = data == null ? 0 : data.length;
    if (count == 0) {
      return new Center(
          child: new CircularProgressIndicator(
        strokeWidth: 4.0,
        backgroundColor: Color(0xffff0000),
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      ));
    } else {
      return new RefreshIndicator(onRefresh: _onRefresh, child: getListView());
    }
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  ListView getListView() => new ListView.separated(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Message msg = Message(data[index]["id"], data[index]["title"],
            data[index]["des"], data[index]["create_date"]);
        if (index == data.length) {
          //判断是不是最后一页
          if (_mPage < 4) {
            //不是最后一页，返回一个loading窗
            return new Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: new SizedBox(
                width: 24,
                height: 24,
                child: new CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            //是最后一页，显示我是有底线的
            return new Container(
              child: new Text(
                '---我是有底线的---',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            );
          }
        } else {
          return _addView(msg);
        }
      },
      separatorBuilder: (context, index) {
        return new Divider(color: Colors.grey);
      },
      itemCount: data == null ? 0 : data.length);

  Widget _addView(Message msg) {
    return new Card(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      elevation: 5,
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),//设置圆角
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      child: new Container(
        padding: new EdgeInsets.all(5),
        child: new ListTile(
          subtitle: new Container(
            child: new GestureDetector(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        "标题:${msg.title}",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text("时间："),
                          new Text("${msg.create_date}")
                        ],
                      )
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                        child: new Text(
                          "内容：${msg.des}",
                          style: new TextStyle(wordSpacing: 20.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ))
                    ],
                  )
                ],
              ),
              onTap: () {
                //跳转到下个页面
                NavigatorUtil.jumpToDetails(context, msg.id.toString());
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new details(pId: msg.id.toString())));
              },
            ),
          ),
          trailing: new Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  _getData(bool isRefresh) async {
    var strurl =
        "https://rrl360.com/api/blockchain/block/chain/list.json?page=$_mPage&count=10";
    http.Response response = await http.get(strurl);
    var result = jsonDecode(response.body);
    print("当前page=====>"+_mPage.toString());
    setState(() {
      if (isRefresh) {
        data = result["data"];
      } else {
        data.add(result["data"]);
      }
    });
  }

  //刷新数据
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        _mPage = 1;
        data.clear();
        _getData(true);
      });
    });
  }

  //加载更多
  void _loadMoreData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _mPage++;
        _getData(false);
      });
    });
  }
//获取网络数据
//  _getData() async {
//    var url = "https://rrl360.com/api/blockchain/block/chain/list.json";
//    var httpClient = new HttpClient();
//    var result;
//    try {
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.ok) {
//        var json = await response.transform(utf8.decoder).join();
//        result = jsonDecode(json);
////        print(data.length);
//      } else {
//        result = 'error get json data:\nHttp status${response.statusCode}';
//      }
//    } catch (e) {
//      result = 'Failed get json data!';
//    }
//    setState(() {
//      data= result["data"];
//    });
//  }
}

//实体类
class Message {
  Message(this.id, this.title, this.des, this.create_date);
  var id;
  String title;
  String des;
  String create_date;
}
