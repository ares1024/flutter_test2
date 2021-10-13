import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/page_empty.dart';
import 'package:flutter_test2/page/user_item_page.dart';

var emptyHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const PageEmpty();
});

var userItemHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String userJson = params['userJson']!.first;
  return UserItemPage(userJson);
});
