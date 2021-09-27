import 'package:flutter/material.dart';
import 'package:flutter_test2/utils/log.dart';

class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    // Log.i("111111111111111111111111111");

    for (int i = 0; i < points.length - 1; i++) {
      // Log.d("points[i] = " + points[i].toString());
      // Log.d("points[i+1] = " + points[i + 1].toString());
      if (points[i].dx != 0 && points[i + 1].dx != 0) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}

class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  State<Signature> createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onPanDown: (DragDownDetails details) {
          Log.i("onPanDown" + details.localPosition.toString());
        },
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            Offset localPosition = details.localPosition;
            _points = List.from(_points)..add(localPosition);
            // Log.d("localPosition = " + localPosition.toString());
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(const Offset(0, 0)),
        child: CustomPaint(painter: SignaturePainter(_points)),
      ),
    );
  }
}

class SignatureDemo extends StatelessWidget {
  final String _title;

  const SignatureDemo(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
      ),
      body: const Signature(),
    );
  }
}
