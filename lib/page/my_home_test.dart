import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/base_page.dart';
import 'package:flutter_test2/utils/log.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget with BasePage {
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
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () => _incrementCounter(),
                color: Colors.red,
                textColor: Colors.white60,
                child: const Text('账号密码 登录'),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              MaterialButton(
                onPressed: () => _signInWithGoogle(),
                child: const Text("Google 登录"),
                color: Colors.amberAccent,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
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
        ],
      )),
    );
  }

  _cleanCounter() {
    setState(() {
      _counter = 0;
    });
  }

  ///检测 用户是不是已经登录
  void _checkUserSignIn() {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;

      _auth.getRedirectResult();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e("_checkUserSignIn e=  ${e.toString()}");
      }
    }
  }

  /// 登录google
  void _signInWithGoogle() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      Log.d("googleUser = ${googleUser.toString()}");

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      Log.d("googleAuth = ${googleAuth.toString()}");

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      Log.d("credential = ${credential.toString()}");

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      Log.d("authResult = ${authResult.toString()}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Log.e('Wrong password provided for that user.');
      } else {
        Log.e("_signInWithGoogle e = ${e.toString()}");
      }
    }
  }
}
