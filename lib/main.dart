import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/my_fade_test.dart';
import 'package:flutter_test2/page/my_home_test.dart';
import 'package:flutter_test2/page/my_http_test.dart';
import 'package:flutter_test2/page/my_signature_painter.dart';
import 'package:flutter_test2/routers/application.dart';
import 'package:flutter_test2/routers/routes.dart';

void main() async {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

const title1 = "计数";
const title2 = "动画";
const title3 = "签名";
const title4 = "网络请求";

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  final List<Widget> _bottomNavPages = [];

  @override
  void initState() {
    super.initState();
    _bottomNavPages
      ..add(const MyHomePage(title1))
      ..add(const MyFadeTest(title2))
      ..add(const SignatureDemo(title3))
      ..add(const MyHttpTest(title4));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _bottomNavPages[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: title1),
            BottomNavigationBarItem(icon: Icon(Icons.animation), label: title2),
            BottomNavigationBarItem(icon: Icon(Icons.brush), label: title3),
            BottomNavigationBarItem(icon: Icon(Icons.wifi), label: title4),
          ],
          currentIndex: _index,
          selectedItemColor: Colors.teal,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
