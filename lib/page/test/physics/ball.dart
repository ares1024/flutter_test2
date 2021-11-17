import 'package:flutter/material.dart';
import 'package:flutter_test2/utils/log.dart';

class Ball {
  double aX; //加速度X
  double aY; //加速度Y
  double vX; // 速度X
  double vY; //速度Y
  double x; //坐标x
  double y; //坐标y
  double r; //半径
  Color color; //颜色
  String num;

  Ball(
      {this.aX = 0,
      this.aY = 0,
      this.vX = 0,
      this.vY = 0,
      this.x = 0,
      this.y = 0,
      this.r = 10,
      this.color = Colors.amberAccent,
      required this.num}); //编号

}

class RunBallView extends CustomPainter {
  final Ball _ball; //小球
  final Rect _area; //活动范围
  late Paint mPaint; // 小球的画笔
  late Paint bgPaint; //背景的画笔

  RunBallView(this._ball, this._area) {
    Log.i("RunBallView _area = $_area");
    mPaint = Paint()..color = _ball.color;
    bgPaint = Paint()..color = Colors.blueGrey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Log.i("ball paint size = $size");
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), bgPaint);
    _drawBall(canvas, _ball);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawBall(Canvas canvas, Ball ball) {
    canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint);
  }
}
