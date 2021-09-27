import 'package:flutter/material.dart';

class MyFadeTest extends StatefulWidget {
  const MyFadeTest(this._title, {Key? key}) : super(key: key);
  final String _title;

  @override
  State<MyFadeTest> createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._title),
      ),
      body: Center(
        child: FadeTransition(
          opacity: curve,
          child: Image.network(
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-audi-rs6-avant-mmp-1-1620073915.jpg?crop=0.976xw:0.825xh;0.0240xw,0.113xh&resize=1980:*"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '动画',
        child: const Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
