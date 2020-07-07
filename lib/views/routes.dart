
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/router_handler.dart';

class Routes {
  static String root = "/";
  static String indexPage = "/views/firstPage";
  static String secondPage = "/views/secondPage";
  static String thridPage = "/views/thridPage";
  static String detailsPage = "/views/details";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      // ignore: missing_return
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('找不到路由，404');
      },
    );
    // 路由页面配置
    router.define(indexPage, handler: firstHandler);
    router.define(secondPage, handler: secondHandler);
    router.define(thridPage, handler: thirdHandler);
    router.define(detailsPage, handler: detailsHandler);
  }
}