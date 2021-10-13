import 'package:fluro/fluro.dart';
import 'package:flutter_test2/routers/router_handler.dart';

class Routes {
  static String pageHome = "/";
  static String pageUserItem = "/user_item";

  static void configureRoutes(FluroRouter router) {
    // router.define(pageHome, handler: homeHandler);
    router.define(pageUserItem, handler: userItemHandler);
    router.notFoundHandler = emptyHandler;
  }
}
