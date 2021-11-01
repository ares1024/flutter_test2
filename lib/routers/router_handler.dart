import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/http/user_item_page.dart';
import 'package:flutter_test2/page/login/page_login_sign.dart';
import 'package:flutter_test2/page/page_empty.dart';
import 'package:flutter_test2/page/page_main.dart';

var emptyHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const PageEmpty();
});

var userItemHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String userJson = params['userJson']!.first;
  return UserItemPage(userJson);
});

var loginHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const PageLoginSign();
});

var mainHandler = Handler(
  handlerFunc: (context, parameters) => const PageMain(),
);
