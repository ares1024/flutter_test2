import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      ),
    );
  }

  _cleanCounter() {
    setState(() {
      _counter = 0;
    });
  }
}
