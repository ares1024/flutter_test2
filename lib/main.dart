import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/login/page_login_sign.dart';
import 'package:flutter_test2/page/page_main.dart';
import 'package:flutter_test2/routers/application.dart';
import 'package:flutter_test2/routers/routes.dart';
import 'package:flutter_test2/utils/log.dart';

void main() async {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget goWhere() {
    var user = FirebaseAuth.instance.currentUser;
    Log.i("goWhere user = ${user.toString()}");
    if (user == null) {
      return const PageLoginSign();
    } else {
      return const PageMain();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: goWhere());
  }
}
