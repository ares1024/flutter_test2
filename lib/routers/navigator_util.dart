import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/model/user_entity.dart';
import 'package:flutter_test2/routers/application.dart';
import 'package:flutter_test2/routers/routes.dart';

class NavigatorUtil {
  static Future goUserItemPage(BuildContext context, UserEntity userEntity) {
    String userJson = json.encode(userEntity);
    return Application.router
        .navigateTo(context, Routes.pageUserItem + "?userJson=$userJson",transition: TransitionType.inFromRight);
  }
}
