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
              Image.network(
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-audi-rs6-avant-mmp-1-1620073915.jpg?crop=0.976xw:0.825xh;0.0240xw,0.113xh&resize=1980:*",
                height: 180,
                width: 180,
              )
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
