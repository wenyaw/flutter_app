import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/applictaion.dart';
import 'package:flutter_app/views/details.dart';
import 'package:flutter_app/views/routes.dart';

class NavigatorUtil {
  //返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
    Application.router.pop(context);
  }

  //带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  //路由返回指定页面
  static void goBackUrl(BuildContext context, title) {
    Navigator.popAndPushNamed(context, title);
  }

  //跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.secondPage);
  }

  //跳转到详情页
  static void jumpToDetails(BuildContext context, result) {
//    Application.router.navigateTo(context, Routes.detailsPage);
    Application.router.navigateTo(context, "/views/details?pId=$result");
  }
}
