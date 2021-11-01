import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/base_page.dart';
import 'package:flutter_test2/routers/navigator_util.dart';
import 'package:flutter_test2/utils/log.dart';

class MyHomePage extends StatefulWidget with BasePage {
  const MyHomePage(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name = "";

  @override
  void initState() {
    ///监听状态
    FirebaseAuth.instance.userChanges().listen((user) {
      Log.i("_signOut user = ${user.toString()}");
      if (user == null) {
        NavigatorUtil.goLoginPage(context);
      }else{
        _name = user.displayName!;
        Log.i("initState listen name = $_name");
      }
    });
    super.initState();
  }

  ///退出登录
  void _signOut() {
    FirebaseAuth.instance.signOut();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget._title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.cleaning_services_outlined),
              tooltip: 'signOut',
              onPressed: _signOut,
            ),
          ],
        ),
        body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () => _incrementCounter(),
                  color: Colors.red,
                  textColor: Colors.white60,
                  child: Text('$_counter'),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                ),
                MaterialButton(
                  onPressed: () => _cleanCounter(),
                  child: const Text("Clean"),
                  color: Colors.amberAccent,
                ),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(hintText: "请输入"),
                ))
              ]),
        ));
  }

  _cleanCounter() {
    setState(() {
      _counter = 0;
    });
  }
}
