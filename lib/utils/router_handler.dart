//首页
import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/details.dart';
import 'package:flutter_app/views/firstPage.dart';
import 'package:flutter_app/views/secondPage.dart';
import 'package:flutter_app/views/thirdPage.dart';

Handler firstHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return firstPage();
});
Handler secondHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return secondPage();
});
Handler thirdHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return thridPage();
});
//详情页
Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String pid = params['pId'][0];
  print("商品id====》"+pid);
  return details(pId: pid);
});
