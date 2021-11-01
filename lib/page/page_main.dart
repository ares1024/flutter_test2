import 'package:flutter/material.dart';
import 'package:flutter_test2/page/signature/my_signature_painter.dart';

import 'animation/my_fade_test.dart';
import 'home/my_home_test.dart';
import 'http/my_http_test.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageMainState();
}

const title1 = "计数";
const title2 = "动画";
const title3 = "签名";
const title4 = "网络请求";

class _PageMainState extends State<PageMain> {

  int _index = 0;
  final List<Widget> _bottomNavPages = [];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

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
    return Scaffold(
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
    );
  }
}
