import 'package:flutter/material.dart';

class PageEmpty extends StatelessWidget {
  const PageEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("没有找到页面"),
        ),
        body: const Center(
          child: Text("没有页面"),
        ),
      ),
    );
  }
}
