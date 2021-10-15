import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test2/generated/json/base/json_convert_content.dart';
import 'package:flutter_test2/model/user_entity.dart';
import 'package:flutter_test2/routers/navigator_util.dart';

class UserItemPage extends StatelessWidget {
  final String userJson;

  const UserItemPage(this.userJson, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = json.decode(userJson);
    final UserEntity userEntity = JsonConvert.fromJsonAsT<UserEntity>(map);
    return WillPopScope(
      onWillPop: () => _requestPop(context, userEntity.name),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(userEntity.name),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(userEntity.toString()),
        )),
      ),
    );
  }

  Future<bool> _requestPop(BuildContext context, String name) async {
    NavigatorUtil.goBackWithParams(context, name);
    return Future.value(true);
  }
}
