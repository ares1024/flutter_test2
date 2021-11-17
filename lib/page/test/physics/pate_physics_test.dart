import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test2/page/test/physics/ball.dart';
import 'package:flutter_test2/routers/navigator_util.dart';
import 'package:flutter_test2/utils/log.dart';

class PagePhysics extends StatefulWidget {
  const PagePhysics({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhysicsState();
}

class _PhysicsState extends State<PagePhysics>
    with SingleTickerProviderStateMixin {
  final double _width =
      window.physicalSize.width / window.devicePixelRatio; //屏幕宽 dp
  final double _height =
      window.physicalSize.height / window.devicePixelRatio; //屏幕高 dp
  final statusHeight = window.padding.top / window.devicePixelRatio; //状态栏高度
  late AnimationController controller;
  var _oldTime = DateTime.now().millisecondsSinceEpoch;
  var _time = 0;
  late Rect _area; //小球运动空间
  final double _r = 30.0; //小球半径
  late Ball _ball;

  _render() {
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch;
      _time = now - _oldTime;
      Log.i("时间差: ${_time}ms");
      _oldTime = now;
    });
  }

  @override
  void initState() {
    Log.i("statusHeight = $statusHeight");
    _area = Rect.fromLTRB(0, 0, _width, 0 + _height - (statusHeight + 56));//

    Log.d("ball _width = $_width");
    Log.d("ball _height = $_height");
    double _x = (_width - _r) / 2;
    // double _x = 225;
    Log.d("ball x = $_x");
    _ball = Ball(num: "1", r: _r, x: _x, y: 0 + _r);

    controller = AnimationController(
        vsync: this, duration: const Duration(hours: 24 * 7));
    controller.addListener(() {
      _render();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          controller.stop();
          NavigatorUtil.goBack(context);
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("小球坠落"),
          ),
          body: CustomPaint(
            size: Size(_width, _height),
            painter: RunBallView(_ball, _area),
          ),
          // body: GestureDetector(
          //   behavior: HitTestBehavior.translucent,
          //   onTap: () {
          //     controller.forward();
          //   },
          //   child: Container(
          //     height: 150,
          //     width: 150,
          //     color: Colors.purpleAccent,
          //     child: Text("$_time"),
          //   ),
          // ),
        ));
  }
}
