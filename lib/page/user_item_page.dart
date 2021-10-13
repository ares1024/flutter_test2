import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test2/generated/json/base/json_convert_content.dart';
import 'package:flutter_test2/model/user_entity.dart';

class UserItemPage extends StatelessWidget {
  final String userJson;

  const UserItemPage(this.userJson, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = json.decode(userJson);
    final UserEntity userEntity = JsonConvert.fromJsonAsT<UserEntity>(map);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userEntity.name),
      ),
      body: Center(
        child: Text(userEntity.toString()),
      ),
    );
  }
}
