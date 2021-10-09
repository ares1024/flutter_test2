import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test2/generated/json/base/json_convert_content.dart';
import 'package:flutter_test2/model/user_entity.dart';
import 'package:flutter_test2/utils/log.dart';
import 'package:http/http.dart' as http;

class MyHttpTest extends StatefulWidget {
  final String _title;

  const MyHttpTest(this._title, {Key? key}) : super(key: key);

  @override
  State<MyHttpTest> createState() => _MyHttpTestState();
}

class _MyHttpTestState extends State<MyHttpTest> {
  List<UserEntity> widgets = [];

  showLoadingDialog() {
    if (widgets.isEmpty) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return const Center(child: CircularProgressIndicator());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        Log.i("User = " + widgets[position].toString());
        return getRow(position);
      });

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._title),
      ),
      body: getBody(),
    );
  }

  void loadData() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(url));
    Log.w(response.body);

    setState(() {
      var map = json.decode(response.body) as List;
      widgets = JsonConvert.fromJsonAsT<List<UserEntity>>(map);
    });
  }

  Widget getRow(int position) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("id= ${widgets[position].id}"
          "      name:${widgets[position].name}"
          "\nzipcode: ${widgets[position].address.zipcode}"
          "\nlat = ${widgets[position].address.geo.lat}"),
    );
  }
}
